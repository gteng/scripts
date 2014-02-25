@ECHO OFF
CLS
color 0a
:menu
echo.
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo             请选择要进行的操作，然后按回车
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo               1、Start
echo.
echo               2、Stop
echo.
echo               3、退出

:cho
set /p choice=  请选择:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto start
if /i "%choice%"=="2" goto stop
if /i "%choice%"=="3" goto end
echo 选择无效，请重新输入
echo.
goto cho

:start
echo strt oracle...
net start OracleServiceORCL
net start OracleOraDb11g_home1TNSListener
echo 启动完成,按任意键退出
goto end

:stop
echo stop oracle...
net stop OracleServiceORCL
net stop OracleOraDb11g_home1TNSListener
echo 关闭完成，按任意键退出
:end
pause>nul
