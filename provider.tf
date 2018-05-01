# define the providers to use here, this allows for resource creation across multiple accounts
provider "aws" {
  alias = "us_primary_prd"
  region = "us-east-1"
  profile = "prd"
}

provider "aws" {
  alias = "aws"
  region = "us-east-1"
  profile = "prd"
}

provider "aws" {
  alias = "us_parent"
  region = "us-east-1"
  profile = "parent"
}

provider "aws" {
  alias = "us_prd"
  region = "us-east-1"
  profile = "prd"
}
