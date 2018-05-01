#!/bin/sh

terraform remote config \
    -backend=s3 \
    -backend-config="bucket=ncr.smb.terraform-state" \
    -backend-config="key=instances/prd/momentum/us.tfstate" \
    -backend-config="region=us-east-1" \
    -backend-config="profile=prd" \
    -pull=false
