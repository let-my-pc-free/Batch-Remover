:: this script deleting unwanted services, run values on registry and Scheduled Task Using lists as string in "unwanted-lists" diractory.

:: make the current directory where the batch and the lists
pushd %~dp0

:: warn the user About the Risk creating and using "Ask.vbs" file.
:: the Script showing MsgBox if user click "Ok" then the script returning EXIT CODE 0,
:: And if user click "Cancel" then the script returning EXIT CODE 1 and then the Batch EXIT.
set vbsWarnPath=%temp%\Warn.vbs
echo msgboxResult = MsgBox ("Warning: Although the software is rigorously tested, in rare cases it may damage your computer. Continue?", vbOKCancel+vbQuestion+vbDefaultButton2+vbSystemModal, "Warning") > %vbsWarnPath%
echo if msgboxResult = vbOK then >> %vbsWarnPath%
echo WScript.Quit(0) >> %vbsWarnPath%
echo elseif msgboxResult = vbCancel then >> %vbsWarnPath%
echo WScript.Quit(1) >> %vbsWarnPath%
echo end if >> %vbsWarnPath%

:: run the script (Warn.vbs)
%vbsWarnPath%

if errorlevel 1 (
del %vbsWarnPath% /q
exit
)
:: delete "Warn.vbs"
del %vbsWarnPath% /q

:: for each line in unwanted-services-list.txt, stop and delete the service name.
FOR /F "delims=;" %%s IN (unwanted-lists\unwanted-services-list.txt) DO (
sc stop %%s
sc delete %%s
)

:: for each line in unwanted-Run_Registry-list.txt, delete the value from run key on registry.
FOR /F "delims=;" %%r IN (unwanted-lists\unwanted-Run_Registry-list.txt) DO (
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v %%r /f
)

:: for each line in unwanted-Scheduled_Tasks-list.txt, delete the Scheduled Task.
FOR /F "delims=;" %%t IN (unwanted-lists\unwanted-Scheduled_Tasks-list.txt) DO (
schtasks /delete /tn %%t /f
)

pause
