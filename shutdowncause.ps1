if ( 
(Get-WinEvent -FilterHashtable @{ LogName = 'System'; Id = 41} | Format-List Id, LevelDisplayName, TimeCreated, Message | findstr Critical 
)
) 
{ 
write-host Logs indicate at least one unexpected shutdown with a critical status. 
write-host Please review the following results: 
Write-Host ==================================================================================
Get-WinEvent -LogName System | findstr  Critical
Write-Host ==================================================================================
}
else { 
Write-host "No critical events related to system shutdowns found in logs" 
} 

