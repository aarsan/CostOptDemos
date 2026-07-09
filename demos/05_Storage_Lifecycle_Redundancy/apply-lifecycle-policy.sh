#!/usr/bin/env bash
# =============================================================================
# Demo 5: Apply the sample blob lifecycle policy to a storage account.
# Requires: Azure CLI (az login done). Safe to run against a demo account only.
#
# Usage:
#   ./apply-lifecycle-policy.sh <resource-group> <storage-account-name>
#
# To preview instead of apply, just open lifecycle-policy.json and walk the
# rules — no need to run this live if you only have screenshots.
# =============================================================================
set -euo pipefail

RG="${1:?resource group required}"
ACCOUNT="${2:?storage account name required}"
POLICY_FILE="$(dirname "$0")/lifecycle-policy.json"

echo "Applying lifecycle policy from $POLICY_FILE"
echo "  Resource group : $RG"
echo "  Storage account: $ACCOUNT"

az storage account management-policy create \
  --account-name "$ACCOUNT" \
  --resource-group "$RG" \
  --policy "@$POLICY_FILE"

echo "Done. Verify in Portal > Storage account > Data management > Lifecycle management."
