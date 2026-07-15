# Demo 5: Storage Lifecycle & Redundancy

_Topic: Storage_

Blob **lifecycle policies** automatically move or delete data based on its age or access, and your **redundancy** choice (LRS/ZRS/GRS) has a real cost impact. This demo shows how to reduce storage cost without weakening resiliency.

## What you'll learn

- How lifecycle rules tier or delete data automatically by age, access, prefix, or tags.
- How redundancy options differ in cost and resiliency.
- How to match tier and redundancy to real business requirements.

## What you'll need

- Azure portal access to a subscription with a **general-purpose v2 storage account**.

## Follow along

1. Open your **storage account** → **Data management** → **Lifecycle management** → **Add a rule**.
2. Configure actions: move blobs to **Cool** after N days, to **Archive** after M days, and **delete** after X days. Scope the rule by **blob prefix** or **index tags**, and enable **last-access tracking** if you want access-based tiering.
3. Review the account's **redundancy** (Data management → Redundancy, or Configuration) and consider the tradeoffs and cost of **LRS vs ZRS vs GRS**.
4. Factor in compliance and restore time — for example, data in **Archive** must be rehydrated before it can be read, which takes time.

## What to look for

- The cheapest tier is not automatically the right tier. Optimize by matching **access patterns**, **recovery expectations**, and **retention obligations** — not just price per GB.

## Go deeper (optional)

- [`lifecycle-policy.json`](lifecycle-policy.json) — a sample lifecycle policy (tier to cool/cold/archive by age, delete, snapshot/version rules, last-access tiering for logs).
- [`apply-lifecycle-policy.sh`](apply-lifecycle-policy.sh) — applies the policy to a storage account via Azure CLI.
- [`storage-redundancy-inventory.kql`](storage-redundancy-inventory.kql) — lists storage accounts with their redundancy, access tier, and TLS settings.
