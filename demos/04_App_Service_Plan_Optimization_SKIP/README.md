# Demo 4: App Service Plan Optimization

_Topic: Compute · Optional reference — not covered in the live session_

> This demo isn't part of the live agenda. It's included as a reference you can work through on your own.

App Service cost is paid at the **plan** level, not per app. This guide shows how to evaluate whether a plan is sized, scaled, and shared efficiently.

## What you'll learn

- Why the App Service **plan** is the billing container.
- Which settings drive plan cost: tier, instance count, scale-up vs scale-out, autoscale, slots, and diagnostics.
- Where consolidation and scheduled scaling can help.

## What you'll need

- Azure portal access to a subscription with an App Service Plan (optional — you can also just read through).

## Follow along

1. In the portal, open **App Service plans** and select a plan. Note its **pricing tier** and **instance count**.
2. Review the apps running on the plan, and the **scale-up** (tier) vs **scale-out** (instances) settings, any **autoscale** rules, **deployment slots**, and **diagnostics**.
3. Consider the options: **resize the tier**, **reduce instances**, **schedule autoscale** for predictable load, **consolidate** low-traffic apps onto one plan, or move to **Premium v3** — while keeping separation where resiliency or security requires it.

## What to look for

- Unlike a VM, the **plan** is what you pay for. Optimization usually starts by asking whether the plan is sized and shared appropriately for the apps on it.
