# Troubleshooting: Railway Domain Conflict ("Domain is not available")

## The Symptom
When running `terraform apply` to add a Custom Domain to a Railway Service, you encounter the following error:

```text
Error: Client Error
...
Unable to create custom domain, got error: input:3: customDomainCreate Domain is not available
```

## The Cause
This error occurs because of a **State Mismatch** between Terraform and Railway.

1.  **Desired State (Terraform):** You asked Terraform to create `api-best-shot-staging.mario.productions`.
2.  **Actual State (Railway):** That domain **already exists** in the Railway project.
    - It might have been created manually via the Railway Dashboard.
    - It might have been created by a previous automation tool.
    - It might be "stuck" in a pending state from a deleted environment.

Because Terraform tracks resources in its own database (`terraform.tfstate`), if a resource exists in the real world but *not* in the state file, Terraform tries to create it. Railway rejects this request because domains must be unique.

## The Fix

### Option A: Manual Cleanup (Recommended for Dev/Staging)
1.  Log in to the **Railway Dashboard**.
2.  Navigate to the Project -> Service -> **Settings**.
3.  Scroll to **Public Networking**.
4.  Find the conflicting domain (e.g., `api-best-shot-staging...`).
5.  Click the **Delete (Trash Can)** icon.
6.  **Re-run Terraform:**
    ```bash
    terraform apply
    ```
    Terraform will now successfully "claim" the free domain name and manage it from now on.

### Option B: Terraform Import (Enterprise/Production Safe)
If deleting the domain would cause downtime, you should **Import** it into Terraform's state instead.

1.  Find the **Custom Domain ID** (requires querying Railway API).
2.  Run the import command:
    ```bash
    terraform import module.your_module_name.railway_custom_domain.this <custom_domain_id>
    ```
3.  Terraform will map the existing live resource to your code without destroying it.
