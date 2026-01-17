# Phase 1: Foundation & Bootstrap

## Goal
Setup the centralized repository structure and remote state management (S3 + DynamoDB) to ensure a secure, shared source of truth.

## Tasks

### Task 1 - Bootstrap Remote State []
#### Task 1.1 - Create bootstrap Terraform code to provision the S3 bucket (State) and DynamoDB table (Lock) [DONE]
#### Task 1.2 - Run bootstrap locally and migrate the local state to the newly created remote backend [DONE]

### Task 2 - Repository Scaffolding []
#### Task 2.1 - Setup versions.tf, providers.tf, and main.tf orchestrator [DONE]
#### Task 2.2 - Create directory structure for /modules and /projects [DONE]

# Phase 2: Migration of Best Shot

## Goal
Move the existing Best Shot infrastructure into the centralized repository without downtime (re-provisioning/importing).

## Tasks

### Task 3 - Implement AWS Static Site Module []
#### Task 3.1 - Create a generic module for S3 + CloudFront + ACM + Route53 records [DONE]
#### Task 3.2 - Ensure the module supports multiple environments (Demo, Staging, Production) [DONE]

### Task 4 - Project Implementation: Best Shot []
#### Task 4.1 - Create project-best-shot.tf in root invoking the module [DONE]
#### Task 4.2 - Run terraform plan to verify the configuration [DONE]
### Task 4.3 - Apply Demo environment [DONE]
#### Task 4.4 - Apply Staging environment [DONE]
#### Task 4.5 - Apply Production environment [DONE]

# Phase 3: Expansion & CI/CD Cutover

## Goal
Incorporate other projects (Financial App, API) and update CI/CD pipelines.

## Tasks

### Task 5 - Implement Netlify & Railway Modules []
#### Task 5.1 - Create Netlify site module [DONE]
#### Task 5.6 - Apply Financial App infrastructure [DONE]
#### Task 5.7 - Apply Portfolio infrastructure (Vercel) [DONE]
#### Task 5.8 - Apply Better Call Buffet API infrastructure (Railway) [DONE]
#### Task 5.9 - Apply Garden infrastructure (Vercel) [IN PROGRESS]
#### Task 5.2 - Create Railway service module [DONE]
#### Task 5.3 - Apply API Demo environment [DONE]
#### Task 5.4 - Apply API Staging environment [DONE]
#### Task 5.5 - Apply API Production environment [DONE]

### Task 6 - CI/CD Integration []
#### Task 6.1 - Update best-shot GitHub Actions to point to the new S3 buckets [DONE]
#### Task 6.2 - Remove the old /infra folder from the best-shot repository [DONE]

## Dependencies
- AWS CLI configured with Admin permissions.
- Access to Route53 Zone ID for mario.productions.
- Netlify and Railway API tokens (for Phase 3).

## Expected Result
A single repository managing the entire infrastructure for mario.productions, with remote state and modular architecture.

## Next Steps
1. User review of this plan.
2. Begin Phase 1, Task 1.1 (Bootstrap code).
