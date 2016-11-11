#!/bin/bash
#


function getvars() {
  AWS_AZ1=$(terraform output -state=terraform/environment/terraform.tfstate aws_az1)
  AWS_AZ2=$(terraform output -state=terraform/environment/terraform.tfstate aws_az2)
  AWS_AZ3=$(terraform output -state=terraform/environment/terraform.tfstate aws_az3)
  DEFAULT_SECURITY_GROUP=$(terraform output -state=terraform/environment/terraform.tfstate allow_all_internal_security_group)
  CONCOURSE_SECURITY_GROUPS=$(terraform output -state=terraform/environment/terraform.tfstate concourse_security_group)
  BOSH_CLOUD_CONFIG_PUBLIC_A_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate public_a_cidr)
  BOSH_CLOUD_CONFIG_PUBLIC_B_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate public_b_cidr)
  BOSH_CLOUD_CONFIG_PUBLIC_C_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate public_c_cidr)
  BOSH_CLOUD_CONFIG_PUBLIC_A_DNS=$(terraform output -state=terraform/environment/terraform.tfstate public_a_dns)
  BOSH_CLOUD_CONFIG_PUBLIC_B_DNS=$(terraform output -state=terraform/environment/terraform.tfstate public_b_dns)
  BOSH_CLOUD_CONFIG_PUBLIC_C_DNS=$(terraform output -state=terraform/environment/terraform.tfstate public_c_dns)
  BOSH_CLOUD_CONFIG_PUBLIC_A_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate public_a_gateway)
  BOSH_CLOUD_CONFIG_PUBLIC_B_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate public_b_gateway)
  BOSH_CLOUD_CONFIG_PUBLIC_C_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate public_c_gateway)
  BOSH_CLOUD_CONFIG_PUBLIC_A_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate public_a_reserved)
  BOSH_CLOUD_CONFIG_PUBLIC_B_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate public_b_reserved)
  BOSH_CLOUD_CONFIG_PUBLIC_C_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate public_c_reserved)
  BOSH_CLOUD_CONFIG_PUBLIC_A_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate public_a_static)
  BOSH_CLOUD_CONFIG_PUBLIC_B_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate public_b_static)
  BOSH_CLOUD_CONFIG_PUBLIC_C_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate public_c_static)
  BOSH_CLOUD_CONFIG_PUBLIC_A_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate public_a_subnet_id)
  BOSH_CLOUD_CONFIG_PUBLIC_B_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate public_b_subnet_id)
  BOSH_CLOUD_CONFIG_PUBLIC_C_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate public_c_subnet_id)
  BOSH_CLOUD_CONFIG_MANAGEMENT_A_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate management_a_cidr)
  BOSH_CLOUD_CONFIG_MANAGEMENT_B_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate management_b_cidr)
  BOSH_CLOUD_CONFIG_MANAGEMENT_C_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate management_c_cidr)
  BOSH_CLOUD_CONFIG_MANAGEMENT_A_DNS=$(terraform output -state=terraform/environment/terraform.tfstate management_a_dns)
  BOSH_CLOUD_CONFIG_MANAGEMENT_B_DNS=$(terraform output -state=terraform/environment/terraform.tfstate management_b_dns)
  BOSH_CLOUD_CONFIG_MANAGEMENT_C_DNS=$(terraform output -state=terraform/environment/terraform.tfstate management_c_dns)
  BOSH_CLOUD_CONFIG_MANAGEMENT_A_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate management_a_gateway)
  BOSH_CLOUD_CONFIG_MANAGEMENT_B_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate management_b_gateway)
  BOSH_CLOUD_CONFIG_MANAGEMENT_C_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate management_c_gateway)
  BOSH_CLOUD_CONFIG_MANAGEMENT_A_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate management_a_reserved)
  BOSH_CLOUD_CONFIG_MANAGEMENT_B_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate management_b_reserved)
  BOSH_CLOUD_CONFIG_MANAGEMENT_C_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate management_c_reserved)
  BOSH_CLOUD_CONFIG_MANAGEMENT_A_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate management_a_static)
  BOSH_CLOUD_CONFIG_MANAGEMENT_B_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate management_b_static)
  BOSH_CLOUD_CONFIG_MANAGEMENT_C_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate management_c_static)
  BOSH_CLOUD_CONFIG_MANAGEMENT_A_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate management_a_subnet_id)
  BOSH_CLOUD_CONFIG_MANAGEMENT_B_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate management_b_subnet_id)
  BOSH_CLOUD_CONFIG_MANAGEMENT_C_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate management_c_subnet_id)
  BOSH_CLOUD_CONFIG_PRIVATE1_A_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate private1_a_cidr)
  BOSH_CLOUD_CONFIG_PRIVATE1_B_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate private1_b_cidr)
  BOSH_CLOUD_CONFIG_PRIVATE1_C_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate private1_c_cidr)
  BOSH_CLOUD_CONFIG_PRIVATE1_A_DNS=$(terraform output -state=terraform/environment/terraform.tfstate private1_a_dns)
  BOSH_CLOUD_CONFIG_PRIVATE1_B_DNS=$(terraform output -state=terraform/environment/terraform.tfstate private1_b_dns)
  BOSH_CLOUD_CONFIG_PRIVATE1_C_DNS=$(terraform output -state=terraform/environment/terraform.tfstate private1_c_dns)
  BOSH_CLOUD_CONFIG_PRIVATE1_A_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate private1_a_gateway)
  BOSH_CLOUD_CONFIG_PRIVATE1_B_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate private1_b_gateway)
  BOSH_CLOUD_CONFIG_PRIVATE1_C_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate private1_c_gateway)
  BOSH_CLOUD_CONFIG_PRIVATE1_A_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate private1_a_reserved)
  BOSH_CLOUD_CONFIG_PRIVATE1_B_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate private1_b_reserved)
  BOSH_CLOUD_CONFIG_PRIVATE1_C_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate private1_c_reserved)
  BOSH_CLOUD_CONFIG_PRIVATE1_A_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate private1_a_static)
  BOSH_CLOUD_CONFIG_PRIVATE1_B_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate private1_b_static)
  BOSH_CLOUD_CONFIG_PRIVATE1_C_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate private1_c_static)
  BOSH_CLOUD_CONFIG_PRIVATE1_A_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate private1_a_subnet_id)
  BOSH_CLOUD_CONFIG_PRIVATE1_B_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate private1_b_subnet_id)
  BOSH_CLOUD_CONFIG_PRIVATE1_C_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate private1_c_subnet_id)
  BOSH_CLOUD_CONFIG_PRIVATE2_A_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate private2_a_cidr)
  BOSH_CLOUD_CONFIG_PRIVATE2_B_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate private2_b_cidr)
  BOSH_CLOUD_CONFIG_PRIVATE2_C_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate private2_c_cidr)
  BOSH_CLOUD_CONFIG_PRIVATE2_A_DNS=$(terraform output -state=terraform/environment/terraform.tfstate private2_a_dns)
  BOSH_CLOUD_CONFIG_PRIVATE2_B_DNS=$(terraform output -state=terraform/environment/terraform.tfstate private2_b_dns)
  BOSH_CLOUD_CONFIG_PRIVATE2_C_DNS=$(terraform output -state=terraform/environment/terraform.tfstate private2_c_dns)
  BOSH_CLOUD_CONFIG_PRIVATE2_A_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate private2_a_gateway)
  BOSH_CLOUD_CONFIG_PRIVATE2_B_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate private2_b_gateway)
  BOSH_CLOUD_CONFIG_PRIVATE2_C_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate private2_c_gateway)
  BOSH_CLOUD_CONFIG_PRIVATE2_A_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate private2_a_reserved)
  BOSH_CLOUD_CONFIG_PRIVATE2_B_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate private2_b_reserved)
  BOSH_CLOUD_CONFIG_PRIVATE2_C_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate private2_c_reserved)
  BOSH_CLOUD_CONFIG_PRIVATE2_A_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate private2_a_static)
  BOSH_CLOUD_CONFIG_PRIVATE2_B_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate private2_b_static)
  BOSH_CLOUD_CONFIG_PRIVATE2_C_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate private2_c_static)
  BOSH_CLOUD_CONFIG_PRIVATE2_A_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate private2_a_subnet_id)
  BOSH_CLOUD_CONFIG_PRIVATE2_B_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate private2_b_subnet_id)
  BOSH_CLOUD_CONFIG_PRIVATE2_C_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate private2_c_subnet_id)
  BOSH_CLOUD_CONFIG_PRIVATE3_A_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate private3_a_cidr)
  BOSH_CLOUD_CONFIG_PRIVATE3_B_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate private3_b_cidr)
  BOSH_CLOUD_CONFIG_PRIVATE3_C_CIDR=$(terraform output -state=terraform/environment/terraform.tfstate private3_c_cidr)
  BOSH_CLOUD_CONFIG_PRIVATE3_A_DNS=$(terraform output -state=terraform/environment/terraform.tfstate private3_a_dns)
  BOSH_CLOUD_CONFIG_PRIVATE3_B_DNS=$(terraform output -state=terraform/environment/terraform.tfstate private3_b_dns)
  BOSH_CLOUD_CONFIG_PRIVATE3_C_DNS=$(terraform output -state=terraform/environment/terraform.tfstate private3_c_dns)
  BOSH_CLOUD_CONFIG_PRIVATE3_A_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate private3_a_gateway)
  BOSH_CLOUD_CONFIG_PRIVATE3_B_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate private3_b_gateway)
  BOSH_CLOUD_CONFIG_PRIVATE3_C_GATEWAY=$(terraform output -state=terraform/environment/terraform.tfstate private3_c_gateway)
  BOSH_CLOUD_CONFIG_PRIVATE3_A_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate private3_a_reserved)
  BOSH_CLOUD_CONFIG_PRIVATE3_B_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate private3_b_reserved)
  BOSH_CLOUD_CONFIG_PRIVATE3_C_RESERVED=$(terraform output -state=terraform/environment/terraform.tfstate private3_c_reserved)
  BOSH_CLOUD_CONFIG_PRIVATE3_A_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate private3_a_static)
  BOSH_CLOUD_CONFIG_PRIVATE3_B_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate private3_b_static)
  BOSH_CLOUD_CONFIG_PRIVATE3_C_STATIC=$(terraform output -state=terraform/environment/terraform.tfstate private3_c_static)
  BOSH_CLOUD_CONFIG_PRIVATE3_A_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate private3_a_subnet_id)
  BOSH_CLOUD_CONFIG_PRIVATE3_B_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate private3_b_subnet_id)
  BOSH_CLOUD_CONFIG_PRIVATE3_C_SUBNET_ID=$(terraform output -state=terraform/environment/terraform.tfstate private3_c_subnet_id)
}

