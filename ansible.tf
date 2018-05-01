module "logstash-ansible" {
  #source = "../modules/logstash-ansible"
  source = "git::https://bitbucket.org/ncrsilverintl/tf-aws-momentum-logstash-ansible.git?ref=1.0.18"

  name = "${var.environment}${var.application_code}LS1"
  ami = "${data.aws_ami.ubuntu16.id}"
  vpc_id = "${data.terraform_remote_state.us_vpc.us_prd_vpc_id}"
  domain = "${data.terraform_remote_state.us_ad.usprod_us_domain}"
  domain_user = "${data.terraform_remote_state.us_ad.usprod_us_domain_user}"
  domain_pass = "${data.terraform_remote_state.us_ad.usprod_us_domain_pass}"
  instance_type = "m5.large"
  instance_count = 1
  instance_key_name = "${var.instance_key_name}"
  root_volume_size = 40
  data_volume_size = 200
  data_volume_device = "nvme1n1"
  data_volume_label = "opt"
  vpc_subnet_ids = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_ids}"
  app_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_cidr_blocks}"
  db_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_db_subnet_cidr_blocks}"
  iam_instance_profile = "${var.instance_profile}"
  application            = "${var.application}"
  application_code       = "${var.application_code}"
  environment = "${var.environment}"
  route_zone_id = "${data.terraform_remote_state.dns.us_dns_zone_id}"
}

module "cassandra-ansible" {
  #source = "../modules/cassandra-ansible"
  source = "git::https://bitbucket.org/ncrsilverintl/tf-aws-momentum-cassandra-ansible.git?ref=1.0.18"

  name = "${var.environment}${var.application_code}CAS1"
  ami = "${data.aws_ami.ubuntu16.id}"
  vpc_id = "${data.terraform_remote_state.us_vpc.us_prd_vpc_id}"
  domain = "${data.terraform_remote_state.us_ad.usprod_us_domain}"
  domain_user = "${data.terraform_remote_state.us_ad.usprod_us_domain_user}"
  domain_pass = "${data.terraform_remote_state.us_ad.usprod_us_domain_pass}"
  instance_type = "m5.xlarge"
  instance_count = 6
  instance_key_name = "${var.instance_key_name}"
  root_volume_size = 40
  data_volume_size = 1000
  data_volume_device = "nvme1n1"
  data_volume_label = "data"
  vpc_subnet_ids = "${data.terraform_remote_state.us_vpc.us_prd_db_subnet_ids}"
  app_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_cidr_blocks}"
  db_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_db_subnet_cidr_blocks}"
  iam_instance_profile = "${var.instance_profile}"
  application            = "${var.application}"
  application_code       = "${var.application_code}"
  environment = "${var.environment}"
  route_zone_id = "${data.terraform_remote_state.dns.us_dns_zone_id}"
}

module "kafka-ansible" {
  #source = "../modules/kafka-ansible"
  source = "git::https://bitbucket.org/ncrsilverintl/tf-aws-momentum-kafka-ansible.git?ref=1.0.18"

  name = "${var.environment}${var.application_code}KAFKA1"
  ami = "${data.aws_ami.ubuntu16.id}"
  vpc_id = "${data.terraform_remote_state.us_vpc.us_prd_vpc_id}"
  domain = "${data.terraform_remote_state.us_ad.usprod_us_domain}"
  domain_user = "${data.terraform_remote_state.us_ad.usprod_us_domain_user}"
  domain_pass = "${data.terraform_remote_state.us_ad.usprod_us_domain_pass}"
  instance_type = "m5.xlarge"
  instance_count = 6
  instance_key_name = "${var.instance_key_name}"
  root_volume_size = 40
  data_volume_size = 1000
  data_volume_device = "nvme1n1"
  data_volume_label = "data"
  vpc_subnet_ids = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_ids}"
  app_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_cidr_blocks}"
  db_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_db_subnet_cidr_blocks}"
  iam_instance_profile = "${var.instance_profile}"
  application            = "${var.application}"
  application_code       = "${var.application_code}"
  environment = "${var.environment}"
  route_zone_id = "${data.terraform_remote_state.dns.us_dns_zone_id}"
}

