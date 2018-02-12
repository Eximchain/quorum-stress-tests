Table of Contents
=================

   * [Quorum Network Stress Tests](#quorum-network-stress-tests)
   * [Reproducing a Test](#reproducing-a-test)
      * [Prerequisites](#prerequisites)
         * [Generate SSH key for EC2 instances](#generate-ssh-key-for-ec2-instances)
      * [Configure Variables](#configure-variables)
      * [Run the Test](#run-the-test)
         * [Launch Network with Terraform](#launch-network-with-terraform)
   * [Contributing a Test](#contributing-a-test)
      * [Creating the Directory](#creating-the-directory)
      * [Populating the Test Directory](#populating-the-test-directory)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)


# Quorum Network Stress Tests

This repository contains information about quorum stress tests.

Each module represents a set of tests. The terraform configuration to produce the test is saved along with any results.

# Reproducing a Test

Be warned that reproducing a test utilizes AWS resources, and your account will be charged for them.

## Prerequisites

* You must have AWS credentials at the default location (typically `~/.aws/credentials`)
* You must have Hashicorp Terraform installed on the machine you will be using to launch the test network

### Generate SSH key for EC2 instances

Generate an RSA key with ssh-keygen. This only needs to be done once. If you change the output file location you must change the key paths in the terraform variables file later.

```sh
$ ssh-keygen -t rsa -f ~/.ssh/quorum
# Enter a password if you wish
```

Add the key to your ssh agent. This must be done again if you restart your computer. If this is not done, it will cause problems provisioning the instances with terraform.

```sh
$ ssh-add ~/.ssh/quorum
# Enter your password if there is one
```

## Configure Variables

Copy the vars.tfvars file

```sh
$ TEST_DIR=<Directory of test to reproduce>
$ cd $TEST_DIR/terraform
$ cp vars.tfvars terraform.tfvars
```

Fill in your username as the `cert_owner`:

```sh
$ sed -i '' "s/FIXME_USER/$USER/" terraform.tfvars
```

Initialize terraform if you have not initialized this directory yet

```sh
$ terraform init
```

Also change the key paths if you did not use the suggested path for the SSH key

## Run the Test

### Launch Network with Terraform

Apply the terraform configuration

```sh
$ terraform apply
# Enter "yes" and wait for infrastructure creation
```

# Contributing a Test

We greatly appreciate contributions to this repository of tests. There are a large number of variables involved in the network and we hope, with community contributions, the community can eventually map out how they all interact.

Here are the guidelines for contributing a single test:

## Creating the Directory

Create a directory named using the following structure, where `N` is an integer ideally assigned in sequential order and `TEST_NAME` is a descriptive name for the test.

```
test-N-TEST_NAME
```

Letting the directory be `TEST_DIR`, create at least the following subdirectory and README files:

```sh
$ mkdir $TEST_DIR/terraform
$ touch $TEST_DIR/README.md
```

## Populating the Test Directory

The `README.md` file is to be used to present any notes, results, or data that someone examining the test results would need to know. It may contain all of the results of the test, or some of it may be placed in other folders. Relevant data placed in other files should be mentioned in the README.

The `terraform` directory should contain the configuration to reproduce the test. We recommend copying the contents of another test and modifying the relevant parts.

We welcome contributions including results from tests that cannot be reproduced by terraform, but our preference is to make as many tests as possible reproducible by this method.
