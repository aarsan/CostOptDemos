# Demo 4: App Service Plan Optimization — SKIPPED

> **This demo is marked as skipped in the workshop agenda.** Included here for completeness and future reuse.

**Segment:** Workload Optimization – Compute
**Speaker/Owner:** Ahmet Arsan
**Timebox:** 10 minutes

## Overview

**Description:** Review App Service Plan cost drivers including pricing tier, instance count, scale-up versus scale-out, deployment slots, diagnostics, and plan utilization; discuss consolidation and scheduled autoscale opportunities.

**Customer takeaway:** Bosch sees how App Service optimization differs from VM optimization and how to evaluate plan-level efficiency before changing application architecture.

**Owner/readiness:** Ahmet Arsan can run this as a conceptual walkthrough if no live environment is available; prepare screenshots or a sample plan utilization scenario.

## Demo Script

- **Goal:** Help Bosch evaluate whether App Service Plans are appropriately sized, consolidated, and scaled for their application patterns.
- **Setup:** Prepare one App Service Plan example or screenshots showing pricing tier, instance count, app count, utilization, and scaling configuration.
- **Steps:**
  1. Explain that App Service cost is paid at the plan level.
  2. Review tier / instance count / scale-up / scale-out / autoscale / deployment slots / diagnostics.
  3. Discuss consolidation opportunities and tradeoffs.
  4. Compare possible actions such as resize tier, reduce instances, schedule autoscale, consolidate apps, move to Premium v3, or keep separation for resiliency/security reasons.
- **Talk track:** "Unlike a VM, the App Service Plan is the billing container. Optimization often starts by asking whether the plan is sized and shared appropriately."
- **Fallback:** Use a sample utilization scenario if no Bosch environment access is available.

## Notes / Prep

_Add demo-specific setup notes, links, screenshots, or scripts here._
