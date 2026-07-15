# Demo 7: Networking Cost Optimization

_Topic: Networking_

Networking cost is mostly an **architecture** decision. This demo has two parts: first, seeing how much perimeter/gateway **SKU and topology** choices cost using the Pricing Calculator; second, finding networking **waste** in a real subscription with a few reusable queries.

## What you'll learn

- Why SKU choice and hub topology are the biggest networking cost levers.
- How to find idle public IPs, oversized gateways, and unattached NICs in your own environment.
- How to turn a cost signal into an architecture review question.

## What you'll need

- A web browser for Part 1 (no subscription needed).
- Azure portal access to a real subscription for Part 2.

## Part 1 — The money lever: SKU + hub topology

1. Open the **Azure Pricing Calculator** (<https://azure.microsoft.com/pricing/calculator/>) and add **Azure Firewall**. Compare **Basic vs Standard vs Premium** monthly cost — notice the deployment/hour charge dominates, independent of any single rule.
2. Model **one shared Firewall in a hub** vs **one Firewall per spoke** (multiply by your number of spokes). The consolidation saving is the headline number.
3. For context, add the smaller levers: **Load Balancer Basic vs Standard**, **App Gateway / VPN Gateway throughput tiers**, and the value of **stopping non-24×7 Firewall deployments**.

## Part 2 — Find the waste in your environment

1. Open **Resource Graph Explorer** in the portal and run the queries in [`network-cost-signals.kql`](network-cost-signals.kql): idle public IPs, NAT gateways, private endpoints, VPN/ExpressRoute gateways, and unattached NICs.
2. Open **Cost Management** → **Cost analysis**, and group by **Meter category** (`Virtual Network`, `Bandwidth`, `NAT Gateway`, `VPN Gateway`) to see where networking charges land.
3. Walk the [`network-cost-driver-checklist.md`](network-cost-driver-checklist.md), turning each signal into an owner and an action: review, redesign, remove, or accept.

## What to look for

- Picking the right Firewall SKU and sharing one instance across a hub saves more than any amount of idle-IP cleanup.
- A cost signal is a **question, not a verdict** — don't remove private connectivity or cross-region resiliency without the architecture context.

## Go deeper (optional)

- [`network-cost-driver-checklist.md`](network-cost-driver-checklist.md) — maps each network cost driver to an architecture review question.
- [`network-cost-signals.kql`](network-cost-signals.kql) — Resource Graph queries for idle public IPs, NAT gateways, private endpoints, VPN/ER gateways, and unattached NICs.
