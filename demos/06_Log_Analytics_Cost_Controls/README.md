# Demo 6: Log Analytics Workspace Cost Controls

**Segment:** Workload Optimization – Storage and Log Analytics
**Speaker/Owner:** Umesh Panwar
**Timebox:** 10 minutes

## Overview

**Description:** Show how Log Analytics cost is driven by ingestion volume, retention, table plans, commitment tiers, workspace design, and data collection scope; discuss daily caps and high-ingestion alerting as guardrails.

**Customer takeaway:** Bosch sees how monitoring cost can be managed intentionally while preserving operational and security visibility.

**Owner/readiness:** Umesh Panwar should prepare a sample workspace view or KQL-backed discussion of ingestion trends and retention choices.

## Demo Script

- **Goal:** Show Bosch how to identify and control Log Analytics cost drivers without weakening observability or security posture.
- **Setup:** Prepare a sample workspace, Usage and Estimated Costs view, table usage view, or KQL queries that show ingestion by table over time.
- **Steps:**
  1. Explain that cost is mainly driven by ingestion, retention, table plan, and commitment tier.
  2. Show highest-ingestion tables.
  3. Connect them to data collection rules and diagnostic settings.
  4. Discuss controls such as reducing unnecessary categories, tuning collection, adjusting retention, evaluating table plans, setting caps carefully, and alerting on spikes.
- **Talk track:** "The goal is not less logging; the goal is intentional logging. We want the right data, retained for the right duration, at the right cost model."
- **Fallback:** If no live workspace is available, show a sample ingestion breakdown and walk through the decision process.

## Assets

- [`log-analytics-cost.kql`](log-analytics-cost.kql) — billable ingestion by table, daily trend, spike detection, top-ingesting sources, and a monthly cost estimate from the `Usage` table.

## Notes / Prep

_Add demo-specific setup notes, links, screenshots, or KQL queries here._
