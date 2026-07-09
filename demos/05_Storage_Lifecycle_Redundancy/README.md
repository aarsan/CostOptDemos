# Demo 5: Storage Lifecycle Management and Redundancy Review

**Segment:** Workload Optimization – Storage
**Speaker/Owner:** Umesh Panwar
**Timebox:** 10 minutes

## Overview

**Description:** Demonstrate how blob lifecycle policies can transition data to cooler tiers or delete data based on age, access, modification time, prefixes, or tags; pair this with a redundancy discussion around LRS, ZRS, GRS, and business requirements.

**Customer takeaway:** Bosch gets a concrete framework for reducing storage cost without blindly moving data to the cheapest tier or weakening resiliency assumptions.

**Owner/readiness:** Umesh Panwar should confirm whether the demo uses a live storage account, screenshots, or a policy JSON example.

## Demo Script

- **Goal:** Show Bosch how lifecycle policy and redundancy choices can reduce storage cost while preserving business resiliency requirements.
- **Setup:** Prepare a storage account example, lifecycle policy screen, or policy JSON sample with hot, cool, cold/archive, and delete actions.
- **Steps:**
  1. Explain access tier optimization versus resiliency/redundancy decisions.
  2. Show how lifecycle rules transition blobs based on age / access / modification / prefix / tags.
  3. Discuss compliance and restore-time constraints.
  4. Pair tiering with LRS / ZRS / GRS review.
- **Talk track:** "The cheapest tier is not automatically the right tier. We optimize storage by matching access patterns, recovery expectations, and retention obligations."
- **Fallback:** If live policy creation is not possible, use a policy JSON example and explain each rule.

## Assets

- [`lifecycle-policy.json`](lifecycle-policy.json) — sample blob lifecycle policy (tier to cool/cold/archive by age, delete, snapshot/version rules, last-access tiering for logs).
- [`apply-lifecycle-policy.sh`](apply-lifecycle-policy.sh) — applies the policy to a storage account via Azure CLI.
- [`storage-redundancy-inventory.kql`](storage-redundancy-inventory.kql) — ARG query listing storage accounts with redundancy (LRS/ZRS/GRS), access tier, and TLS settings.

## Notes / Prep

_Add demo-specific setup notes, links, screenshots, or lifecycle policy JSON here._
