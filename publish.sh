#!/bin/bash -e

# PUBLISH TEMPLATE

version="${1:?}"
local_path=cloudformation/stack.cf.yml

sed -i "s/__VERSION__/${version:?}/" "${local_path:?}"

s3_path="s3://releases.sitestack.cloud"
s3_latest="${s3_path:?}/latest.cf.yml"

aws s3 cp "${local_path:?}" "${s3_latest:?}"
aws s3 cp "${s3_latest:?}"  "${s3_path:?}/${version:?}.cf.yml"

# PUBLISH WEBSITE

AWS_ACCESS_KEY_ID="${WEBSITE_AWS_ACCESS_KEY_ID:?}"         \
AWS_SECRET_ACCESS_KEY="${WEBSITE_AWS_SECRET_ACCESS_KEY:?}" \
aws s3 sync --delete website s3://sitestackcloud-bucket-jd9xycjb5vnz
