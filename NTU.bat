@echo off
title Scaning adapters...
:scan
set GPU0=NONE
FOR /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DriverDesc"') do set GPU0=%%b >nul
set GPU1=NONE
FOR /F "tokens=2* skip=2" %%c in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "DriverDesc"') do set GPU1=%%d >nul
set GPU2=NONE
FOR /F "tokens=2* skip=2" %%e in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v "DriverDesc"') do set GPU2=%%f >nul
set GPU3=NONE
FOR /F "tokens=2* skip=2" %%g in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "DriverDesc"') do set GPU3=%%h >nul
set GPU4=NONE
FOR /F "tokens=2* skip=2" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0004" /v "DriverDesc"') do set GPU4=%%j >nul
goto selectgpu

:selectgpu
cls
title - NvidiaTweakingUtility: Select GPU
echo.
echo   [35m====================================================================================================================
echo [92m        ____      __      __    _____ ___   __  __
echo [92m       / __/___  / /___  / /_  / ___// _ \ / / / /
echo [92m      _\ \ / -_)/ // -_)/ __/ / (_ // ___// /_/ / 
echo [92m     /___/ \__//_/ \__/ \__/  \___//_/    \____/  
echo [92m     
echo   [35m====================================================================================================================
echo.
echo      [35m--------------------------------------------------------------------------------------------------------------
echo         [94m 1:%GPU0%
echo         [94m 2:%GPU1%
echo         [94m 3:%GPU2%
echo         [94m 4:%GPU3%
echo         [94m 5:%GPU4%
echo      [35m--------------------------------------------------------------------------------------------------------------
set /p "GPUS=GPU:"
if %GPUS%==1 goto 12
if %GPUS%==2 goto 22
if %GPUS%==3 goto 32
if %GPUS%==4 goto 42
if %GPUS%==5 goto 52

goto selectgpu

:12
set TYPE=0000
set GPU=%GPU0%
goto menu

:22
set TYPE=0001
set GPU=%GPU1%
goto menu

:33
set TYPE=0002
set GPU=%GPU2%
goto menu

:42
set TYPE=0003
set GPU=%GPU3%
goto menu

:52
set TYPE=0004
set GPU=%GPU4%
goto menu

:menu
cls
title -                                                                        - NvidiaTweakingUtility - V01 - Writed by 1F4uc1k -                                                                         -
echo.
echo        [31mI am not responsible for any problems after using the utility! Remember to install debloated driver!
echo        [31mScript only works on Game Ready Driver on Studio you will break your system!
echo   [35m====================================================================================================================
echo [92m        _  __       _     __ _       ______                    __    _             __  __ __   _  __ _  __
echo [92m       / ^|/ /_  __ (_)___/ /(_)___ _/_  __/_    __ ___  ___ _ / /__ (_)___  ___ _ / / / // /_ (_)/ /(_)/ /_ __ __
echo [92m      /    /^| ^|/ // // _  // // _ `/ / /  ^| ^|/^|/ // -_)/ _ `//  '_// // _ \/ _ `// /_/ // __// // // // __// // /
echo [92m     /_/^|_/ ^|___//_/ \_,_//_/ \_,_/ /_/   ^|__,__/ \__/ \_,_//_/\_\/_//_//_/\_, / \____/ \__//_//_//_/ \__/ \_, /
echo [92m                                                                          /___/                           /___/
echo   [35m====================================================================================================================
echo.
echo      [35m--------------------------------------------------------------------------------------------------------------
echo         [94m Selected GPU:%GPU%
echo      [35m--------------------------------------------------------------------------------------------------------------
echo         [94m 1.Enable Tweaks (Temperatures will increase!)
echo         [94m 2.Enable Pstates ^& Clock SlowDown (If temperatures are too high)
echo      [35m--------------------------------------------------------------------------------------------------------------
set /p "twk=Option:"
if %twk%==1 goto 1
if %twk%==2 goto 2
goto menu

:1
cls
curl -g -k -L "https://raw.githubusercontent.com/1F4uc1k/Nvidia-Tweaking-Utility/main/nvlddmkm/nvlddmkm.reg" --output "%temp%\nvlddmkm.reg" && "%temp%\nvlddmkm.reg" && del "%temp%\nvlddmkm.reg"
cls
curl -g -k -L "https://raw.githubusercontent.com/1F4uc1k/Nvidia-Tweaking-Utility/main/NVDisplay.ContainerLocalSystem/NVDisplay.ContainerLocalSystem.reg" --output "%temp%\NVDisplay.ContainerLocalSystem.reg" && "%temp%\NVDisplay.ContainerLocalSystem.reg" && del "%temp%\NVDisplay.ContainerLocalSystem.reg"
cls
if %TYPE%==0000 (curl -g -k -L "https://raw.githubusercontent.com/1F4uc1k/Nvidia-Tweaking-Utility/main/DisplayAdapter/0000.reg" --output "%temp%\0000.reg" && "%temp%\0000.reg" && del "%temp%\0000.reg") 
else if %TYPE%==0001 (curl -g -k -L "https://raw.githubusercontent.com/1F4uc1k/Nvidia-Tweaking-Utility/main/DisplayAdapter/0001.reg" --output "%temp%\0001.reg" && "%temp%\0001.reg" && del "%temp%\0001.reg") 
else if %TYPE%==0002 (curl -g -k -L "https://raw.githubusercontent.com/1F4uc1k/Nvidia-Tweaking-Utility/main/DisplayAdapter/0002.reg" --output "%temp%\0002.reg" && "%temp%\0002.reg" && del "%temp%\0002.reg") 
else if %TYPE%==0003 (curl -g -k -L "https://raw.githubusercontent.com/1F4uc1k/Nvidia-Tweaking-Utility/main/DisplayAdapter/0003.reg" --output "%temp%\0003.reg" && "%temp%\0003.reg" && del "%temp%\0003.reg") 
else if %TYPE%==0004 (curl -g -k -L "https://raw.githubusercontent.com/1F4uc1k/Nvidia-Tweaking-Utility/main/DisplayAdapter/0004.reg" --output "%temp%\0004.reg" && "%temp%\0004.reg" && del "%temp%\0004.reg")
cls
echo done!
timeout /t 2 >nul
goto menu

:2
cls
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%TYPE%" /v "DisableDynamicPstate" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%TYPE%" /v "DisableAsyncPstates" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%TYPE%" /v "EnableMClkSlowdown" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\%TYPE%" /v "RMClkSlowDown" /t REG_DWORD /d "1" /f
cls
echo done!
timeout /t 2 >nul
goto menu