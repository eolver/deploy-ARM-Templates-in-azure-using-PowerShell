<#
    .DESCRIPTION
        Powershell Script to Deploy App Service Plan automating the name from resource tags. 

        Created by Elliott Olver www.etsolutionsau.com   
        
#>

param (
    
    [string] $resourceGroupName,
    [string] $resourceGroupLocation,
    [string] $location,
    [string] $purpose,
    [string] $sku,
    [string] $skucode
 
    
)
$templateFilePath="$PSScriptRoot\template.json"
$parametersFilePath="$PSScriptRoot\parameters.json"
 
."$PSScriptRoot\masterdeployaz.ps1" -resourceGroupName $resourceGroupName

$aspname=$pn+$cus+"-"+$env+"-"+$purpose+"-"+"asp"+"-"+$loc
Write-Output ("$aspName")
Write-Output ("##vso[task.setvariable variable=aspname;]$aspName") 

$deploymentName="asp"+"-"+$aspname

New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -name $deploymentName -TemplateFile $templateFilePath `
 -TemplateParameterFile $parametersFilePath -aspname $aspName -Location $location -sku $sku -skuCode $skucode


