data "terraform_remote_state" "us_vpc" {
  backend = "s3"
  config {
      bucket = "ncr.smb.terraform-state"
      key = "vpcs/us.tfstate"
      region = "us-east-1"
      profile = "prd"
  }
}

data "terraform_remote_state" "dns" {
  backend = "s3"
  config {
      bucket = "ncr.smb.terraform-state"
      key = "dns/dns.tfstate"
      region = "us-east-1"
      profile = "prd"
  }
}

data "terraform_remote_state" "us_ad" {
  backend = "s3"
  config {
      bucket = "ncr.smb.terraform-state"
      key = "ad/usprod.tfstate"
      region = "us-east-1"
      profile = "prd"
  }
}

