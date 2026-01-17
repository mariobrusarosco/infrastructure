# Troubleshooting: Apex Domains & The CNAME Restriction

If you have ever tried to point your root domain (e.g., `mario.productions`) to a cloud service using a CNAME and failed, this guide explains why.

## The Glossary

- **Apex Domain:** The root of your domain, without any subdomain (e.g., `mario.productions`). Also called "Naked Domain" or "Root Domain".
- **Subdomain:** Anything with a prefix (e.g., `www.mario.productions`, `api.mario.productions`).
- **A Record:** Points a name to a specific IP address (e.g., `1.2.3.4`).
- **CNAME Record:** Points a name to another name (e.g., `myapp.vercel.app`).

## The Problem: The CNAME Restriction

The DNS standard (RFC 1035) has a strict rule: **You cannot put a CNAME record on the Apex Domain.**

Why? Because the Apex domain must also hold other record types, specifically **NS** (Name Server) and **SOA** (Start of Authority) records. A CNAME record says "I am an alias for X, and **I have no other properties**." If you put a CNAME on the root, you would hide your NS records, and your entire email/subdomain infrastructure would break.

### So how do we point the root to the cloud?

Cloud providers (Vercel, Netlify, Railway) usually give you a dynamic URL like `myapp.vercel.app`. Since you can't CNAME your root to that, you have two options:

### Solution 1: ALIAS / CNAME Flattening (The Modern Way)
Some DNS providers (like **AWS Route 53**, Cloudflare, Namecheap) offer a special non-standard record type often called `ALIAS` or `ANAME`.

- **How it works:** You tell Route 53 "Point to this AWS resource (like a Load Balancer)."
- **Behind the scenes:** Route 53 looks up the IP of that resource dynamically and returns it as an **A Record** to the user.
- **Limitation:** In Route 53, **Alias records only work for AWS resources** (CloudFront, ELB, S3). You typically cannot create an Alias to a non-AWS target (like Vercel).

### Solution 2: Fixed A Records (The Vercel/Netlify Way)
Since we can't use CNAMEs or Route 53 Aliases for external services, providers like Vercel give you a **Fixed Anycast IP Address**.

- **Vercel IP:** `76.76.21.21`
- **Netlify Load Balancer:** `75.2.60.5`

**This is what we did for the Portfolio:**
1.  **WWW:** We created a **CNAME** pointing `www.mario.productions` -> `cname.vercel-dns.com`. (This is allowed because it's a subdomain).
2.  **Apex:** We created an **A Record** pointing `mario.productions` -> `76.76.21.21`.

## Summary Table

| Domain Type | CNAME Allowed? | AWS Route 53 Strategy | External Provider (Vercel/Railway) |
| :--- | :--- | :--- | :--- |
| **Subdomain** (`api.mario...`) | ✅ YES | Use CNAME or Alias | Use CNAME pointing to `project.up.railway.app` |
| **Apex** (`mario...`) | ❌ NO | Use **Alias** (A-Record mode) | Use **A Record** pointing to Provider IP |

## Key Takeaway for our Infra
- For **Best Shot** (CloudFront): We used an **Alias** record on the Apex because CloudFront is an AWS service.
- For **Portfolio** (Vercel): We used a hardcoded **A Record** on the Apex because Vercel is external.
