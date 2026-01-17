# Guide: Updating our Infrastructure

Infrastructure as Code (IaC) is not set in stone. One of its greatest strengths is its **malleability**. This guide explains how to safely evolve our platform.

## The "Mistake-Friendly" Workflow

In traditional infrastructure, a mistake (like naming a server wrong) might stay that way for years because it'''s too much work to change. In our centralized Terraform setup, the cost of correction is nearly zero.

### Case Study: Renaming the API Domains

Initially, we deployed the API with generic names:
- `api-staging.mario.productions`

We realized this was a mistake because we plan to have multiple projects, and "api-staging" is too ambiguous. We needed:
- `api-best-shot-staging.mario.productions`

#### How we fixed it:

1. **Change the Code:** We simply updated the string in `project-api-best-shot.tf`.
2. **Review the Plan:** We ran `terraform plan`. Terraform noticed the change and reported:
   - `-/+ destroy and then create replacement`
   - It showed exactly which DNS records would be deleted and which new ones would be created.
3. **Apply the Change:** We ran `terraform apply`. Terraform handled the deletion from Railway and AWS, and the subsequent recreation, in about 60 seconds.

## Standard Update Procedure

### Prerequisites: Environment Variables
Before running any commands, ensure your API tokens are loaded. If you use a `.env` file:
```bash
export $(grep -v '^#' .env | xargs)
```

Whenever you want to change, add, or remove infrastructure:

### 1. Modify the `.tf` files
Whether it'''s changing a bucket name, adding a new project, or tweaking a TTL, make the change in the code first.

### 2. Run `terraform plan`
**Never skip this.** The plan is your safety net. Read it to ensure:
- You aren'''t accidentally deleting something you didn'''t mean to.
- The resources being "replaced" are the ones you intended to change.

### 3. Run `terraform apply`
Once the plan looks correct, apply it. Terraform handles the orchestration across all providers (AWS, Railway, etc.) simultaneously.

## Why this is Safe
- **State Management:** Because we use S3/DynamoDB for state, Terraform always knows exactly what exists.
- **Atomic Operations:** Terraform ensures that dependencies are respected (e.g., it won'''t point a DNS record to a CloudFront distribution that doesn'''t exist yet).
- **History:** Every change to our infrastructure is tracked in Git. If a change causes an issue, we can simply revert the code and re-apply to go back to the previous stable state.

**Conclusion:** Don'''t be afraid to experiment or make naming mistakes. As long as you follow the Code -> Plan -> Apply workflow, the infrastructure will always reflect your best shot.
