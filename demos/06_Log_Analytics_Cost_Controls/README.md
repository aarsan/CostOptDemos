# Demo 6: Log Analytics Cost Controls

_Topic: Monitoring_

Log Analytics cost is driven mostly by **how much data you ingest** and **how long you keep it**. This demo shows how to see your biggest cost drivers and put guardrails in place — without losing the visibility you need.

## What you'll learn

- What actually drives Log Analytics cost: ingestion volume, retention, table plan, and commitment tier.
- How to find your highest-ingesting tables.
- Which controls reduce cost while preserving observability and security.

## What you'll need

- Azure portal access to a subscription with a **Log Analytics workspace**.

## Follow along

1. Open your **Log Analytics workspace** → **Usage and estimated costs**. Review the ingestion volume, estimated cost, and available **commitment tiers**.
2. Open **Logs** and run a query to find your highest-ingesting tables (see [`log-analytics-cost.kql`](log-analytics-cost.kql) for ready-to-paste queries).
3. Trace the biggest tables back to their **diagnostic settings** and **data collection rules**, and trim categories you don't need.
4. Apply the controls: adjust **per-table retention**, evaluate **Basic/Auxiliary table plans** for high-volume low-query data, set a **daily cap** carefully, and **alert on ingestion spikes**.

## What to look for

- The goal is **intentional logging, not less logging** — the right data, kept for the right duration, on the right cost model.

## Go deeper (optional)

- [`log-analytics-cost.kql`](log-analytics-cost.kql) — billable ingestion by table, daily trend, spike detection, top-ingesting sources, and a monthly cost estimate from the `Usage` table.