module "zookeeper-ansible" {
  #source = "../modules/zookeeper-ansible"
  source = "git::https://bitbucket.org/ncrsilverintl/tf-aws-momentum-zookeeper-ansible.git?ref=1.0.18"

  name = "${var.environment}${var.application_code}ZK1"
  ami = "${data.aws_ami.ubuntu16.id}"
  vpc_id = "${data.terraform_remote_state.us_vpc.us_prd_vpc_id}"
  domain = "${data.terraform_remote_state.us_ad.usprod_us_domain}"
  domain_user = "${data.terraform_remote_state.us_ad.usprod_us_domain_user}"
  domain_pass = "${data.terraform_remote_state.us_ad.usprod_us_domain_pass}"
  instance_type = "m5.large"
  instance_count = 3
  instance_key_name = "${var.instance_key_name}"
  root_volume_size = 40
  data_volume_size = 200
  data_volume_device = "nvme1n1"
  data_volume_label = "data"
  vpc_subnet_ids = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_ids}"
  app_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_cidr_blocks}"
  db_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_db_subnet_cidr_blocks}"
  iam_instance_profile = "${var.instance_profile}"
  application            = "${var.application}"
  application_code       = "${var.application_code}"
  environment = "${var.environment}"
  route_zone_id = "${data.terraform_remote_state.dns.us_dns_zone_id}"
}

module "haproxy-ansible" {
  #source = "../tf-aws-momentum-haproxy-ansible"
  source = "git::https://bitbucket.org/ncrsilverintl/tf-aws-momentum-haproxy-ansible.git?ref=1.0.36"

  name = "${var.environment}${var.application_code}HAP1"
  ami = "${data.aws_ami.ubuntu16.id}"
  vpc_id = "${data.terraform_remote_state.us_vpc.us_prd_vpc_id}"
  domain = "${data.terraform_remote_state.us_ad.usprod_us_domain}"
  domain_user = "${data.terraform_remote_state.us_ad.usprod_us_domain_user}"
  domain_pass = "${data.terraform_remote_state.us_ad.usprod_us_domain_pass}"
  instance_type = "t2.small"
  instance_count = 3
  instance_key_name = "${var.instance_key_name}"
  root_volume_size = 40
  data_volume_size = 60
  data_volume_device = "xvdb"
  data_volume_label = "opt"
  vpc_subnet_ids = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_ids}"
  app_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_cidr_blocks}"
  db_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_db_subnet_cidr_blocks}"
  dmz_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_dmz_subnet_cidr_blocks}"
  momentum_elb_vpc_subnet_ids = "${data.terraform_remote_state.us_vpc.us_prd_dmz_subnet_ids}"
  momentum_vpc_availability_zones = "${var.momentum_vpc_availability_zones}"
  momentum_elb_acm_certificate_id = "${var.momentum_elb_acm_certificate_id}"
  iam_instance_profile = "${var.instance_profile}"
  application            = "${var.application}"
  application_code       = "${var.application_code}"
  environment = "${var.environment}"
  route_zone_id = "${data.terraform_remote_state.dns.us_dns_zone_id}"
  public_route_zone_id = "${data.terraform_remote_state.dns.ncrsmb_com_public_dns_zone_id}"
}

module "yarn-ansible" {
  #source = "../../tf-aws-momentum-yarn-ansible"
  source = "git::https://bitbucket.org/ncrsilverintl/tf-aws-momentum-yarn-ansible.git?ref=1.0.19"

