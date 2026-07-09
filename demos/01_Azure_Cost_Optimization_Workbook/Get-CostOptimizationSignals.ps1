<#
.SYNOPSIS
    Demo 1 helper: deploy / open the Azure Cost Optimization workbook and pull
    Advisor cost recommendations for the talk track.

.DESCRIPTION
    The "Cost Optimization" workbook is published as an Azure Advisor gallery
    workbook. This script lists Advisor cost recommendations for the current
    (or specified) subscription so you have concrete numbers on screen, and
    prints the deep-link to open the workbook in the portal.

.NOTES
    Requires: Az.Accounts, Az.Advisor  (Install-Module Az.Advisor)
    Auth:     Connect-AzAccount  (reuse existing context if available)
#>
param(
    [string]$SubscriptionId
)

$ErrorActionPreference = 'Stop'

if ($SubscriptionId) {
    Set-AzContext -SubscriptionId $SubscriptionId | Out-Null
}
$ctx = Get-AzContext
Write-Host "Subscription: $($ctx.Subscription.Name) ($($ctx.Subscription.Id))" -ForegroundColor Cyan

Write-Host "`nAzure Advisor cost recommendations:" -ForegroundColor Yellow
$recs = Get-AzAdvisorRecommendation | Where-Object { $_.Category -eq 'Cost' }

if (-not $recs) {
    Write-Host "  (none returned — use the Microsoft demo environment / screenshots)" -ForegroundColor DarkYellow
}
else {
    $recs |
        Select-Object `
            @{n = 'Impact';   e = { $_.Impact } },
            @{n = 'Problem';  e = { $_.ShortDescriptionProblem } },
            @{n = 'Resource'; e = { ($_.ResourceId -split '/')[-1] } } |
        Sort-Object Impact |
        Format-Table -AutoSize
    Write-Host ("  Total cost recommendations: {0}" -f $recs.Count) -ForegroundColor Green
}

# Deep-link to the Advisor Cost Optimization workbook in the portal
$portalUrl = 'https://portal.azure.com/#view/Microsoft_Azure_Expert/AdvisorMenuBlade/~/CostOptimization'
Write-Host "`nOpen the Cost Optimization workbook:" -ForegroundColor Yellow
Write-Host "  $portalUrl"
