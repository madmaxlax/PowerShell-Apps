rem this is heplful if you need a .bat script to initiate the powershell script
rem Powershell has this security restriction on it for running user-created files, and this avoids that temporarily
Powershell.exe -executionpolicy remotesigned -File "C:\Users\you\Desktop\yourscript.ps1"
