# Demo 2: VM Right-Sizing

_Topic: Compute_

Underused virtual machines are one of the most common sources of avoidable cost. This demo walks through a repeatable way to decide what to do about them — resize, schedule, switch pricing model, or leave alone.

## What you'll learn

- How to find right-sizing candidates from Azure Advisor.
- How to validate a VM's real utilization before acting.
- How to choose between resize, scheduled shutdown, burstable, Spot, modernization, or no action.

## What you'll need

- Azure portal access to a subscription with at least one VM (or just follow along with the views).

## Follow along

1. In the portal, open **Advisor** → **Cost**, and find **"Right-size or shut down underutilized virtual machines."**
2. Open one of the listed VMs, go to **Monitoring** → **Metrics**, and chart **CPU (average and max)** over the last **14–30 days**. If guest metrics are enabled, also review memory; check disk and network too.
3. Check the constraints that a chart won't show: memory headroom, disk throughput needs, licensing, and how business-critical the workload is.
4. Compare the options: **resize** to a smaller SKU, **schedule shutdown** (Auto-shutdown or Start/Stop), move to a **burstable B-series**, use **Spot** (see Demo 3), **modernize** to a PaaS service, or **no action** if the size is justified.

## What to look for

- Underutilization is a **signal, not a verdict**. The goal is to identify candidates and then make an informed decision — not to blindly shrink every VM.

## Go deeper (optional)

- [`vm-rightsizing-candidates.kql`](vm-rightsizing-candidates.kql) — VM Insights / Perf queries to find candidates (average + 95th-percentile CPU) and validate a single VM across CPU, memory, disk, and network.
- [`Get-VMRightSizeRecommendations.ps1`](Get-VMRightSizeRecommendations.ps1) — Advisor right-size/shutdown recommendations with current SKU, target SKU, and projected annual savings.
