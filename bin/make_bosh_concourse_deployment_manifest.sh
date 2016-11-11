#!/bin/bash
#
#  Please set the following environment variables:
#  $DB_PASSWORD
#  $CONCOURSE_URL
#  $GITHUB_ORG
#  $GITHUB_CLIENT_ID
#  $GITHUB_CLIENT_SECRET

set -e
test $DB_PASSWORD
test $CONCOURSE_URL
test $GITHUB_ORG
test $GITHUB_CLIENT_ID
test $GITHUB_CLIENT_SECRET

function getvars() {
  CONCOURSE_EIP=$(terraform output -state=terraform/environment/terraform.tfstate concourse_eip)
}

getvars

DIRECTOR_UUID=`bosh status --uuid`

echo "director_uuid = $DIRECTOR_UUID"
echo "concourse url = $CONCOURSE_URL"
echo "GitHub Org = $GITHUB_ORG"

cat >concourse.yml <<YAML
---
name: concourse

director_uuid: $DIRECTOR_UUID

releases:
- name: concourse
  version: latest
- name: garden-runc
  version: latest

stemcells:
- alias: trusty
  os: ubuntu-trusty
  version: latest

instance_groups:
- name: concourse
  instances: 1
  vm_type: concourse
  stemcell: trusty
  azs: [z1]
  networks:
  - name: public
    default: [dns, gateway]
  - name: vip
    static_ips: [$CONCOURSE_EIP]
  jobs:
  - name: atc
    release: concourse
    properties:
      external_url: $CONCOURSE_URL
      github_auth:
        authorize:
        - organization: $GITHUB_ORG
          teams: [cloud.gov.au]
        client_id: $GITHUB_CLIENT_ID
        client_secret: $GITHUB_CLIENT_SECRET

      postgresql_database: &atc_db atc
  - name: tsa
    release: concourse
    properties: {}

- name: db
  instances: 1
  vm_type: t2.small
  stemcell: trusty
  # choose a disk type from the cloud-config
  persistent_disk_type: 10G
  azs: [z1]
  networks: [{name: private1}]
  jobs:
  - name: postgresql
    release: concourse
    properties:
      databases:
      - name: *atc_db
        # make up a role and password
        role: dbrole
        password: $DB_PASSWORD

- name: worker
  instances: 1
  vm_type: worker
  stemcell: trusty
  azs: [z1]
  networks: [{name: private1}]
  jobs:
  - name: groundcrew
    release: concourse
    properties: {}

  - name: baggageclaim
    release: concourse
    properties: {}

  - name: garden
    release: garden-runc
    properties:
      garden:
        listen_network: tcp
        listen_address: 0.0.0.0:7777

update:
  canaries: 1
  max_in_flight: 1
  serial: false
  canary_watch_time: 1000-60000
  update_watch_time: 1000-60000
YAML
