#NOTE: I am still working on this - it's a basic script that gives information about any given user who is a member of an Active Directory domain 

$domain = Read-Host "Enter the domain name "  #Name of AD domain 

$user = Read-Host "Enter the login name for the user" #Prompts for login name 
$creationdate = (Get-ADUser $user -Properties whenCreated).whenCreated #Gets information about account creation date

#Write-Host "value is $creationdate" #Prints out value of last variable 


# Get the users information including LastLogon and LastLogonTimestamp
$user = Get-ADUser -Identity $username -Properties LastLogon, LastLogonTimestamp


$department = (Get-ADUser -Filter {samAccountName -like "teddy"} -Properties Department).Department
$jobtitle = (Get-ADUser -Filter {samAccountName -like "teddy"} -Properties Title).Title
$email = (Get-ADUser -Identity $user).UserPrincipalName 

$emailval = "$email" | findstr $domain 

#This is an if-else statement and the cool part about this is the code's ability to translate the time output into human readable form 
if ($user) {
    $lastLogon = [datetime]::FromFileTime($user.LastLogon)
    $lastLogonTimestamp = [datetime]::FromFileTime($user.LastLogonTimestamp)

    #Write-Host "User name: $($user.SamAccountName)"
    Write-Host =========================================================================
    Write-Host "Most Recent Login: $($lastLogon.ToString('MM/dd/yyyy hh:mm tt'))"
    Write-Host "Prior Login info: $($lastLogonTimestamp.ToString('MM/dd/yyyy hh:mm tt'))"
        Write-Host "Account created on $creationdate" 
    Write-host "Department: $department"
    Write-host "Job Title: $jobtitle"
    Write-Host "Email Address: $email"
    Write-Host =========================================================================
} else {
    Write-Host "User not found in Active Directory."
}

