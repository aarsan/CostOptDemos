# Demo 2: VM SKU Decision and Right-Sizing Considerations

**Segment:** Workload Optimization – Compute
**Speaker/Owner:** Ahmet Arsan
**Timebox:** 12 minutes

## Overview

**Description:** Show a practical decision flow for reviewing VM cost drivers such as region, generation, SKU family, utilization, billing state, and workload characteristics before choosing resize or modernization actions.

**Customer takeaway:** Bosch gets a repeatable method for separating obvious waste from legitimate performance requirements and identifying where reservations or savings plans should come after right-sizing.

**Owner/readiness:** Ahmet Arsan should prepare an example before/after SKU discussion and define which Azure Advisor, Azure Monitor, Log Analytics, or Cost Management signals will be referenced.

## Demo Script

- **Goal:** Demonstrate that VM right-sizing is a controlled decision process that starts with utilization signals and ends with an informed action.
- **Setup:** Prepare Azure Advisor right-size recommendations or a Log Analytics workspace with VM performance counters. If using KQL, show candidate detection using average CPU, 95th percentile CPU, memory, disk, and network signals where available.
- **Steps:**
  1. Explain the decision frame: find candidates, validate workload behavior, choose action, confirm savings and risk.
  2. Show a candidate list from Advisor or KQL.
  3. Pick one VM, inspect 14–30 days of utilization.
  4. Validate memory / disk / network / licensing / criticality constraints.
  5. Compare actions such as resize, schedule shutdown, burstable, Spot, modernization, or no action.
- **Talk track:** "Underutilization is a signal, not a verdict. The goal is to identify candidates and then decide whether resize, scheduling, Spot, burstable, modernization, or no action is the right move."
- **Fallback:** If guest metrics are not available, use Azure Advisor and Azure Monitor platform metrics, then discuss what additional VM Insights or Log Analytics data would improve confidence.

## Assets

- [`vm-rightsizing-candidates.kql`](vm-rightsizing-candidates.kql) — VM Insights / Perf KQL to find right-size candidates (avg + p95 CPU) and a multi-signal validation query for a single VM.
- [`Get-VMRightSizeRecommendations.ps1`](Get-VMRightSizeRecommendations.ps1) — Advisor VM right-size/shutdown recommendations with current SKU, target SKU, and projected annual savings.

## Notes / Prep

_Add demo-specific setup notes, links, screenshots, or KQL queries here._
