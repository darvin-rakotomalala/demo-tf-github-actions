## Terraform with GitHub Actions example

In this repository, we will explore managing infrastructure with Terraform and GitHub actions.

**Why Automate Terraform?**

- **Consistency**: Ensure infrastructure is always deployed the same way.
- **Speed**: Automate repetitive tasks like ```terraform plan``` and ```terraform apply```.
- **Collaboration**: Enable team members to review and approve changes.

### STEPS

- Step 1: Set Up a GitHub Actions Pipeline
- Step 2. Add AWS Credentials: Go to your GitHub repository → Settings → Secrets → Actions. Add: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
- Step 3. Push Changes: Commit and push the workflow file to trigger the pipeline.

### Tips for troubleshooting GitHub Actions workflows

Troubleshooting GitHub Actions Workflows can be cumbersome due to the complexity and variety of tasks they can perform. Here is a list of tips to identify and resolve issues:

- **Check the logs** — This is your starting point for examining what happens in your GitHub actions workflow. Generally, GitHub Actions provides detailed logs for all the steps in your workflow. Identify the error messages and try to address them.
- **Run scripts locally** — If your workflow uses any kind of scripts, try to run them locally if possible. This will speed up the debugging process and help you identify errors much faster.
- **Use debugging tools** — Several tools are available for debugging your workflows. You can set ACTIONS_STEP_DEBUG secret to true, inside your repository to provide verbose logging.
- **Check for syntax errors** — Ensure your workflow file is correctly formatted and free of errors. You can use yaml linters for this.
- **Version pinning** — Pin actions and dependencies to specific versions to ensure that no breaking changes are added in minor/major updates.
- **Examine env vars and secrets** — Make sure that all env vars and secrets are accurately set and can be accessed in the workflow.
- **Temporarily simplify the workflow** — Remove some of the steps, until you identify the errors in your workflow and address them.
- **Review dependencies** — Especially if you are not pinning versions, changes in some of the dependencies may break the current functionality of your workflow, so it is always useful to review the dependencies.

### Terraform in GitHub Actions: Best Practices

Using Terraform in GitHub Actions can be a powerful way to implement IaC in a CI/CD pipeline. Here are some best practices you should follow when you are defining the workflow:

1. **_Use Remote State_**: Store state files in S3 or Terraform Cloud.
2. **_Enable Manual Approvals_**: Require approval for terraform apply. 3.**Secure Secrets**: Use CI/CD tools’ secret management features.
3. **Test Changes**: Run terraform plan on pull requests.
4. **Use a specific Terraform version** — This ensures consistency across different runs and helps in avoiding unexpected behaviors due to upgrades.
5. **Take advantage of remote state** — State files can contain sensitive information, so use a secure storage such as AWS S3, Azure Blob Storage, or others to ensure your data is encrypted. Also, implement state locking to avoid conflicts. If you don’t use a remote state, your infrastructure will be created every time you run an apply, as your configuration won’t be aware that the infrastructure was created before.
6. **Use dynamic credentials** — The best way to authenticate to your cloud provider is by leveraging dynamic credentials, as they are short-lived and protect against breaches.
7. **Use environment variables for secrets if you are not using dynamic credentials** — This will ensure that at least you are not hardcoding sensitive information.
8. **Automate formatting and validation** — This will reduce the time and costs associated with your runs, as you will be able to identify errors before even running a Terraform plan.
9. **Integrate security vulnerability scanning tools** — In the long run, when you scale, you will add security vulnerabilities in your code without even noticing. That’s why security vulnerability scanning tools are really helpful. as you can see these vulnerabilities before deploying the actual code
10. **Create a plan → apply workflow** — It is imperative to see what’s going to change, before actually making the change, as you can make multiple mistakes with your code changes. Also, commenting the plan on a pull-request and ensuring that all engineers involved in the process review it thoroughly is crucial.
11. **Implement RBAC** — Ensure your runner has only the necessary permissions to run the tasks you want. Use RBAC on the cloud provider side to manage what actions Terraform can perform.
12. **Test your code** — Take advantage of Terratest or Terraform’s native test framework to ensure your infrastructure changes work as expected.
13. **Implement OPA policies** — Policies can help you with ensuring all your organization’s standards are met.
