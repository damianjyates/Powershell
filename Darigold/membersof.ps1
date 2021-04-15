$secmem = Get-ADGroupMember -Identity "SEC_TETRAPAK_PORTAL" | Select samaccountname 
foreach ($mem in $secmem) {
    $props = Get-ADUser -Identity $mem.samaccountname -Properties * |Select -Property mail,manager
    $man = Get-ADUser $props.manager
    Write-Host $mem.samaccountname $props.mail $man.UserPrincipalName
}