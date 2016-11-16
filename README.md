# AWS, Bosh and Concourse Infrastructure Provisioning
This repository will provision AWS infrastructure, BOSH and Concourse.  From there you'll be ready to deploy applications and services for your projects.

![Alt text](/aws-infrastructure-provision.jpg?raw=true "aws environment")
## prerequisites
- terraform installed (https://www.terraform.io)
- bosh-init installed (https://bosh.io/docs/install-bosh-init.html)
- bosh-cli installed (rubygem) (https://bosh.io/docs/bosh-cli.html)


## Steps
#### 1. terraform provisioning of AWS resources
- create the `./terraform/environment/terraform.tfvars` file describing the desired settings (example is provided in `terraform/environment/terraform.tfvars.example`)
  - populate your desired network cidr ranges for your VPC and subnets.
  - set the list of approved public ip addresses as `restricted_public_cidrs`.  These IPs will be permitted to connect to bosh and concourse (will be added as source IPs to security group rules)
- create an ssh keypair.
  - place public key as variable `bosh_ssh_public_key` in `./terraform/environment/terraform.tfvars`
  - store private key in `terraform/environment/bosh-ssh`
- set the following environment variables for your AWS environment. (a neat tool for managing environment variables for projects is [direnv](http://direnv.net/))

```
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-west-2"
```
- run terraform (typically takes 2-3 minutes)

```
$ cd terraform/environment
$ terraform get
$ terraform apply
```

#### 2. BOSH director
- Create configuration for the BOSH Director.  The following shell script queries terraform for details on created resources and populates required information in `bosh-director.yml`.

```
$ BOSH_PASSWORD=big-secret ./bin/make_bosh_manifest_s3.sh
```
- Deploy BOSH director with the `bosh-init` tool (can take ~20-40minutes)

```
$ bosh-init deploy bosh-director.yml
```
- Determine BOSH IP address and login using username `admin` and `big-secret`

```
$ bosh target `terraform output -state=terraform/environment/terraform.tfstate bosh_eip`
Target set to 'my-bosh'
Your username: admin
Enter password:
Logged in as 'admin'
```

#### 3. BOSH cloud-config
- Create BOSH cloud using the provided shell script.  This queries terraform for all the network details required and stores data in `bosh-cloud-config.yml`.

```
$ ./bin/make_cloud-config.sh
```
- Upload the cloud configuation to the bosh director

```
$ bosh update cloud-config ./bosh-cloud-config.yml
```


#### 4. Deploy Concourse

- Upload the latest stemcell for AWS

```
$ bosh upload stemcell https://bosh.io/d/stemcells/bosh-aws-xen-hvm-ubuntu-trusty-go_agent
```

- Upload the latest *concourse* and *garden-runc-release* bosh releases

```
$ bosh upload release https://bosh.io/d/github.com/concourse/concourse
$ bosh upload release https://bosh.io/d/github.com/cloudfoundry-incubator/garden-runc-release
```

- create a github oauth application and capture the *GITHUB_CLIENT_ID*, *GITHUB_CLIENT_SECRET*.  details are [here](http://concourse.ci/authentication.html)

- determine the concourse EIP

```
$ export CONCOURSE_EIP=$(terraform output -state=terraform/environment/terraform.tfstate concourse_eip)
```
 - create a bosh deployment manifest

```
$ GITHUB_CLIENT_ID=<GITHUB_CLIENT_ID> \
GITHUB_CLIENT_SECRET=<GITHUB_CLIENT_SECRET> \
CONCOURSE_URL=http://${CONCOURSE_EIP}:8080 \
GITHUB_ORG=AusDTO \
DB_PASSWORD=<big-secret-password> \
./bin/make_bosh_concourse_deployment_manifest.sh
```
- deploy concourse

```
$ bosh deployment concourse.yml
$ bosh deploy
```

- Browse to *http://${CONCOURSE_EIP}:8080*

----
TODO:
- move BOSH to private subnet
- provide option to use RDS for BOSH
- move concourse to private subnet
- move concourse to https
- deploy bastion host
- add more fine grain security groups for internal VPC comms
