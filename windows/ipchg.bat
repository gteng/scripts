@echo off 
color 0a 
title IP Change Script
:start 

@echo --------------------------------- 
@echo Choose a IP Config:
@echo 1.DHCP 
@echo 2.XIB 
@echo 3.PMO
@echo 4.exit
@echo --------------------------------- 
set /p choice=Plz choose: 
if /i "%choice%"=="1" goto DHCP
if /i "%choice%"=="2" goto EAST
if /i "%choice%"=="3" goto PMO
if /i "%choice%"=="4" goto end
cls 
@echo choose error, rechoose:

goto start 
:DHCP 
@echo set dhcp for Local Area Connection
netsh interface ip set address "Local Area Connection" dhcp 
goto end 

:XIB 
@echo set fixed ip for Local Area Connection
netsh interface ip set address "Local Area Connection" static 10.10.2.84 255.255.255.0 10.10.2.1 20
netsh interface ip set dnsservers name="Local Area Connection" source=static addr=10.10.21.12 register=PRIMARY validate=no
netsh interface ip add dnsservers name="Local Area Connection" addr=8.8.8.8 index=3 validate=no
netsh interface ip add dnsservers name="Local Area Connection" addr=10.10.21.9 index=2 validate=no
netsh interface ip set winsservers name="Local Area Connection" source=static addr=10.10.21.12
netsh interface ip add winsservers name="Local Area Connection" addr=10.10.21.36 index=2
goto end

:PMO
@echo set fixed ip for Local Area Connection
netsh interface ip set address "Local Area Connection" static 10.10.1.192 255.255.255.0 10.10.1.1 20
netsh interface ip set dnsservers name="Local Area Connection" source=static addr=10.10.21.12 register=PRIMARY validate=no
netsh interface ip add dnsservers name="Local Area Connection" addr=8.8.8.8 index=3 validate=no
netsh interface ip add dnsservers name="Local Area Connection" addr=10.10.21.9 index=2 validate=no
netsh interface ip set winsservers name="Local Area Connection" source=static addr=10.10.21.12
netsh interface ip add winsservers name="Local Area Connection" addr=10.10.21.36 index=2

:home
:end 
echo set successful,quit atuo. 
