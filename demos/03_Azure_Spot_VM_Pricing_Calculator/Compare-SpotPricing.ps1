<#
.SYNOPSIS
    Demo 3: Compare standard (pay-as-you-go) vs Spot pricing for a VM family in
    a region using the public Azure Retail Prices API. No auth required.

.DESCRIPTION
    Queries https://prices.azure.com/api/retail/prices and pairs each Spot SKU
    with its consumption (pay-as-you-go) equivalent to show the live discount.
    Use this on screen to make the "is Spot worth it here?" decision concrete.

.PARAMETER Region
    Azure region armRegionName, e.g. 'eastus', 'westeurope'.

.PARAMETER SkuPrefix
    VM size prefix to filter on, e.g. 'Standard_D' or 'Standard_F2s_v2'.

.EXAMPLE
    ./Compare-SpotPricing.ps1 -Region eastus -SkuPrefix Standard_D2s_v5
#>
[CmdletBinding()]
param(
    [string]$Region = 'eastus',
    [string]$SkuPrefix = 'Standard_D2s_v5'
)

$ErrorActionPreference = 'Stop'

$filter = "serviceName eq 'Virtual Machines' " +
          "and armRegionName eq '$Region' " +
          "and priceType eq 'Consumption' " +
          "and contains(armSkuName, '$SkuPrefix')"

$baseUri = 'https://prices.azure.com/api/retail/prices?currencyCode=USD&$filter=' +
           [uri]::EscapeDataString($filter)

Write-Host "Querying Azure Retail Prices for '$SkuPrefix' in '$Region'..." -ForegroundColor Cyan

$items = [System.Collections.Generic.List[object]]::new()
$next = $baseUri
while ($next) {
    $resp = Invoke-RestMethod -Uri $next -Method Get
    $resp.Items | ForEach-Object { $items.Add($_) }
    $next = $resp.NextPageLink
}

# Exclude Windows (has extra license cost) and low-priority spec rows; keep Linux.
$rows = $items |
    Where-Object { $_.productName -notmatch 'Windows' } |
    Group-Object armSkuName |
    ForEach-Object {
        $std  = $_.Group | Where-Object { $_.meterName -notmatch 'Spot|Low Priority' } | Select-Object -First 1
        $spot = $_.Group | Where-Object { $_.meterName -match 'Spot' }                  | Select-Object -First 1
        if ($std -and $spot) {
            $discount = if ($std.retailPrice -gt 0) {
                [math]::Round((1 - ($spot.retailPrice / $std.retailPrice)) * 100, 1)
            } else { $null }
            [pscustomobject]@{
                Sku          = $_.Name
                StdPerHour   = [math]::Round($std.retailPrice, 4)
                SpotPerHour  = [math]::Round($spot.retailPrice, 4)
                'Discount%'  = $discount
                StdMonthly   = [math]::Round($std.retailPrice  * 730, 2)
                SpotMonthly  = [math]::Round($spot.retailPrice * 730, 2)
            }
        }
    }

if (-not $rows) {
    Write-Host "No matching Spot/Standard pair found. Try a broader -SkuPrefix (e.g. 'Standard_D')." -ForegroundColor DarkYellow
    return
}

$rows | Sort-Object 'Discount%' -Descending | Format-Table -AutoSize

Write-Host "`nNote: Spot price is dynamic and capacity-dependent; VMs can be evicted." -ForegroundColor DarkGray
Write-Host "Monthly figures assume 730 hrs of continuous run (Spot rarely runs uninterrupted)." -ForegroundColor DarkGray
