<#
.SYNOPSIS
    *Script is broken* 
    This script collects input information from user needed to properly create bulk Active Directory Security Groups 
.DESCRIPTION
    Information Pending
.NOTES
    File Name: Add-BulkADGroups.ps1
    Author: Damian J. Yates
    Built on Powershell Version: 
    Created Date: 05/06/2021 
    GIT REPO: https://github.com/damianjyates/Powershell
#>
#Import Active Directory Module 
Import-Module ActiveDirectory

#Ask for the path to the csv file for processing
#$csv = Read-Host -Prompt "Enter location of csv"

#Ask for the DN of the container to create the groups in
#$OU = Read-Host -Prompt "Enter the DN of the container to place the new groups in"

#Ask for the Owner of the group. *Note: Enter the "Display Name" of the regular account of the user.
#$owner = Read-Host -Prompt "Enter the name of the Requestor of the Group"

#Begin Script Processing

$groups = Import-Csv "C:\Users\dayates\OneDrive - Darigold\Documents\Draft Documents\Ticket Work\0045913\Groups.csv" #Import list of groups from csv file
$manager = Get-ADUser -Filter "Name -eq '$owner'" | Select samaccountname #Collect samaccountname of Owner
foreach ($group in $groups) {
New-ADGroup -Name $group.name -Path "OU=Controls Groups,OU=Groups,OU=Darigold Users,DC=westfarm,DC=com" -Description “New Groups Created in Bulk” -GroupCategory Security -GroupScope Global -Managedby "Brian Ackerson" #Create a group for each item in csv
}