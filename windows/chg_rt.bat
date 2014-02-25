@ECHO OFF
title "set route"
color 0a
:menu
set  choice=
echo.
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo             请选择要进行的操作，然后按回车
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo               1、add 10 18
echo               2、add 10 49
echo               3、add all 18
echo               4、add all 49
echo               5、remove 10
echo               6、remove all
echo               7、exit

:cho
set /p choice=  请选择:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="1" goto add_10_18
if /i "%choice%"=="2" goto add_10_49
if /i "%choice%"=="3" goto add_all_18
if /i "%choice%"=="4" goto add_all_49
if /i "%choice%"=="5" goto remove_10
if /i "%choice%"=="6" goto remove_all
if /i "%choice%"=="7" goto end
echo 选择无效，请重新输入
echo.
goto menu

:add_10_18
route delete 10.10.0.0
route add 10.10.0.0  mask 255.255.0.0  10.10.18.1  metric 10
goto menu

:add_10_49
route delete 10.10.0.0
route add 10.10.0.0  mask 255.255.0.0  10.10.49.1  metric 10
goto menu

:add_all_18
route delete 0.0.0.0
route add 0.0.0.0  mask 0.0.0.0  10.10.18.1  metric 10
goto menu

:add_all_49
route delete 0.0.0.0
route add 0.0.0.0  mask 0.0.0.0  10.10.49.1  metric 10
goto menu

:remove_10
route delete 10.10.0.0
goto menu

:remove_all
route delete 0.0.0.0
goto menu


:set_default_route
:: set default route
:gateway_menu
echo.
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo             please choose the gateway, and then enter.
echo             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo               1、10.10.193.1
echo               2、192.168.100.1
echo               3、192.168.1.1
echo               4、other 
echo               5、exit
set /p gateway_c= choose the default gateway:
IF NOT "%gateway_c%"=="" SET choice=%gateway_c:~0,1%
if /i "%gateway_c%"=="1" goto default_route_via_xib
if /i "%gateway_c%"=="2" goto default_route_via_dq
if /i "%gateway_c%"=="3" goto default_route_via_lh
if /i "%gateway_c%"=="4" goto default_route_via_other
if /i "%gateway_c%"=="5" goto default_route_exit
echo 选择无效，请重新输入
echo.
goto gateway_menu


:default_route_via_xib
set route_gateway=10.10.193.1
goto change_default_route
:default_route_via_dq
set route_gateway=192.168.100.1
goto change_default_route
:default_route_via_lh
set route_gateway=192.168.1.1
goto change_default_route
:default_route_via_other
set /p route_gateway=input the default gateway:
goto change_default_route
:default_route_exit
goto end

:change_default_route
echo set  default route via %route_gateway% ...
route delete 0.0.0.0
route add 0.0.0.0  mask 0.0.0.0  %route_gateway%  metric 10
goto end


:remove_default_route
echo remove xib route...
route delete 0.0.0.0
:end
echo 设置完成，按任意键退出
pause>nul








