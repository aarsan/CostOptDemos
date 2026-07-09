# Demo 7: Networking Cost Signal Review

**Segment:** Workload Optimization – Networking
**Speaker/Owner:** Ahmet Arsan
**Timebox:** 8 minutes

## Overview

**Description:** Discuss how data transfer, NAT Gateway, Private Link, cross-zone, cross-region, and internet egress patterns show up as cost signals; use Cost Management, Advisor, and architecture review prompts to identify follow-up opportunities.

**Customer takeaway:** Bosch gets a structured way to find networking-related optimization candidates without compromising security, resiliency, or private connectivity requirements.

**Owner/readiness:** Ahmet Arsan should treat this as discussion-led unless customer cost exports or architecture diagrams are available; prepare a short checklist of network cost drivers.

## Demo Script

- **Goal:** Help Bosch recognize networking cost signals and convert them into architecture review questions rather than one-size-fits-all recommendations.
- **Setup:** Prepare Cost Management views, workbook screenshots, or a checklist covering data transfer, NAT Gateway, Private Link, cross-zone traffic, cross-region traffic, and internet egress.
- **Steps:**
  1. Explain that networking optimization is tied to architecture / security / resiliency choices.
  2. Show where networking charges appear in Cost Management or workbook views.
  3. Walk through review questions around traffic flow and service placement.
  4. Convert findings into follow-up actions.
- **Talk track:** "Networking cost is rarely just a pricing issue. It usually reflects architecture decisions, resiliency goals, and data movement patterns."
- **Fallback:** If cost data is unavailable, lead with the checklist and capture Bosch-specific follow-up questions.

## Assets

- [`network-cost-driver-checklist.md`](network-cost-driver-checklist.md) — discussion-led checklist mapping each network cost driver to an architecture review question.
- [`network-cost-signals.kql`](network-cost-signals.kql) — ARG queries for idle public IPs, NAT gateways, private endpoints, VPN/ER gateways, and unattached NICs.

## Notes / Prep

_Add demo-specific setup notes, links, screenshots, or the network cost driver checklist here._