getvars

cat >bosh-cloud-config.yml <<YAML
---
azs:
- name: z1
  cloud_properties: {availability_zone: $AWS_AZ1}
- name: z2
  cloud_properties: {availability_zone: $AWS_AZ2}
- name: z3
  cloud_properties: {availability_zone: $AWS_AZ3}

vm_types:
- name: default
  cloud_properties:
    instance_type: t2.micro
    # ephemeral_disk: {size: 3000, type: gp2}
    security_groups: [$DEFAULT_SECURITY_GROUP]
- name: compilation
  cloud_properties:
    instance_type: c4.large
    ephemeral_disk: {size: 10000, type: gp2}
    security_groups: [$DEFAULT_SECURITY_GROUP]
- name: concourse
  cloud_properties:
    instance_type: t2.medium
    ephemeral_disk: {size: 10000, type: gp2}
    security_groups: [$DEFAULT_SECURITY_GROUP, $CONCOURSE_SECURITY_GROUPS]
- name: worker
  cloud_properties:
    instance_type: t2.medium
    ephemeral_disk: {size: 50000, type: gp2}
    security_groups: [$DEFAULT_SECURITY_GROUP]
- name: t2.micro
  cloud_properties:
    instance_type: t2.micro
    # ephemeral_disk: {size: 3000, type: gp2}
    security_groups: [$DEFAULT_SECURITY_GROUP]
