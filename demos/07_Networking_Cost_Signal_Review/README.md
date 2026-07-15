# Demo 7: Networking Cost Optimization — SKU Right-Sizing & Signal Review

**Segment:** Workload Optimization – Networking
**Speaker/Owner:** Ahmet Arsan
**Timebox:** 10 minutes

## Overview

**Description:** A single, consolidated networking demo with two parts: (1) a live **Pricing Calculator** comparison that shows the real money lever — Azure Firewall SKU choice and hub-shared vs per-spoke topology — and (2) a **detection** pass using Resource Graph and Cost Management to find networking waste in a *real* environment. No infrastructure to stand up or troubleshoot.

**Customer takeaway:** Bosch leaves with (a) a concrete sense of how much perimeter/gateway SKU and topology decisions actually cost at scale, and (b) reusable queries they can run against their own subscriptions the same afternoon to find idle public IPs, oversized gateways, and unattached NICs.

**Owner/readiness:** Ahmet Arsan. Have the [Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) and [Resource Graph Explorer](https://portal.azure.com) open in tabs. Validate the current Firewall list prices before delivery.

## Demo Script

### Part 1 — The money lever: Firewall SKU + hub consolidation (Pricing Calculator, ~5 min)

- **Goal:** Show that the biggest networking cost decisions are architectural (SKU + topology), not line-item cleanup.
- **Steps:**
  1. In the Pricing Calculator, add **Azure Firewall** and compare **Basic vs Standard vs Premium** monthly cost. Call out that the deployment/hour charge dominates, independent of a single rule.
  2. Model **one shared Firewall in a hub** vs **one Firewall per spoke** (×N spokes). The consolidation saving is the headline number.
  3. Add the smaller levers for context: **Load Balancer Basic vs Standard**, **App Gateway / VPN Gateway throughput tiers**, and **stopping non-24×7 Firewall deployments**.
- **Talk track:** "Networking cost is mostly an architecture decision. Picking the right Firewall SKU and sharing one instance across a hub saves more than any amount of idle-IP cleanup."

### Part 2 — Find the waste in a real environment (Resource Graph + Cost analysis, ~5 min)

- **Goal:** Turn cost signals into architecture review questions using data from a *real* subscription (not a fabricated empty one).
- **Steps:**
  1. Open **Resource Graph Explorer** and run the queries in [`network-cost-signals.kql`](network-cost-signals.kql): idle public IPs, NAT gateways, private endpoints, VPN/ExpressRoute gateways, unattached NICs.
  2. Open **Cost Management > Cost analysis**, group by **Meter category** (`Virtual Network`, `Bandwidth`, `NAT Gateway`, `VPN Gateway`) to see where networking charges land.
  3. Walk the [`network-cost-driver-checklist.md`](network-cost-driver-checklist.md), converting each signal into an owner + action (review / redesign / remove / accept).
- **Talk track:** "A cost signal is a question, not a verdict. Don't remove private connectivity or cross-region resiliency without the architecture context."
- **Fallback:** If no real cost data is available, lead with the checklist and the Part 1 calculator numbers, and capture Bosch-specific follow-up questions.

## Assets

- [`network-cost-driver-checklist.md`](network-cost-driver-checklist.md) — discussion-led checklist mapping each network cost driver to an architecture review question.
- [`network-cost-signals.kql`](network-cost-signals.kql) — ARG queries for idle public IPs, NAT gateways, private endpoints, VPN/ER gateways, and unattached NICs. Run against real subscriptions.

## Notes / Prep

- Validate current Azure Firewall list prices (Basic/Standard/Premium) before delivery; the SKU delta is the headline of Part 1.
- Part 2 is only compelling against a real environment. In an empty subscription the queries return nothing — use the checklist + calculator instead.
