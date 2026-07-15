# Demo 3: Azure Spot VM Pricing

_Topic: Compute_

Spot VMs offer deep discounts on spare Azure capacity — but they can be reclaimed at any time. This demo shows how to read the price advantage and eviction risk so you know when Spot is a good fit.

## What you'll learn

- Where Spot can materially reduce compute cost.
- How to read Spot price and eviction rate.
- Which workloads are (and aren't) suitable for Spot.

## What you'll need

- A web browser. No subscription required for the pricing comparison.

## Follow along

1. Open the **Azure Pricing Calculator** (<https://azure.microsoft.com/pricing/calculator/>) and add a **Virtual Machine**, or open the VM pricing page.
2. Pick a **region** and **VM family**, then compare the **pay-as-you-go** price to the **Spot** price and note the discount percentage.
3. In the portal, start creating a VM and switch on the **Azure Spot** option — the create blade shows the **current Spot price** and the **eviction rate** for that size, plus the **eviction policy** and **maximum price** settings.
4. Match Spot to the workload: it's a fit for **interruption-tolerant** work such as batch processing, dev/test, CI/CD runners, and stateless workers — not for stateful or always-on services.

## What to look for

- Spot is a **design choice, not a discount switch**. Use it only where the workload can tolerate being interrupted and restarted.

## Go deeper (optional)

- [`Compare-SpotPricing.ps1`](Compare-SpotPricing.ps1) — queries the public Azure Retail Prices API to show live pay-as-you-go vs Spot pricing and the discount % for a VM family in a region (no sign-in required).