- name: t2.small
  cloud_properties:
    instance_type: t2.small
    # ephemeral_disk: {size: 10000, type: gp2}
    security_groups: [$DEFAULT_SECURITY_GROUP]
- name: t2.medium
  cloud_properties:
    instance_type: t2.medium
    # ephemeral_disk: {size: 10000, type: gp2}
    security_groups: [$DEFAULT_SECURITY_GROUP]


disk_types:
- name: default
  disk_size: 5000
  cloud_properties: {type: gp2}
- name: 10G
  disk_size: 10_000
  cloud_properties: {type: gp2}
- name: 50G
  disk_size: 50_000
  cloud_properties: {type: gp2}
- name: 100G
  disk_size: 100_000
  cloud_properties: {type: gp2}
- name: 200G
  disk_size: 200_000
  cloud_properties: {type: gp2}

networks:
- name: public
  type: manual
  subnets:
  - az: z1
    range: $BOSH_CLOUD_CONFIG_PUBLIC_A_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PUBLIC_A_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PUBLIC_A_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PUBLIC_A_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PUBLIC_A_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PUBLIC_A_SUBNET_ID}
  - az: z2
    range: $BOSH_CLOUD_CONFIG_PUBLIC_B_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PUBLIC_B_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PUBLIC_B_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PUBLIC_B_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PUBLIC_B_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PUBLIC_B_SUBNET_ID}
  - az: z3
    range: $BOSH_CLOUD_CONFIG_PUBLIC_C_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PUBLIC_C_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PUBLIC_C_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PUBLIC_C_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PUBLIC_C_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PUBLIC_C_SUBNET_ID}
