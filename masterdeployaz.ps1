<#
    .DESCRIPTION
        Powershell Script Logic to Deploy resource type automating the name from resource tags. 


#>



param (
    
    [string] $resourceGroupName
 
 
    
)

$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
$location=$resourceGroup.Location
if(!$resourceGroup)
{
    Write-Host "Resource group '$resourceGroupName' does not exist. To create a new resource group, please enter a location.";
    if(!$resourceGroupLocation) {
        $resourceGroupLocation = Read-Host "resourceGroupLocation";
    }
    Write-Host "Creating resource group '$resourceGroupName' in location '$resourceGroupLocation'";
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}
else{
    Write-Host "Using existing resource group '$resourceGroupName'";
}


$PN = $resourceGroup.Tags.ProductName

if($PN -ne "empty") 
{
if($PN -eq "Product1")

}
else
{
Write-output ("Incorrect product name")
}



$env= ($resourceGroup.Tags.Environment.ToLower()).Trim()

$cus="-sha"



    if($resourceGroup.Tags.Customer -eq "Customer1")
    {
    $cus="-cu1"
    }
    

	
    if($resourceGroup.location -ne "")
    {
    if($resourceGroup.location -eq "AustraliaSoutheast")
    {
    $loc="au-se"
    }
    if($resourceGroup.location -eq "AustraliaEast")
    {
    $loc="au-ea"
    }
    if($resourceGroup.location -eq "Australiacentral")
    {
    $loc="au-c1"
    }
    if($resourceGroup.location -eq "Australiacentral2")
    {
    $loc="au-c2"
    }
}
else
{
Write-output ("Incorrect or unsupported location for naming")
}

$pn
$cus
$env
$loc

Write-Output ("##vso[task.setvariable variable=pn;]$pn") 
Write-Output ("##vso[task.setvariable variable=cus;]$cus") 
Write-Output ("##vso[task.setvariable variable=env;]$env") 
Write-Output ("##vso[task.setvariable variable=loc;]$loc") 