  name = "${var.environment}${var.application_code}YARN1"
  ami = "${data.aws_ami.ubuntu16.id}"
  vpc_id = "${data.terraform_remote_state.us_vpc.us_prd_vpc_id}"
  domain = "${data.terraform_remote_state.us_ad.usprod_us_domain}"
  domain_user = "${data.terraform_remote_state.us_ad.usprod_us_domain_user}"
  domain_pass = "${data.terraform_remote_state.us_ad.usprod_us_domain_pass}"
  instance_type = "m5.xlarge"
  instance_count = 5
  instance_key_name = "${var.instance_key_name}"
  root_volume_size = 40
  data_volume_size = 200
  data_volume_device = "nvme1n1"
  data_volume_label = "data"
  vpc_subnet_ids = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_ids}"
  app_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_cidr_blocks}"
  full_subnet_cidr_blocks = "${var.full_subnet_cidr_blocks}"
  db_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_db_subnet_cidr_blocks}"
  iam_instance_profile = "${var.instance_profile}"
  application            = "${var.application}"
  application_code       = "${var.application_code}"
  environment = "${var.environment}"
  route_zone_id = "${data.terraform_remote_state.dns.us_dns_zone_id}"
  public_route_zone_id = "${data.terraform_remote_state.dns.ncrsmb_com_public_dns_zone_id}"
}

module "impulse-ansible" {
  #source = "../modules/impulse-ansible"
  source = "git::https://bitbucket.org/ncrsilverintl/tf-aws-momentum-impulse-ansible.git?ref=1.0.4"

  name = "${var.environment}${var.application_code}IMP1"
  ami = "${data.aws_ami.ubuntu16.id}"
  vpc_id = "${data.terraform_remote_state.us_vpc.us_prd_vpc_id}"
  domain = "${data.terraform_remote_state.us_ad.usprod_us_domain}"
  domain_user = "${data.terraform_remote_state.us_ad.usprod_us_domain_user}"
  domain_pass = "${data.terraform_remote_state.us_ad.usprod_us_domain_pass}"
  instance_type = "m5.xlarge"
  instance_count = 3
  instance_key_name = "${var.instance_key_name}"
  root_volume_size = 40
  data_volume_size = 100
  data_volume_device = "nvme1n1"
  data_volume_label = "opt"
  vpc_subnet_ids = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_ids}"
  app_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_cidr_blocks}"
  db_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_db_subnet_cidr_blocks}"
  iam_instance_profile = "${var.instance_profile}"
  application            = "${var.application}"
  application_code       = "${var.application_code}"
  environment = "${var.environment}"
  route_zone_id = "${data.terraform_remote_state.dns.us_dns_zone_id}"
}

module "insight-ansible" {
  #source = "../modules/insight-ansible"
  source = "git::https://bitbucket.org/ncrsilverintl/tf-aws-momentum-insight-ansible.git?ref=1.0.4"

  name = "${var.environment}${var.application_code}INS1"
  ami = "${data.aws_ami.ubuntu16.id}"
  vpc_id = "${data.terraform_remote_state.us_vpc.us_prd_vpc_id}"
  domain = "${data.terraform_remote_state.us_ad.usprod_us_domain}"
  domain_user = "${data.terraform_remote_state.us_ad.usprod_us_domain_user}"
  domain_pass = "${data.terraform_remote_state.us_ad.usprod_us_domain_pass}"
  instance_type = "m5.large"
  instance_count = 2
  instance_key_name = "${var.instance_key_name}"
  root_volume_size = 40
  data_volume_size = 200
  data_volume_device = "nvme1n1"
  data_volume_label = "opt"
  vpc_subnet_ids = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_ids}"
  app_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_app_subnet_cidr_blocks}"
  db_subnet_cidr_blocks = "${data.terraform_remote_state.us_vpc.us_prd_db_subnet_cidr_blocks}"
  iam_instance_profile = "${var.instance_profile}"
  application            = "${var.application}"
  application_code       = "${var.application_code}"
  environment = "${var.environment}"
  route_zone_id = "${data.terraform_remote_state.dns.us_dns_zone_id}"
}
