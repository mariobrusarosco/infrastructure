# Infrastructure (Centralized)

This repository serves as the **Hub** for all global infrastructure resources across the Best Shot ecosystem.

## Core Responsibilities

1.  **Identity & DNS**: Manages the Route 53 Hosted Zone for `mario.productions`.
2.  **Shared Networking**: (Future) VPCs, Peering, Global Accelerators.
3.  **Cross-App Routing**: Manages DNS records (CNAMEs/Aliases) for all sub-services.

## Project Structure

- `provider.tf`: AWS connection settings.
- `main.tf`: Resource definitions (The Hosted Zone and DNS records).
- `terraform.tfstate`: (Local) The current deployment state.

## Current Managed Services

| Service              | Domain                                    | Target                      |
| :------------------- | :---------------------------------------- | :-------------------------- |
| **Frontend Demo**    | `best-shot-demo.mario.productions`        | Managed in `best-shot` repo |
| **Frontend Staging** | `best-shot-staging.mario.productions`     | Managed in `best-shot` repo |
| **Frontend Prod**    | `best-shot.mario.productions`             | Managed in `best-shot` repo |
| **API Demo**         | `api-best-shot-demo.mario.productions`    | Railway Cluster             |
| **API Staging**      | `api-best-shot-staging.mario.productions` | Railway Cluster             |
| **API Prod**         | `api-best-shot.mario.productions`         | Railway Cluster             |

## Workflow

1.  Navigate to this folder.
2.  Run `terraform plan` to preview changes.
3.  Run `terraform apply` to push changes to AWS.
4.  Commit changes to version control.
