# Get the credential
#$credential = Get-Credential
#Start-Sleep -s 300
## Define the Send-MailMessage parameters
$mailParams = @{
    #SmtpServer                 = 'smtp.office365.com'
    #Port                       = '587' # or '25' if not using TLS
    SmtpServer                 = 'microsoft.mail.protection.outlook.com'
    Port                       = '25' # or '25' if not using TLS
    UseSSL                     = $true ## or not if using non-TLS
    #Credential                 = $credential
    From                       = 'damian.yates@darigold.com'
    To                         = 'Jared.Karppi@darigold.com'
    CC                         = 'damian.yates@darigold.com', 'damian.yates@gmail.com
##The following requires a decision tree and selection matrix for end user interaction.
    #Subject                    = "In office - $(Get-Date -Format g)"
    #Body                       = 'In office'
    #Subject                    = "Out to lunch - $(Get-Date -Format g)"
    #Body                       = 'Out to lunch'
    #Subject                    = "In from lunch - $(Get-Date -Format g)"
    #Body                       = 'Back at my desk'
    Subject                    = "Out of office - $(Get-Date -Format g)"
    Body                       = 'Have a great evening'
    DeliveryNotificationOption = 'OnFailure', 'OnSuccess'
}
## Send the message

Send-MailMessage @mailParams

#$Outlook = New-Object -ComObject Outlook.Application
