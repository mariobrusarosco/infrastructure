# ADR 0001: Centralized Infrastructure as Code (IaC)

## Status
Accepted

## Context
The project ecosystem is growing, with multiple frontend and backend applications (`best-shot`, `financial-app`, `api-best-shot`) hosted across different platforms (AWS, Netlify, Railway). Currently, infrastructure definitions are either embedded within the application repositories or managed manually. This fragmentation leads to:
- Inconsistent security policies.
- Difficulty in tracking domain/DNS changes across `mario.productions`.
- No single source of truth for the entire platform architecture.

## Decision
We will centralize all infrastructure management into a dedicated `infrastructure` repository. This repository will serve as the "Control Plane" for the entire platform.

### Key Architectural Choices:
1.  **Tooling:** Terraform for Infrastructure as Code.
2.  **State Management:** Remote state stored in AWS S3 with state locking via DynamoDB. This ensures a shared source of truth and prevents concurrent modifications.
3.  **Organization:** 
    - `modules/`: Contains reusable blueprints (e.g., AWS Static Site, Netlify Site).
    - `projects/`: Contains environment/project-specific implementations (e.g., `best-shot.tf`, `financial-app.tf`).
4.  **Region:** Standardize on `us-east-1` (N. Virginia) for all AWS resources to simplify ACM certificate management and S3/CloudFront integration.
5.  **Domain Management:** All DNS records for `mario.productions` will be centrally managed in this repository via Route 53.

## Consequences
- **Positive:** Single view of all cloud costs and resources; improved security via centralized IAM; easier onboarding of new projects.
- **Negative:** The `infrastructure` repo becomes a single point of failure (mitigated by version control and remote state).
- process: Application repositories (`best-shot`) will no longer contain Terraform code but will retain CI/CD logic to deploy assets to the infrastructure provisioned by this central repo.
