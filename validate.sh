#!/bin/bash -e

echo "Linting scripts..."
find . -name '*.sh' -exec shellcheck -o all --severity style -x {} +

echo "Linting YAML..."
yamllint .

echo "Validating CloudFormation..."
while IFS="" read -r dir_path
do
  aws cloudformation validate-template \
    --template-body file://"${dir_path}" > /dev/null
done < <(find . -name "*.cf.yml")

echo "OK!"
