# Azure Cost Optimization Workshop — Hands-On Demos

Welcome! This repository contains the follow-along guides for the **Azure Cost Optimization** workshop. Each demo is a short, self-contained walkthrough you can read and do in your **own Azure subscription** as we go.

## How to use this repo

- Each demo lives in its own folder under [`demos/`](demos/) with a step-by-step `README.md`.
- Every guide has the same shape: **what you'll learn**, **what you'll need**, **follow-along steps**, and **what to look for**.
- Most steps use the Azure portal (<https://portal.azure.com>). Where a query or script can take you further, it's linked at the bottom of each demo under **Go deeper (optional)** — these are optional and never required to follow along.
- Nothing here creates costly resources. Where a demo builds something, you'll also delete it at the end.

## Demos

| # | Demo | Topic |
|---|------|-------|
| 1 | [Azure Cost Optimization Workbook](demos/01_Azure_Cost_Optimization_Workbook/README.md) | Cost visibility & accountability |
| 2 | [VM SKU Right-Sizing](demos/02_VM_SKU_Right_Sizing/README.md) | Compute |
| 3 | [Azure Spot VM Pricing](demos/03_Azure_Spot_VM_Pricing_Calculator/README.md) | Compute |
| 4 | [App Service Plan Optimization](demos/04_App_Service_Plan_Optimization_SKIP/README.md) _(optional reference)_ | Compute |
| 5 | [Storage Lifecycle & Redundancy](demos/05_Storage_Lifecycle_Redundancy/README.md) | Storage |
| 6 | [Log Analytics Cost Controls](demos/06_Log_Analytics_Cost_Controls/README.md) | Monitoring |
| 7 | [Networking Cost Optimization](demos/07_Networking_Cost_Signal_Review/README.md) | Networking |

## A note on cost signals

Throughout these demos, treat a cost signal as a **question, not a verdict**. The goal is to separate genuine waste from legitimate performance, security, and resiliency requirements — and to turn each finding into an owned, intentional decision.
