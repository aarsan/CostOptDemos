# Demo 8 — Portal Walkthrough (click-by-click)

Everything below is done in the Azure portal at <https://portal.azure.com>. No CLI,
no Bicep. Total build time ~3–4 minutes; the whole demo fits in 10.

Use one resource group for everything so cleanup is a single delete.

Suggested names (adjust to taste):

| Thing | Name |
|-------|------|
| Resource group | `rg-net-costdemo` |
| Virtual network | `vnet-costdemo` |
| Subnet | `snet-costdemo` |
| Public IP (idle) | `pip-idle-costdemo` |
| Public IP (for NAT) | `pip-nat-costdemo` |
| NAT gateway | `natgw-costdemo` |

---

## Part 1 — Create the "waste" (idle resources) · ~4 min

### 1a. Resource group

1. Top search bar → **Resource groups** → **+ Create**.
2. Subscription: your demo sub. Resource group: `rg-net-costdemo`. Region: **East US**.
3. **Review + create** → **Create**.

### 1b. An unassociated Standard Public IP (the cleanest "idle bills" example)

1. Search bar → **Public IP addresses** → **+ Create**.
2. Settings:
   - **SKU:** `Standard`
   - **Tier:** `Regional`
   - **IP Version:** IPv4
   - **Assignment:** `Static` (Standard is always static)
   - Resource group: `rg-net-costdemo` · Region: **East US** · Name: `pip-idle-costdemo`
3. **Review + create** → **Create**.

> Talking point: We are attaching this to **nothing**. A Standard Public IP is billed
> hourly from the moment it exists — associated or not.

### 1c. A NAT Gateway (hourly gateway charge, even with zero data processed)

A NAT gateway needs a public IP and a subnet, so create a tiny VNet first.

1. Search bar → **Virtual networks** → **+ Create**.
   - Resource group: `rg-net-costdemo` · Name: `vnet-costdemo` · Region: **East US**.
   - **IP addresses** tab: keep the default address space; leave/create a subnet
     `snet-costdemo`. **Review + create** → **Create**.
2. Search bar → **NAT gateways** → **+ Create**.
   - **Basics:** Resource group `rg-net-costdemo` · Name `natgw-costdemo` · Region **East US** · Idle timeout leave default.
   - **Outbound IP** tab: **Create a new public IP address** → name `pip-nat-costdemo` (Standard).
   - **Subnet** tab: select `vnet-costdemo` → check `snet-costdemo`.
   - **Review + create** → **Create**.

> Talking point: There are no VMs in this subnet. Nothing is sending a single byte
> outbound. The NAT gateway still bills the **hourly resource charge**, and would add
> **$/GB data processed** the moment traffic flowed.

---

## Part 2 — Show that it bills · ~1 min

Pick whichever is quicker on the day:

- **Pricing Calculator** (<https://azure.microsoft.com/pricing/calculator/>): add
  *Virtual Network* / *NAT Gateway* / *IP Addresses* and point out the **hourly**
  line items are independent of any data transfer.
- **Retail Prices API** (no auth, good for a quick browser hit):
  - Public IP: `https://prices.azure.com/api/retail/prices?$filter=serviceName eq 'Virtual Network' and armRegionName eq 'eastus' and contains(meterName,'Standard IP')`
  - NAT Gateway: `https://prices.azure.com/api/retail/prices?$filter=serviceName eq 'NAT Gateway' and armRegionName eq 'eastus'`

Approximate list prices (validate before delivery): Public IP **~$0.005/hr (~$3.65/mo)**,
NAT Gateway **~$0.045/hr (~$33/mo) + $0.045/GB processed**.

---

## Part 3 — Detect the waste (the "aha") · ~2 min

### 3a. Resource Graph Explorer — instant, this is the money shot

1. Search bar → **Resource Graph Explorer**.
2. Paste **query #1 (idle Public IPs)** from
   [`../07_Networking_Cost_Signal_Review/network-cost-signals.kql`](../07_Networking_Cost_Signal_Review/network-cost-signals.kql)
   and **Run query**. `pip-idle-costdemo` appears — it has no `ipConfiguration` and no
   `natGateway`, so it is provably idle.

   ```kql
   Resources
   | where type =~ 'microsoft.network/publicipaddresses'
   | where isnull(properties.ipConfiguration) and isnull(properties.natGateway)
   | project name, resourceGroup, subscriptionId, location,
             sku = tostring(sku.name),
             allocation = tostring(properties.publicIPAllocationMethod)
   ```

3. (Optional) Paste **query #2 (NAT Gateways)** to inventory `natgw-costdemo` and show
   `subnetCount` / `publicIpCount` for a right-sizing conversation.

> Talking point: The query found the exact resource we just created — and it will find
> every forgotten one across all your subscriptions in seconds. This is the scalable
> version of the checklist in Demo 7.

### 3b. Cost analysis — where it shows up on the bill

1. Search bar → **Cost Management** → **Cost analysis**.
2. Scope: the demo subscription. Group by **Meter category** (or **Service name**).
3. Point out the `Virtual Network`, `Bandwidth`, and `NAT Gateway` meters.

> **Heads-up / fallback:** usage-to-cost data can lag **8–24 hours**, so a resource
> created minutes ago may not appear yet. If it's empty, say so, and use a screenshot
> from an older environment plus the Retail Prices figures from Part 2.

---

## Part 4 — Remediate (single delete) · ~1 min

1. Search bar → **Resource groups** → `rg-net-costdemo`.
2. **Delete resource group** → type the name to confirm → **Delete**.

> Closing line: "The cheapest networking optimization is deleting what you're not using.
> Everything we built is gone, and so is the meter."

---

## If you want a second, calculator-only demo (optional companion)

The deck's biggest networking lever is **SKU right-sizing** (Azure Firewall
Basic/Standard/Premium, hub-shared Firewall, Load Balancer Basic vs Standard, App
Gateway/Gateway throughput tiers). Rather than deploy an expensive firewall live, do
this on the **Pricing Calculator**:

1. Add **Azure Firewall** → compare **Basic vs Standard vs Premium** monthly cost.
2. Model **one shared Firewall in a hub** vs **one per spoke** (×N spokes) to show the
   hub-and-spoke consolidation saving.
3. Tie back to the deck: right SKU + shared instance + stop non-24×7 deployments.

No infrastructure, nothing to troubleshoot — just the calculator on screen.
