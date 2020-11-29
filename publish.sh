#!/bin/bash -e

version="${1:?}"
local_path=website.cf.yml

sed -i "s/__VERSION/${version:?}/" "${local_path:?}"

s3_path="s3://cariad/aws-website"
s3_latest="${s3_path:?}/latest.cf.yml"

aws s3 cp "${local_path:?}" "${s3_latest:?}"
aws s3 cp "${s3_latest:?}"  "${s3_path:?}/${version:?}/latest.cf.yml"
