#
# Provider Configuration
#

provider "aws" {
  region = "${var.region}"
}

# Using this data source allows the configuration to be
# generic for any region.
data "aws_availability_zones" "available" {}
