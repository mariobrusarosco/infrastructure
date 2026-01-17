# Infrastructure

This repository manages the infrastructure for `mario.productions` and its sub-projects using **Terraform**. It orchestrates resources across AWS (S3, CloudFront, Route53), Railway, Vercel, and Netlify.

## Getting Started

### 1. Prerequisites
- [Terraform](https://www.terraform.io/downloads) installed.
- Access to the necessary API tokens for the providers.

### 2. Environment Setup (Important!)
Terraform requires sensitive API tokens to authenticate with the various providers. These should **never** be committed to Git.

1.  Create a `.env` file in the root directory (this file is git-ignored):
    ```bash
    cp .env.example .env  # If an example exists, or create one manually
    ```
2.  Add your tokens to the `.env` file:
    ```bash
    TF_VAR_railway_token=your_railway_token
    TF_VAR_vercel_token=your_vercel_token
    TF_VAR_vercel_team_id=your_team_id
    TF_VAR_netlify_token=your_netlify_token
    ```

### 3. Running Terraform
Before running any terraform commands, you must load these variables into your shell session.

**Option A: One-liner (Recommended)**
```bash
export $(grep -v '^#' .env | xargs) && terraform plan
export $(grep -v '^#' .env | xargs) && terraform apply
```

**Option B: Export manually**
You can also `source` the file or export the variables manually in your terminal profile, but the one-liner ensures you are using the project-specific configuration.
