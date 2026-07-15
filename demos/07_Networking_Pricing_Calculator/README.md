# Demo 7: Networking Cost Optimization (Pricing Calculator)

_Topic: Networking_

Networking cost is mostly an **architecture** decision — which SKUs you pick, how you lay out your hub-and-spoke, and how many per-resource services (like Private Endpoints) you deploy. This demo uses the **Azure Pricing Calculator** to make those tradeoffs visible before you build anything.

## What you'll learn

- Why Firewall SKU choice and hub topology are the biggest networking cost levers.
- How per-endpoint services like **Private Endpoints** quietly add up at scale.
- How to compare options side by side without deploying anything.

## What you'll need

- A web browser. No subscription required — everything is in the **Azure Pricing Calculator** (<https://azure.microsoft.com/pricing/calculator/>).

## Follow along

1. **Azure Firewall SKU comparison.** Add **Azure Firewall** and compare **Basic vs Standard vs Premium** monthly cost. Notice the deployment/hour charge dominates, independent of any single rule.
2. **Hub-shared vs per-spoke.** Model **one shared Firewall in a hub** versus **one Firewall per spoke** (multiply by your number of spokes). The consolidation saving is the headline number.
3. **Private Endpoints add up.** Add **Private Link / Private Endpoints** and set the count to what a real estate looks like — one per service, per environment, per subnet. Each endpoint bills an **hourly charge (~$0.01/hr, ~$7.30/mo)** *plus* **data processing per GB (inbound and outbound)**. Bump the count from 1 to 50–100 and watch the monthly total climb — this is a cost that hides in "just following best practice."
4. **Smaller levers, for context.** Add **Load Balancer Basic vs Standard**, **App Gateway / VPN Gateway throughput tiers**, and note the saving from **stopping non-24×7 Firewall deployments**.

## What to look for

- Picking the right Firewall SKU and sharing one instance across a hub saves more than almost any other single networking change.
- Private Endpoints are cheap individually but material at scale — worth counting deliberately rather than deploying one per service by reflex.
- These are **architecture decisions**: don't drop private connectivity or resiliency for cost alone — size them intentionally.
