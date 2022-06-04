@echo off
net.exe session 1>NUL 2>NUL || (goto no2)

:start

echo Searching...
sc queryex Wpcmonsvc
set /P answer="Kill process? "

If /I "%answer%"=="no" goto no3


If /I "%answer%"=="yes" goto yes
:no
echo Quitting...
exit /b 1





:yes
sc queryex Wpcmonsvc
set /P pid="What is your PID? "
taskkill /F /pid %pid%


:no2
echo Run me with admin!

:no3
sc queryex Wpcmonsvc
start ‪C:\Windows\System32\WpcMon.exe
echo Result:
sc queryex Wpcmonsvc