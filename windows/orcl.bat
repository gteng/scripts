@ECHO OFF
CLS
color 0a
:menu
echo.
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo             ��ѡ��Ҫ���еĲ�����Ȼ�󰴻س�
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo               1��Start
echo.
echo               2��Stop
echo.
echo               3���˳�

:cho
set /p choice=  ��ѡ��:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto start
if /i "%choice%"=="2" goto stop
if /i "%choice%"=="3" goto end
echo ѡ����Ч������������
echo.
goto cho

:start
echo strt oracle...
net start OracleServiceORCL
net start OracleOraDb11g_home1TNSListener
echo �������,��������˳�
goto end

:stop
echo stop oracle...
net stop OracleServiceORCL
net stop OracleOraDb11g_home1TNSListener
echo �ر���ɣ���������˳�
:end
pause>nul
