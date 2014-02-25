@echo off 
color 0a 
title Change Wlan Connection
:start 

@echo --------------------------------- 
@echo Choose a IP Config:
@echo 1.Disconnected
@echo 2.Connect PMO 
@echo 3.Connect EAST
@echo 4.exit
@echo --------------------------------- 
set /p choice=Plz choose: 
if /i "%choice%"=="1" goto DIS
if /i "%choice%"=="2" goto PMO
if /i "%choice%"=="3" goto EAST
if /i "%choice%"=="4" goto end
cls 
@echo choose error, re choose:
goto start 

:DIS
@echo Disconnected Wlan
netsh wlan disconnect
goto end 


:PMO
set ssid="xib-pmo"
goto CONN

:EAST
set ssid="xib-internet-dq"
goto CONN



:CONN
@echo Connected %ssid% Wireless
netsh wlan connect name=%ssid%
goto end 

:end
color
pause

