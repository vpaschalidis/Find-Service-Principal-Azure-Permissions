Connect-AzAccount 
$Subscriptions = Get-AzSubscription
foreach ($Subscription in $Subscriptions)
{
    $sub = Set-AzContext -Subscription $Subscription.Id
    $SPRoleAssignment += Get-AzRoleAssignment | Where-Object {$_.ObjectType -eq "ServicePrincipal"} 
}
$SPRoleAssignment | select DisplayName,RoleDefinitionName,Scope | ft -AutoSize -Wrap
