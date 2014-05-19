:: this script deleting unwanted services, run values on registry and Scheduled Task Using lists as string in same diractory as the batch.

:: make the current directory wher the batch and the lists
pushd %~dp0

:: for each line in unwanted-services.txt, stop and delete the service name.
FOR /F "delims=;" %%s IN (unwanted-services.txt) DO (
sc stop %%s
sc delete %%s
)

:: for each line in unwanted-Run_Registry.txt, delete the value from run key on registry.
FOR /F "delims=;" %%r IN (unwanted-Run_Registry.txt) DO (
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v %%r /f
)

:: for each line in unwanted-Scheduled_Tasks-list.txt, delete the Scheduled Task.
FOR /F "delims=;" %%t IN (unwanted-Scheduled_Tasks-list.txt) DO (
schtasks /delete /tn %%t /f
)

pause
