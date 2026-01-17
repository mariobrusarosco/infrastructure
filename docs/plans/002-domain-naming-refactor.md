# Phase 1: Domain Naming Convention Refactor

## Goal
Update the domain names for the "Best Shot" project to follow a more hierarchical and consistent structure.

## Tasks

### Task 1 - Update Frontend Domains (project-best-shot.tf) [x]
#### Task 1.1 - Change demo domain from `best-shot-demo` to `best-shot.demo` [x]
#### Task 1.2 - Change staging domain from `best-shot-staging` to `best-shot.staging` [x]
#### Task 1.3 - Ensure production domain remains `best-shot` (as it already follows the root pattern) [x]

### Task 2 - Update Backend Domains (project-api-best-shot.tf) [x]
#### Task 2.1 - Change demo domain from `api-best-shot-demo` to `best-shot.api.demo` [x]
#### Task 2.2 - Change staging domain from `api-best-shot-staging` to `best-shot.api.staging` [x]
#### Task 2.3 - Change production domain from `api-best-shot` to `best-shot.api` [x]

### Task 3 - Update Better Call Buffet Domains (project-api-better-call-buffet.tf) [x]
#### Task 3.1 - Change production API domain from `api-better-call-buffet` to `better-call-buffet.api` [x]

## Dependencies
- AWS Route 53 (managed via Terraform)
- Railway (managed via Terraform)

## Expected Result
- New domains will be provisioned.
- New SSL certificates will be issued automatically by AWS (ACM) and Railway (Let's Encrypt).
- Old domains will be replaced in the state upon `terraform apply`.

## Next Steps
- Apply the changes to the Terraform files.
- User to run `terraform plan` and `terraform apply`.
