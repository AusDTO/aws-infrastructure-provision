#!/bin/bash
#


set -e
test $BOSH_PASSWORD

PRIVATE_KEY_PATH="./terraform/environment/bosh-ssh"

function getvars() {
  AWS_AZ=$(terraform output -state=terraform/environment/terraform.tfstate bosh_az)
  AWS_REGION=$(terraform output -state=terraform/environment/terraform.tfstate bosh_region)
  BOSH_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate bosh_subnet_id)
  BOSH_SUBNET_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate bosh_subnet_cidr)
  BOSH_SUBNET_IP=$(terraform output -state=terraform/environment/terraform.tfstate bosh_subnet_ip)
  BOSH_SUBNET_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate bosh_subnet_gateway)
  BOSH_SUBNET_DNS=$(terraform output -state=terraform/environment/terraform.tfstate bosh_subnet_dns)
  BOSH_EIP=$(terraform output -state=terraform/environment/terraform.tfstate bosh_eip)
  BOSH_SECURITY_GROUPS="$(terraform output -state=terraform/environment/terraform.tfstate bosh_security_groups)"
  BOSH_AWS_ACCESS_KEY_ID="$(terraform output -state=terraform/environment/terraform.tfstate bosh_user_access_key_id)"
  BOSH_AWS_SECRET_ACCESS_KEY="$(terraform output -state=terraform/environment/terraform.tfstate bosh_user_secret_access_key)"
  BOSH_KEYPAIR_NAME="$(terraform output -state=terraform/environment/terraform.tfstate bosh_keypair_name)"
  BOSH_S3_BUCKET_NAME="$(terraform output -state=terraform/environment/terraform.tfstate bosh_s3_bucket_id)"
}

getvars

cat >bosh-director.yml <<YAML
---
name: bosh

releases:
- name: bosh
  url: https://bosh.io/d/github.com/cloudfoundry/bosh?v=259
  sha1: 94cd3ade8549fbc6a02fcca349794ac40045c22c
- name: bosh-aws-cpi
  url: https://bosh.io/d/github.com/cloudfoundry-incubator/bosh-aws-cpi-release?v=60
  sha1: 8e40a9ff892204007889037f094a1b0d23777058

resource_pools:
- name: vms
  network: private
  stemcell:
    url: https://bosh.io/d/stemcells/bosh-aws-xen-hvm-ubuntu-trusty-go_agent?v=3263.10
    sha1: 42ea4577caec4aec463bed951cfdffb935961270
  cloud_properties:
    instance_type: c4.xlarge
    ephemeral_disk: {size: 25_000, type: gp2}
    availability_zone: $AWS_AZ

disk_pools:
- name: disks
  disk_size: 20_000
  cloud_properties: {type: gp2}

networks:
- name: private
  type: manual
  subnets:
  - range: $BOSH_SUBNET_CIDR
    gateway: $BOSH_SUBNET_GATEWAY
    dns: [$BOSH_SUBNET_DNS]
    cloud_properties: {subnet: $BOSH_SUBNET_ID}
- name: public
  type: vip

jobs:
- name: bosh
  instances: 1

  templates:
  - {name: nats, release: bosh}
  - {name: postgres, release: bosh}
  # - {name: blobstore, release: bosh}
  - {name: director, release: bosh}
  - {name: health_monitor, release: bosh}
  - {name: registry, release: bosh}
  - {name: aws_cpi, release: bosh-aws-cpi}

  resource_pool: vms
  persistent_disk_pool: disks

  networks:
  - name: private
    static_ips: [$BOSH_SUBNET_IP]
    default: [dns, gateway]
  - name: public
    static_ips: [$BOSH_EIP]

  properties:
    nats:
      address: 127.0.0.1
      user: nats
      password: $BOSH_PASSWORD

    postgres: &db
      listen_address: 127.0.0.1
      host: 127.0.0.1
      user: postgres
      password: $BOSH_PASSWORD
      database: bosh
      adapter: postgres

    registry:
      address: $BOSH_SUBNET_IP
      host: $BOSH_SUBNET_IP
      db: *db
      http: {user: admin, password: $BOSH_PASSWORD, port: 25777}
      username: admin
      password: $BOSH_PASSWORD
      port: 25777

    blobstore:
      provider: s3
      s3_region: $AWS_REGION
      access_key_id: $BOSH_AWS_ACCESS_KEY_ID
      secret_access_key: $BOSH_AWS_SECRET_ACCESS_KEY
      bucket_name: $BOSH_S3_BUCKET_NAME

    director:
      address: 127.0.0.1
      name: my-bosh
      db: *db
      cpi_job: aws_cpi
      max_threads: 10
      user_management:
        provider: local
        local:
          users:
          - {name: admin, password: $BOSH_PASSWORD}
          - {name: hm, password: $BOSH_PASSWORD}

    hm:
      director_account: {user: hm, password: $BOSH_PASSWORD}
      resurrector_enabled: true

    aws: &aws
      access_key_id: $BOSH_AWS_ACCESS_KEY_ID
      secret_access_key: $BOSH_AWS_SECRET_ACCESS_KEY
      default_key_name: $BOSH_KEYPAIR_NAME
      default_security_groups: $BOSH_SECURITY_GROUPS
      region: $AWS_REGION

    agent: {mbus: "nats://nats:$BOSH_PASSWORD@$BOSH_SUBNET_IP:4222"}

    ntp: &ntp [0.pool.ntp.org, 1.pool.ntp.org]

cloud_provider:
  template: {name: aws_cpi, release: bosh-aws-cpi}

  ssh_tunnel:
    host: $BOSH_EIP # <--- Replace with your Elastic IP address
    port: 22
    user: vcap
    private_key: $PRIVATE_KEY_PATH # Path relative to this manifest file

  mbus: "https://mbus:$BOSH_PASSWORD@$BOSH_EIP:6868" # <--- Replace with Elastic IP

  properties:
    aws: *aws
    agent: {mbus: "https://mbus:$BOSH_PASSWORD@0.0.0.0:6868"}
    blobstore: {provider: local, path: /var/vcap/micro_bosh/data/cache}
    ntp: *ntp
YAML
