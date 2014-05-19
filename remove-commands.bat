:: === removing service ===
:: for example, stopping and deleting the service "AdobeFlashPlayerUpdateSvc":
sc stop AdobeFlashPlayerUpdateSvc :: stopping the service
sc delete AdobeFlashPlayerUpdateSvc :: deleting the service

:: === removing Registry run value ===
:: for example removing the value "Adobe ARM" from run key on registry:
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Adobe ARM" /f

:: === removing Scheduled Task ===
:: for example removing the Scheduled Task "Adobe Flash Player Updater":
schtasks /delete /tn "Adobe Flash Player Updater" /f
