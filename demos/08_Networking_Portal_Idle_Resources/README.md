# Demo 8: Networking Idle-Resource Cost (Portal Walkthrough)

**Segment:** Workload Optimization – Networking
**Speaker/Owner:** Ahmet Arsan
**Timebox:** 10 minutes

## Overview

**Description:** A fully click-through, portal-only demo that everyone can follow along with in an empty subscription. Deliberately create two networking resources that bill *while idle* — a Standard Public IP and a NAT Gateway — then find them again using Resource Graph Explorer and Cost analysis, and clean up. No scripts, no Bicep, nothing to troubleshoot live.

**Customer takeaway:** Bosch sees, hands-on, that networking resources like Standard Public IPs and NAT Gateways bill hourly even with zero traffic, and learns the exact portal views (Resource Graph Explorer + Cost analysis) that surface this waste in their own environment.

**Owner/readiness:** Ahmet Arsan. Pre-create nothing — the point is to build it live so the detection query lights up because the audience just created the resource. Have a subscription where you can create/delete a resource group.

## Demo Script

- **Goal:** Prove that "idle" networking resources are not free, and connect that fact to a repeatable detection view attendees can run in their own tenant.
- **Setup:** An empty subscription (or a throwaway resource group) with Contributor rights. Everything is done in the Azure portal.
- **Steps:**
  1. Create a resource group, an unassociated Standard Public IP, and a NAT Gateway (see [`portal-walkthrough.md`](portal-walkthrough.md)).
  2. Show on the Pricing Calculator / Retail Prices that both bill hourly regardless of traffic.
  3. Open **Resource Graph Explorer** and run the idle Public IP query — it returns the resource they just made.
  4. Open **Cost Management > Cost analysis** and show where the `Virtual Network` / `Bandwidth` / `NAT Gateway` meters appear (note the cost-data lag).
  5. Delete the resource group to remediate — reinforce "delete is the cheapest optimization."
- **Talk track:** "Nothing here is serving traffic, yet the meter is running. Idle isn't free. The good news is the same query that found the one I just built will find every forgotten public IP and gateway across your subscriptions."
- **Fallback:** Cost analysis can lag 8–24h, so same-day charges may not appear. If so, lean on Resource Graph Explorer (instant) and the Retail Prices figures, and show a Cost analysis screenshot from an older environment instead.

## Assets

- [`portal-walkthrough.md`](portal-walkthrough.md) — exact click-by-click portal steps for create → show cost → detect → clean up.
- Detection queries live next door in [`../07_Networking_Cost_Signal_Review/network-cost-signals.kql`](../07_Networking_Cost_Signal_Review/network-cost-signals.kql) — paste query #1 (idle Public IPs) and #2 (NAT Gateways) into Resource Graph Explorer.

## Notes / Prep

- Approximate list prices (East US, validate before delivery): Standard Public IP ≈ **$0.005/hr (~$3.65/mo)**; NAT Gateway ≈ **$0.045/hr (~$33/mo)** plus **$0.045/GB** data processed. Small numbers per resource — the message is *multiply by hundreds of forgotten resources across an estate*.
- Keep the whole demo inside one resource group so cleanup is a single delete.
