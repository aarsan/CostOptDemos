# Demo 7: Network Cost Driver Checklist

Use this checklist to review networking cost drivers. For each driver, the goal is to turn a
cost signal into an **architecture review question**, not a blanket fix.

## Cost drivers to walk through

- [ ] **Data transfer / egress** — Internet egress, cross-region, and cross-zone
      traffic. Where is data actually flowing, and is any of it avoidable?
  - Question: Are chatty components split across regions/zones unnecessarily?
  - Question: Is backup/replication traffic crossing regions when it doesn't need to?

- [ ] **NAT Gateway** — Hourly + data-processed charges.
  - Question: Are there NAT Gateways attached to subnets with little/no outbound need?
  - Question: Could Private Endpoints remove some internet-bound traffic entirely?

- [ ] **Load Balancer** — Standard LB rules + data processed.
  - Question: Are there orphaned rules / unused frontend IPs?

- [ ] **Private Link / Private Endpoints** — Per-endpoint hourly + data-processed.
  - Question: Are private endpoints justified by security/compliance, or duplicated?

- [ ] **VPN / ExpressRoute Gateway** — Gateway hours + egress.
  - Question: Is the gateway SKU oversized for actual throughput?

- [ ] **Public IPs** — Standard public IPs bill hourly even when idle.
  - Question: Any unassociated public IPs? (see `network-cost-signals.kql`)

## Where the charges appear

- **Cost Management > Cost analysis** — group by *Meter category* = `Virtual Network`,
  `Bandwidth`, `Load Balancer`, `NAT Gateway`, `VPN Gateway`.
- **Advisor** — networking-adjacent right-size / idle recommendations.
- **Cost Optimization workbook** — idle public IPs, unattached NICs.

## Turning findings into follow-ups

For each signal, capture: owner, workload, whether it's tied to a
security/resiliency requirement, and a proposed next action (review, redesign,
remove, or accept). Do **not** recommend removing private connectivity or
cross-region resiliency without the architecture context.
