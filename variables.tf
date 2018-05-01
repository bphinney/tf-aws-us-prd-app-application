variable "prd_app_subnet_ids" {
  type    = "list"
  description = "A list of CIDRs for the App subnet tier, useful for security group ingress rules"
  default = ["10.18.14.0/24","10.18.15.0/24","10.18.16.0/24"]
}

variable "yarn_app_tier_ports" {
  type = "list"
  description = "A list of open ports required to be opened by Yarn/Samza"
  default = [
    "8088", # YARN - Resource Manager WebUI
    "8050", # YARN - Resource Manager
    "8025", # YARN - Resource Manager
    "8030", # YARN - Scheduler
    "8141", # YARN - Resource Manager
    "45454", # YARN - Node Manager
    "10200", # YARN - Timeline Server
    "8188", # YARN - Timeline Server
    "8190", # YARN - Timeline Server
    "19888" # YARN - Job History Service
  ]
}

variable "instance_key_name" {
  description = "The AWS key name to use when creating instances"
  default = "us-east-1"
}

variable "instance_profile" {
  description = "The AWS key name to use when creating instances"
  default = "ec2_bootstrap"
}

variable "instance_tags" {
  description = "Common tags shared across all instances"
  type = "map"
  default = {
    "environment" = "USPRD"
    "application" = "Momentum"
  }
}

variable "environment" {
  default = "USPRD"
}

variable "application_code" {
  default = "MOM"
}

variable "application" {
  default = "Momentum"
}

variable "full_subnet_cidr_blocks" {
  default = "10.0.0.0/8"
}

variable "rack" {
  default = "RAC1"
}

variable "root_volume_size" {
  default = "40"
}

variable "data_volume_size" {
  default = "200"
}

variable "momentum_elb_id" {
  default = "usprd-momentum-insight-web-elb"
}

variable "momentum_vpc_availability_zones" {
  type = "list"
  default = [
    "us-east-1a", 
    "us-east-1b", 
    "us-east-1c"
  ]
}

variable "momentum_elb_acm_certificate_id" {
  default = "us-east-1:048485690753:certificate/012cb23d-8f6c-44a0-a689-47294c9f34d1"
}