- name: management
  type: manual
  subnets:
  - az: z1
    range: $BOSH_CLOUD_CONFIG_MANAGEMENT_A_CIDR
    dns: [$BOSH_CLOUD_CONFIG_MANAGEMENT_A_DNS]
    gateway: $BOSH_CLOUD_CONFIG_MANAGEMENT_A_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_MANAGEMENT_A_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_MANAGEMENT_A_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_MANAGEMENT_A_SUBNET_ID}
  - az: z2
    range: $BOSH_CLOUD_CONFIG_MANAGEMENT_B_CIDR
    dns: [$BOSH_CLOUD_CONFIG_MANAGEMENT_B_DNS]
    gateway: $BOSH_CLOUD_CONFIG_MANAGEMENT_B_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_MANAGEMENT_B_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_MANAGEMENT_B_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_MANAGEMENT_B_SUBNET_ID}
  - az: z3
    range: $BOSH_CLOUD_CONFIG_MANAGEMENT_C_CIDR
    dns: [$BOSH_CLOUD_CONFIG_MANAGEMENT_C_DNS]
    gateway: $BOSH_CLOUD_CONFIG_MANAGEMENT_C_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_MANAGEMENT_C_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_MANAGEMENT_C_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_MANAGEMENT_C_SUBNET_ID}
- name: private1
  type: manual
  subnets:
  - az: z1
    range: $BOSH_CLOUD_CONFIG_PRIVATE1_A_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PRIVATE1_A_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PRIVATE1_A_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PRIVATE1_A_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PRIVATE1_A_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PRIVATE1_A_SUBNET_ID}
  - az: z2
    range: $BOSH_CLOUD_CONFIG_PRIVATE1_B_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PRIVATE1_B_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PRIVATE1_B_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PRIVATE1_B_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PRIVATE1_B_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PRIVATE1_B_SUBNET_ID}
  - az: z3
    range: $BOSH_CLOUD_CONFIG_PRIVATE1_C_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PRIVATE1_C_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PRIVATE1_C_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PRIVATE1_C_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PRIVATE1_C_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PRIVATE1_C_SUBNET_ID}
- name: private2
  type: manual
  subnets:
  - az: z1
    range: $BOSH_CLOUD_CONFIG_PRIVATE2_A_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PRIVATE2_A_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PRIVATE2_A_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PRIVATE2_A_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PRIVATE2_A_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PRIVATE2_A_SUBNET_ID}
  - az: z2
    range: $BOSH_CLOUD_CONFIG_PRIVATE2_B_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PRIVATE2_B_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PRIVATE2_B_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PRIVATE2_B_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PRIVATE2_B_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PRIVATE2_B_SUBNET_ID}
  - az: z3
    range: $BOSH_CLOUD_CONFIG_PRIVATE2_C_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PRIVATE2_C_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PRIVATE2_C_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PRIVATE2_C_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PRIVATE2_C_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PRIVATE2_C_SUBNET_ID}
- name: private3
  type: manual
  subnets:
  - az: z1
    range: $BOSH_CLOUD_CONFIG_PRIVATE3_A_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PRIVATE3_A_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PRIVATE3_A_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PRIVATE3_A_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PRIVATE3_A_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PRIVATE3_A_SUBNET_ID}
  - az: z2
    range: $BOSH_CLOUD_CONFIG_PRIVATE3_B_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PRIVATE3_B_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PRIVATE3_B_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PRIVATE3_B_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PRIVATE3_B_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PRIVATE3_B_SUBNET_ID}
  - az: z3
    range: $BOSH_CLOUD_CONFIG_PRIVATE3_C_CIDR
    dns: [$BOSH_CLOUD_CONFIG_PRIVATE3_C_DNS]
    gateway: $BOSH_CLOUD_CONFIG_PRIVATE3_C_GATEWAY
    reserved: [$BOSH_CLOUD_CONFIG_PRIVATE3_C_RESERVED]
    static: [$BOSH_CLOUD_CONFIG_PRIVATE3_C_STATIC]
    cloud_properties: {subnet: $BOSH_CLOUD_CONFIG_PRIVATE3_C_SUBNET_ID}

- name: vip
  type: vip

compilation:
  workers: 5
  reuse_compilation_vms: true
  az: z1
  vm_type: compilation
  network: private1
YAML
