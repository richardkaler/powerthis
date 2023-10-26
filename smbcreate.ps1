#This is a script to quickly create an encrypted SMB share by using two simple arguments 

if ($args[0] -eq "-h") {
Write-Host "============================== Help Menu ============================="
Write-Host "Script Requires two arguments: [share name] + [share path]"
Write-Host "Ex: 'smbcreate.ps1 sharevol C:\Users\username'"
Write-Host "Share named 'sharevol' will be created at 'C:\Users\username'"
Write-Host "=======================================================================" 
}
else {
$name = $args[0]
$path = $args[1]

 if(New-SmbShare -Name "$name" -Path "$path" -EncryptData $True) {
    Write-Host("SMB share created with encryption") 
    Get-SmbShare -Name "$name" 
    }else {
    Write-Host("Failed to create share. Are you an Administrator? Try something else or check your syntax") #this is an important reminder that the script requires administrator privileges 
    Write-Host("You can review the help menu anytime with smbcreate -h") 
    Write-Host "=============================================================="
    }

    }
