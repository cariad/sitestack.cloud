# sitestack.cloud: Almost one-click static website hosting in Amazon Web Services

**This is pre-release software.**

Deploy your own stack at: [sitestack.cloud](https://sitestack.cloud)

## What is thia?

[sitestack.cloud](https://sitestack.cloud) will deploy a stack to host a static website in your Amazon Web Services account.

## What exactly does it deploy?

- An S3 bucket, for you to drop your website files into.
- An IAM user with permission to upload files, for you to use in your deployment pipeline -- unless you want to drag files in manually, in which case _be my guest!_
- A certificate to support HTTPS, and a lambda function to enforce HTTPS.
- Route53 record sets to validate your certificate and direct visitors to your website.
- A CloudFront distribution, to cache your website globally.
- A lambda function to ensure that visitors requesting `foo.com/bar` are invisibly served `foo.com/bar/index.html`.
- A lambda function to ensure that visitors requesting `www.foo.com` are redirected to `foo.com`.

## What kinds of security are in place?

- The S3 bucket is not publicly-accessible. Only the CloudFront distribution can read from it.
- The stack deploys a certificate to support HTTPS, and a lambda function to enforce HTTPS.
- The lambda functions have the minimum required access to your account. In fact, they have permission only to create logs.

## Prerequisites

- You must have a domain name registered, associated with a Hosted Zone in the same AWS account that you intend to deploy to, and not currently pointing to a website.

## Deploying

### First time

TODO.

<!-- Visit [cariad.github.io/website-stack](https://cariad.github.io/website-stack/) or click [Launch Stack](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://releases.sitestack.cloud.s3.eu-west-2.amazonaws.com/latest.cf.yml). -->

**Deployment could take ~20 minutes. Don't panic!**

TODO.

<!-- <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://releases.sitestack.cloud.s3.eu-west-2.amazonaws.com/latest.cf.yml">
  <img src="docs/images/cloudformation-launch-stack-button-svg/launch-stack.svg">
</a> -->

### Redeploying

TODO.

<!-- Find the stack in the CloudFormation console, then click **Update Stack**. You can use the same stack again if you only want to change a value, or apply the updated template at `https://releases.sitestack.cloud.s3.eu-west-2.amazonaws.com/latest.cf.yml` to pick up the latest and greatest changes. -->

## Uploading files

### Manually

The name of your new S3 bucket will be shown in the **Outputs** tab, or you could browse for it in your S3 console. It'll be named something like `<Site ID>-bucket-<random characters>`.

Open that bucket in the S3 console then upload your files.

### In a deployment pipeline

An IAM user was created for you to support automated deployments:

1. Find the username in the **Outputs** tab.
1. Find and open the user in the IAM console.


## Help!

### I uploaded some files, but my browser says my site "can't be found"!

The domain name records will take some time to propagate after the deployment. It could be minutes, or it could be hours. Chill, my friend.

### I uploaded some files, but my website still has the old versions!

CloudFront caches your files for some amount of time, so changes are not instantaneous. The duration will depend on the `DefaultTTL` you entered during the deployment. If the duration is too long for your tastes




## Thanks

Thanks, [Buildkite](https://github.com/buildkite)! [buildkite/cloudformation-launch-stack-button-svg](https://github.com/buildkite/cloudformation-launch-stack-button-svg) is used under the MIT License.
