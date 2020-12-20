# sitestack.cloud: \[Almost] one-click static website hosting in Amazon Web Services

**This is pre-release software.**

A CloudFormation stack to host a static website in your Amazon Web Services account.

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/releases.sitestack.cloud/latest.cf.yml">
  <img src="cloudformation-launch-stack-button-svg/launch-stack.svg" />
</a>

<!-- Deploy your own stack at: [sitestack.cloud](https://sitestack.cloud) -->

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

See [sitestack.cloud](https://sitestack.cloud).
First, make sure you have:

- An Amazon Web Services account.
- A domain name.
- A Hosted Zone for your custom domain, in the same account you’ll be deploying to.

To deploy the stack:

1. Click <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/releases.sitestack.cloud/latest.cf.yml"><img src="cloudformation-launch-stack-button-svg/launch-stack.svg" /></a>
1.



When you’re ready to publish your website, just upload it to the S3 bucket.

<p>Use the AWS web console. Fire up the AWS CLI. Write your own scripts. Grab a beautiful app like <a href="https://panic.com/transmit/">Transmit</a>. We even deploy an IAM user for your automated deployments to authenticate as. The choice is yours.</p>

<h3>Custom domain name and HTTPS</h3>

<p>As you’d expect, we’ll make your website available at <code class="url">https://<span class="placeholder">yourdomain.com</span></code>.</p>

<p>Because we care about security, we’ll redirect <code class="url">http://<span class="placeholder">yourdomain.com</span></code> to <code class="url">http<span style="color: var(--red);">s</span>://<span class="placeholder">yourdomain.com</span></code>.</p>

<p>And because we love when websites have canonical URLs, we’ll redirect <code class="url">www.<span class="placeholder">yourdomain.com</span></code> to <code class="url"><span class="placeholder">yourdomain.com</span></code> too.

<h3>Beautiful directory handling</h3>

<p>Say you want your contact details published at <code class="url">https://<span class="placeholder">yourdomain.com</span>/contact</code>.</p>

<p>To achieve that, you’ll need the directory structure <code class="path">…/contact/index.html</code>.</p>

<p>Traditional web servers will assume that any visitors requesting the <code class="path">contact</code> directory should <em>really</em> be served the <code class="path">index.html</code> file within.</p>

<p>But S3 isn’t a traditional web server. It's a literal key/value store. Your visitors would need to hit <code class="url">https://<span class="placeholder">yourdomain.com</span>/contact/index.html</code>. And that’s just ugly.</p>

<p>So, we deploy Lambda@Edge functions to make <code class="url">https://<span class="placeholder">yourdomain.com</span>/contact</code> beautiful.</p>

## Help!

### I uploaded some files, but my browser says my site "can't be found"!

The domain name records will take some time to propagate after the deployment. It could be minutes, or it could be hours. Chill, my friend.

### I uploaded some files, but my website still has the old versions!

CloudFront caches your files for some amount of time, so changes are not instantaneous. The duration will depend on the `DefaultTTL` you entered during the deployment. If the duration is too long for your tastes


## Thanks

Thanks, [Buildkite](https://github.com/buildkite)! [buildkite/cloudformation-launch-stack-button-svg](https://github.com/buildkite/cloudformation-launch-stack-button-svg) is used under the MIT License.
