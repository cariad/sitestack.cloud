# sitestack.cloud

**(Almost) one-click static website hosting in Amazon Web Services.**

![](website/promo.gif)

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/releases.sitestack.cloud/latest.cf.yml"><img src="website/cloudformation-launch-stack-button-svg/launch-stack.svg" /></a>

## What does sitestack.cloud deploy?

- An **S3 bucket** to upload your website to.
- A **certificate** to support HTTPS on your custom domain.
- A HTTP/2, IPv6-enabled **CloudFront distribution** with:
    - …a **CloudFront cache policy** with a configurable time-to-live, and allows cachebusting via query strings.
    - …a **CloudFront origin access identity**, which allows the distribution to read your S3 bucket without the need to make it publicly readable.
- **Route53 record sets** to make your website available at your custom domain.
- A **publisher (IAM user)** for your tools and automated deployments.
- An **origin-request Lambda@Edge function** to serve `index.html` when a directory is requested.
- An **origin-response Lambda@Edge function** to add `Strict-Transport-Security` and `X-Content-Type-Options` headers for defensive HTTPS.
- A **viewer-request Lamda@Edge function** to redirect visitors from `www.*` to your root domain.

## Deploying

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/releases.sitestack.cloud/latest.cf.yml"><img src="website/cloudformation-launch-stack-button-svg/launch-stack.svg" /></a>

Click **Launch Stack** to jump directly into the stack deployment, or read the guide at [sitestack.cloud](https://sitestack.cloud).

## Thanks

Thanks, [Buildkite](https://github.com/buildkite)! [buildkite/cloudformation-launch-stack-button-svg](https://github.com/buildkite/cloudformation-launch-stack-button-svg) is used under the MIT License.
