REM === removing service ===
REM for example, stopping and deleting the service "AdobeFlashPlayerUpdateSvc".
sc stop AdobeFlashPlayerUpdateSvc
sc delete AdobeFlashPlayerUpdateSvc

REM === removing Registry run value ===
REM for example removing the value "Adobe ARM" from run key on registry.
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Adobe ARM" /f

