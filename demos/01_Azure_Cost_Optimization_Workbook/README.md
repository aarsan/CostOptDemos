# Demo 1: Azure Cost Optimization Workbook

_Topic: Cost visibility & accountability_

The Azure **Cost Optimization workbook** in Azure Advisor is a single starting point that brings together idle resources, right-sizing, reservations, savings plans, and Azure Hybrid Benefit signals — before you dive into any one workload.

## What you'll learn

- Where to find one consolidated view of your cost optimization opportunities.
- How to read idle-resource, right-sizing, and commitment signals.
- How to turn a recommendation into an owned, governed follow-up action.

## What you'll need

- Access to the Azure portal with at least **Reader** on a subscription (plus Advisor/Cost Management access).

## Follow along

1. In the portal, search for and open **Advisor**.
2. Select **Workbooks**, then open the **Cost Optimization** workbook.
3. Review the landing sections: **idle/unused resources**, **right-sizing**, **reservations & savings plans**, and **Azure Hybrid Benefit**.
4. Pick one section (for example, idle public IPs or unattached disks) and note the resource count and estimated savings.
5. Ask the ownership questions: which subscription, resource group, or tag owns this resource, and who would action it?

## What to look for

- The workbook is a *starting point*. Its value isn't just spotting savings — it's converting each signal into an owned, governed action tied to a real owner and budget.

## Go deeper (optional)

- [`idle-resource-signals.kql`](idle-resource-signals.kql) — paste into **Resource Graph Explorer** to list the waste signals directly (unattached disks, idle public IPs, stopped-but-allocated VMs, empty resource groups, untagged resources).
- [`Get-CostOptimizationSignals.ps1`](Get-CostOptimizationSignals.ps1) — lists Advisor cost recommendations and prints a deep link to the workbook.
