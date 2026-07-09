<#
.SYNOPSIS
    Demo 2 helper: list Azure Advisor VM right-size / shutdown recommendations
    with the estimated annual savings, so you can drive the decision-flow demo
    from real data.

.DESCRIPTION
    Pulls Cost-category Advisor recommendations, filters to VM right-size and
    shutdown recommendations, and surfaces the current SKU, the target SKU, and
    the annual savings Advisor projects. Use this to pick ONE VM and then walk
    the "signal -> validate -> decide" flow live.

.NOTES
    Requires: Az.Accounts, Az.Advisor  (Install-Module Az.Advisor)
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

$recs = Get-AzAdvisorRecommendation |
    Where-Object { $_.Category -eq 'Cost' } |
    Where-Object {
        $_.ShortDescriptionProblem -match 'right-size|right size|shutdown|underutilized|virtual machine'
    }

if (-not $recs) {
    Write-Host "No VM right-size recommendations returned. Fall back to KQL candidate detection (vm-rightsizing-candidates.kql)." -ForegroundColor DarkYellow
    return
}

$recs |
    Select-Object `
        @{n = 'VM';           e = { ($_.ResourceId -split '/')[-1] } },
        @{n = 'Problem';      e = { $_.ShortDescriptionProblem } },
        @{n = 'CurrentSku';   e = { $_.ExtendedProperty.currentSku } },
        @{n = 'TargetSku';    e = { $_.ExtendedProperty.targetSku } },
        @{n = 'AnnualSaving'; e = { $_.ExtendedProperty.annualSavingsAmount } },
        @{n = 'Currency';     e = { $_.ExtendedProperty.savingsCurrency } } |
    Format-Table -AutoSize

Write-Host ("Total VM cost recommendations: {0}" -f $recs.Count) -ForegroundColor Green
