# deploy-ARM-Templates-in-azure-with-Powershell
Deploying Infrastructure to Azure using ARM Templates and Azure Devops (Infrastructure as Code) with a defined naming standard. 

This makes infrastructure deployment very easy to tell what resource it is, what environment, product, location just by the name. 

Its also super quick to deploy, In this repo I have provided one example of a PaaS resource (App Service Plan) but it can be replicated with any resource by changing the ARM JSON Files.

## Overview

![ARM and Azure Devops](https://etsaustorage.blob.core.windows.net/$web/images/github/armps1.jpg)


Objective: Create a simple Automated deployment process for infrastrucutre to be deployed and a Azure Devops CI/CD Pipeline using ARM Templates.

### Required: Azure Devops and Azure Portal Account

### Optional: Visual Studio Code




#### Setup the Project in Azure Devops

Create a new Project in Azure Devops, sign into your subscription so you can begin to build the pipelines.


#### Creating the Respository for CI in Git

Once you have got the project created, create a new Git Repo where you can store your ARM templates.Once you have a folder, add all the templates, to begin with we will add only template.JSON and one parameter.JSON for a App Service Plan

#### Setup Visual Studio Code for CI 

When the repo is created it will prompt to 'Clone in VS Code' which will automatically open and clone the Repo locally for future edits and publishing. Alternatively you can upload and directly edit the templates in Azure Devops.

#### Create the Build Pipeline to publish the template as an artifact

Each time you edit, update a script you want a new build artifact so you can select the template in the release pipeline

![ARM and Azure Devops](https://etsaustorage.blob.core.windows.net/$web/images/github/artifact.jpg)


#### Creating the ARM Templates

The easiest way I have found for creating the first template is to go into your Azure Portal, go New + and begin the process of one of your main resources, before clicking deploy button navigate to Download Template, this will download the entire Template including Powershell script if you wanted to deploy via CLI.



#### Creating Infrastructure Release Pipeline

The first pipeline we are going to create is purely for release to the ARM templates. We will copy and publish the ARM templates as an artifact. This is a zipped version of the folder with the contents, we will enable Continious Intergration so that each change we make or add to it will automatically trigger for the build pipeline to create a new build artifact with the changes.

![Azure DevOps Pipeline](https://etsaustorage.blob.core.windows.net/$web/images/github/pipeline.png)



#### Configuring and defining the Infrastructure parameters

once you have created your template, you can customise the options of the reource (the parameters) to your desired state. You can easily add and remove these variables from the parameters file and set default values if preferred in the template for variables you do not want the ability to easily change or update. I have created a readme file for reference so it is easy to understand what parameters need to be defined in order for the deployment to be successful.

![Azure PowerShell task](https://etsaustorage.blob.core.windows.net/$web/images/github/pstask.png)

#### Creating the Resource Group and assigning the necessary tags

![Resource Group Tags](https://etsaustorage.blob.core.windows.net/$web/images/github/tags.jpg)

Be aware that if the resource group exists but does not have the required tags, the deployment will fail. Required tags are environment/value, productname/value (Optional Customer/Value)


#### Deploying the infrastructure

Once you have defined what you want to deploy, save and create the release, providing you have selected the correct subscription with the necesary permissions it should deploy the resources into azure.

