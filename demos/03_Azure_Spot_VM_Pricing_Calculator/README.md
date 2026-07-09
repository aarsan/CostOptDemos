# Demo 3: Azure Spot VM Pricing Calculator

**Segment:** Workload Optimization – Compute
**Speaker/Owner:** Ahmet Arsan
**Timebox:** 8 minutes

## Overview

**Description:** Demonstrate how Spot VM pricing, price history, eviction risk, region, and VM size influence whether Spot is appropriate for interruption-tolerant workloads such as dev/test, batch, CI/CD, or stateless processing.

**Customer takeaway:** Bosch understands where Spot can materially reduce compute cost and where workload resiliency, eviction behavior, or operational risk make it a poor fit.

**Owner/readiness:** Ahmet Arsan should prepare one clear example workload and region/SKU comparison and position this as decision guidance rather than a universal recommendation.

## Demo Script

- **Goal:** Show Bosch how to decide whether Spot is appropriate based on workload tolerance, price advantage, and eviction risk.
- **Setup:** Prepare the Spot VM pricing view or calculator, with one example workload such as batch processing, dev/test, CI runners, or stateless workers.
- **Steps:**
  1. Explain that Spot is capacity-dependent and best suited for interruption-tolerant workloads.
  2. Compare standard VM price to Spot price for one region and VM family.
  3. Discuss eviction behavior / max price / availability / retry strategy.
  4. Show how Spot fits into the broader compute optimization model.
- **Talk track:** "Spot is not a discount switch. It is a design choice for workloads that can tolerate interruption."
- **Fallback:** If the pricing tool is unavailable, use a prepared screenshot and walk through the decision criteria.

## Assets

- [`Compare-SpotPricing.ps1`](Compare-SpotPricing.ps1) — queries the public Azure Retail Prices API to show live standard vs Spot pricing and the discount % for a VM family in a region (no auth required).

## Notes / Prep

_Add demo-specific setup notes, links, screenshots, or pricing scripts here._
