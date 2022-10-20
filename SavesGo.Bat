@REM Get admin

    %1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" ::","","runas",1)(window.close)&&exit

@REM Set variable

    setlocal enabledelayedexpansion
    set current_date=%date:~0,4%.%date:~5,2%.%date:~8,2%
    set Saves=%~dp0Saves

@REM Set start menu shortcut

    if not exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\SavesGo.lnk" ( xcopy /y /e "%Saves%\SavesGo.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs" )

@REM Get object path

    @REM SOFTWARE

    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Valve\Steam" /v InstallPath ^| find /i "InstallPath"') do set "steam_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\NeteaseGacc" /v DisplayIcon ^| find /i "DisplayIcon"') do set "uu_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Tencent\QQ2009" /v Install ^| find /i "Install"') do set "qq_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Tencent\TIM" /v Install ^| find /i "Install"') do set "tim_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Tencent\WeChat" /v InstallPath ^| find /i "InstallPath"') do set "wechat_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\OBS Studio" /ve') do set "obs_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Sogou Input" /v InstallLocation ^| find /i "InstallLocation"') do set "sougoupy_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Internet Download Manager" /v DisplayIcon ^| find /i "DisplayIcon"') do set "idm_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_CURRENT_USER\SOFTWARE\DAUM\PotPlayer64" /v ProgramFolder ^| find /i "ProgramFolder"') do set "potplayer_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_CURRENT_USER\SOFTWARE\7-Zip" /v Path ^| find /i "Path"') do set "compress_path=%%k"

    @REM GAME

    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Valve\Steam\ActiveProcess" /v ActiveUser ^| find /i "ActiveUser"') do set /a "steam_number=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 13540" /v InstallLocation ^| find /i "InstallLocation"') do set "r6vegas_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 15120" /v InstallLocation ^| find /i "InstallLocation"') do set "r6vegas2_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 225540" /v InstallLocation ^| find /i "InstallLocation"') do set "justcause3_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 12210" /v InstallLocation ^| find /i "InstallLocation"') do set "gta4_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 271590" /v InstallLocation ^| find /i "InstallLocation"') do set "gta5_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" /v InstallLocation ^| find /i "InstallLocation"') do set "csgo_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 1172470" /v InstallLocation ^| find /i "InstallLocation"') do set "apex_path=%%k"
    set "minecraftuwp_path=C:\Users\%username%\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\minecraftWorlds"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Need For Speed Most Wanted Black Edition_is1" /v InstallLocation ^| find /i "InstallLocation"') do set "nfs9_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 391540" /v InstallLocation ^| find /i "InstallLocation"') do set "undertale_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 239140" /v InstallLocation ^| find /i "InstallLocation"') do set "dyinglight_path=%%k"
    for /f "tokens=1,2,* " %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 307690" /v InstallLocation ^| find /i "InstallLocation"') do set "sleepingdogs_path=%%k"
 
@REM Title

    echo off & Mode Con Cols=60 Lines=50 & Color F0 & set lang=zh & Title Released this on 2022.4.1

@REM English

    if %lang% == en (

    @REM Menu

        set "w_software_list=# SOFTWARE"
        set "w_games_list=# GAMES"
        set "w_not_exist=NO INSTALL"
        set "w_get_help=Enter /help for help."
        set "w_error_input=Ops... There have somting wrong. This is usually caused by input errors."

    @REM Software

        set "w_save_steam=You have successfully saved the Steam profile."
        set "w_load_steam=You have successfully loaded the Steam profile."

        set "w_save_uu=UU cannot be saved."
        set "w_enter_uuuser=Please enter the mobile number of your UU account:"
        set "w_wrong_uu=Thi UU account is not support."
        set "w_load_uu=You have successfully logged the UU account."

        set "w_save_qq=QQ cannot be saved."
        set "w_load_qq=You have successfully replaced the QQ sound."

        set "w_save_tim=TIM cannot be saved."
        set "w_load_tim=You have successfully replaced the TIM sound."

        set "w_save_idm=Internet Download Manager cannot be saved."
        set "w_load_idm=Internet Download Manager cannot be loaded."

        set "w_save_obs=You have successfully saved the obs-object file."
        set "w_load_obs=You have successfully loaded the obs-object file."

        set "w_save_sougoupy=You have successfully saved the SougouPY config file."
        set "w_load_sougoupy=You have successfully loaded the SougouPY config file."

        set "w_start_compress=Start compress..."
        set "w_save_savesgo=You have successfully packing the SavesGo file."
        set "w_load_savesgo=SavesGo cannot be loaded."

        set "w_save_potplayer=You have successfully saved the PotPlayer skin and profile."
        set "w_load_potplayer=You have successfully loaded the PotPlayer skin and profile."

    @REM Games

        set "w_save_r6vegas=You have successfully saved the Tom Clancy's Rainbow Six: Vegas save file."
        set "w_load_r6vegas=You have successfully loaded the Tom Clancy's Rainbow Six: Vegas save file."
        
        set "w_save_r6vegas2=You have successfully saved the Tom Clancy's Rainbow Six: Vegas2 save file."
        set "w_load_r6vegas2=You have successfully loaded the Tom Clancy's Rainbow Six: Vegas2 save file."
        
        set "w_save_justcause3=You have successfully saved the JustCause3 save file."
        set "w_load_jusecause3=You have successfully loaded the JustCause3 save file."
        
        set "w_save_gta4=You have successfully saved the Grand Theft Auto IV config file."
        set "w_load_gta4=You have successfully loaded the Grand Theft Auto IV config file."
        
        set "w_save_gta5=You have successfully saved the Grand Theft Auto V config file."
        set "w_load_gta5=You have successfully loaded the Grand Theft Auto V config file."
        
        set "w_save_csgo=You have successfully saved the Counter-Strike: Global Offensive config file."
        set "w_load_csgo=You have successfully loaded the Counter-Strike: Global Offensive config file."
        
        set "w_save_apex=You have successfully saved the Apex: legends config file."
        set "w_load_apex=You have successfully loaded the Apex: legends config file."
        
        set "w_save_minecraftuwp=You have successfully saved the Minecraft for Windows wolrd file."
        set "w_load_minecraftuwp=You have successfully loaded the Minecraft for Windows wolrd file."
        
        set "w_save_nfs9=You have successfully saved the Need For Speed: Most Wanted save file."
        set "w_load_nfs9=You have successfully loaded the Need For Speed: Most Wanted save file."
        
        set "w_save_undertale=You have successfully saved the UNDERTALE save file."
        set "w_load_undertale=You have successfully loaded the UNDERTALE save file."
        
        set "w_save_dyinglight=You have successfully saved the Dying Light config file."
        set "w_load_dyinglight=You have successfully loaded the Dying Light config file."
        
        set "w_save_sleepingdogs=You have successfully saved the Sleeping Dogs: Definitive Edition save and config files."
        set "w_load_sleepingdogs=You have successfully loaded the Sleeping Dogs: Definitive Edition save and config files."
        
    @REM Other

        set "w_cairl_copyright=This procedure is completed by Cairl. Please indicate the author when reproduced."
        set "w_cairl_email=If you have any questions, please contact Cairls@qq.com"

    )

@REM Chinese

    if %lang% == zh (

    @REM 菜单

        set "w_software_list=# 软件目录"
        set "w_games_list=# 游戏目录"
        set "w_not_exist=未安装"
        set "w_get_help=输入 /help 以获取帮助。"
        set "w_error_input=呃…… 这里出现了些问题。这通常是因为输入错误导致的。"

    @REM 软件

        set "w_save_steam=你已成功保存 Steam 配置文件。"
        set "w_load_steam=你已成功载入 Steam 配置文件。"

        set "w_save_uu=网易UU加速器 无法保存。"
        set "w_enter_uuuser=请输入你的 网易UU加速器 账号（手机号码）："
        set "w_wrong_uu=该UU账号暂不支持。"
        set "w_load_uu=你已成功登录 网易UU加速器。"

        set "w_save_qq=腾讯QQ 无法保存。"
        set "w_load_qq=你已成功替换 腾讯QQ 提示音。"

        set "w_save_tim=腾讯TIM 无法保存。"
        set "w_load_tim=你已成功替换 腾讯TIM 提示音。"

        set "w_save_idm=Internet Download Manager 无法保存。"
        set "w_load_idm=Internet Download Manager 无法载入。"

        set "w_save_obs=你已成功保存 OBS 项目文件夹。"
        set "w_load_obs=你已成功载入 OBS 项目文件夹。"

        set "w_save_sougoupy=你已成功保存 搜狗拼音输入法 配置文件。"
        set "w_load_sougoupy=你已成功载入 搜狗拼音输入法 配置文件。"

        set "w_start_compress=开始压缩..."
        set "w_save_savesgo=你已成功打包 SavesGo 到桌面。"
        set "w_load_savesgo=SavesGo 无法载入"

        set "w_save_potplayer=你已成功保存 PotPlayer 皮肤及配置文件。"
        set "w_load_potplayer=你已成功载入 PotPlayer 皮肤及配置文件。"

    @REM 游戏

        set "w_save_r6vegas=你已成功保存 彩虹六号：维加斯 游戏存档。"
        set "w_load_r6vegas=你已成功载入 彩虹六号：维加斯 游戏存档。"
        
        set "w_save_r6vegas2=你已成功保存 彩虹六号：维加斯2 游戏存档。"
        set "w_load_r6vegas2=你已成功载入 彩虹六号：维加斯2 游戏存档。"
        
        set "w_save_justcause3=你已成功保存 正当防卫3 游戏存档。"
        set "w_load_jusecause3=你已成功加载 正当防卫3 游戏存档。"
        
        set "w_save_gta4=你已成功保存 侠盗猎车4 配置文件。"
        set "w_load_gta4=你已成功载入 侠盗猎车4 配置文件。"
        
        set "w_save_gta5=你已成功保存 侠盗猎车5 配置文件。"
        set "w_load_gta5=你已成功载入 侠盗猎车5 配置文件。"
        
        set "w_save_csgo=你已成功保存 反恐精英：全球行动 配置文件。"
        set "w_load_csgo=你已成功载入 反恐精英：全球行动 配置文件。"
        
        set "w_save_apex=你已成功保存 Apex 英雄 配置文件。"
        set "w_load_apex=你已成功载入 Apex 英雄 配置文件。"
        
        set "w_save_minecraftuwp=你已成功保存 Minecraft for Windows 地图存档。"
        set "w_load_minecraftuwp=你已成功载入 Minecraft for Windows 地图存档。"
        
        set "w_save_nfs9=你已成功保存 极品飞车9：最高通缉 游戏存档。"
        set "w_load_nfs9=你已成功载入 极品飞车9：最高通缉 游戏存档。"
        
        set "w_save_undertale=你已成功保存 传说之下 游戏存档。"
        set "w_load_undertale=你已成功载入 传说之下 游戏存档。"
        
        set "w_save_dyinglight=你已成功保存 消逝的光芒 配置文件。"
        set "w_load_dyinglight=你已成功载入 消逝的光芒 配置文件。"
        
        set "w_save_sleepingdogs=你已成功保存 热血无赖：终极版 配置文件及游戏存档。"
        set "w_load_sleepingdogs=你已成功载入 热血无赖：终极版 配置文件及游戏存档。"

    @REM 其他

        set "w_cairl_copyright=本程序由 Cairl 倾力完成，转载请标明作者。"
        set "w_cairl_email=如有任何疑问，请联络 Cairls@qq.com"
        
    )

@REM Menu list

    :Menu
    Cls
    echo: & echo: %w_software_list%
    echo: ==================
    if exist "%steam_path%" ( echo: & echo: - Steam ) else ( echo: & echo: - Steam ^(%w_not_exist%^) )
    if exist "%uu_path%" ( echo: & echo: - UU ) else ( echo: & echo: - UU ^(%w_not_exist%^) )
    if exist "%qq_path%" ( echo: & echo: - QQ ) else ( echo: & echo: - QQ ^(%w_not_exist%^) )
    if exist "%tim_path%" ( echo: & echo: - TIM ) else ( echo: & echo: - TIM ^(%w_not_exist%^) )
    if exist "%idm_path%" ( echo: & echo: - IDM ) else ( echo: & echo: - IDM ^(%w_not_exist%^) )
    if exist "%obs_path%" ( echo: & echo: - OBS ) else ( echo: & echo: - OBS ^(%w_not_exist%^) )
    if exist "%sougoupy_path%" ( echo: & echo: - SougouPY ) else ( echo: & echo: - SougouPY ^(%w_not_exist%^) )
    if exist "%~dp0" ( echo: & echo: - SavesGo ) else ( echo: & echo: - SavesGo ^(%w_not_exist%^) )
    if exist "%potplayer_path%" ( echo: & echo: - PotPlayer ) else ( echo: & echo: - PotPlayer ^(%w_not_exist%^) )

    echo: & echo: %w_games_list%
    echo: ===============
    if exist "%r6vegas_path%" ( echo: & echo: - R6Vegas ) else ( echo: & echo: - R6Vegas ^(%w_not_exist%^) )
    if exist "%r6vegas2_path%" ( echo: & echo: - R6Vegas2 ) else ( echo: & echo: - R6Vegas2 ^(%w_not_exist%^) )
    if exist "%justcause3_path%" ( echo: & echo: - JustCause3 ) else ( echo: & echo: - JustCause3 ^(%w_not_exist%^) )
    if exist "%gta4_path%" ( echo: & echo: - GTA4 ) else ( echo: & echo: - GTA4 ^(%w_not_exist%^) )
    if exist "%gta5_path%" ( echo: & echo: - GTA5 ) else ( echo: & echo: - GTA5 ^(%w_not_exist%^) )
    if exist "%csgo_path%" ( echo: & echo: - CSGO ) else ( echo: & echo: - CSGO ^(%w_not_exist%^) )
    if exist "%apex_path%" ( echo: & echo: - Apex ) else ( echo: & echo: - Apex ^(%w_not_exist%^) )
    if exist "%minecraftuwp_path%" ( echo: & echo: - MinecraftUWP ) else ( echo: & echo: - MinecraftUWP ^(%w_not_exist%^) )
    if exist "%nfs9_path%" ( echo: & echo: - NFS9 ) else ( echo: & echo: - NFS9 ^(%w_not_exist%^) )
    if exist "%undertale_path%" ( echo: & echo: - Undertale ) else ( echo: & echo: - Undertale ^(%w_not_exist%^) )
    if exist "%dyinglight_path%" ( echo: & echo: - DyingLight ) else ( echo: & echo: - DyingLight ^(%w_not_exist%^) )
    if exist "%sleepingdogs_path%" ( echo: & echo: - SleepingDogs ) else ( echo: & echo: - SleepingDogs ^(%w_not_exist%^) )
    
    echo: & echo:(%w_get_help%)
    echo: & set /p input=^>

    call :%input:~5%

    echo: & echo: %w_error_input%
    pause >nul & goto Menu

@REM Software list

    :steam
    if not exist "%steam_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%steam_path%\config\" "%Saves%\Steam\config\" >nul&::save
        xcopy /y /e "%steam_path%\userdata\%steam_number%\config\" "%Saves%\Steam\userdata\%steam_number%\config\" >nul&::save
        echo: & echo: %w_save_steam%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        taskkill /t /f /im steam.exe >nul
        xcopy /y /e "%Saves%\Steam\config\" "%steam_path%\config\" >nul&::load
        xcopy /y /e "%Saves%\Steam\userdata\%steam_number%\config\" "%steam_path%\userdata\%steam_number%\config\" >nul&::load
        start "starting steam..." "%steam_path%\steam.exe"
        echo: & echo: %w_load_steam%
        timeout 2 >nul & goto Menu )

    :uu
    if not exist "%uu_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        echo: & echo: %w_save_uu%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        echo: & echo: %w_enter_uuuser%
        set /p uuuser=^>
        if /i not !uuuser! == 18322381138 (
            if /i not !uuuser! == 15857600360 (
                echo: & echo: not %w_wrong_uu% & timeout 2 >nul & goto Menu ) )
        taskkill /t /f /im uu.exe >nul 
        xcopy /y /e "%Saves%\UU\!uuuser!\" "C:\Users\%USERNAME%\AppData\Roaming\Netease\UU\" >nul&::load
        start "" "%uu_path%" >nul
        echo: & echo: %w_load_uu%
        timeout 2 >nul & goto Menu )

    :qq
    if not exist "%qq_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        echo: & echo: %w_save_qq%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\QQ\Misc\" "%qq_path%\Misc\" >nul&::load
        ::xcopy /y /e "%Saves%\QQ\Plugin\" "%qq_path%\Plugin\" >nul&::load
        echo: & echo: %w_load_qq%
        timeout 2 >nul & goto Menu )

    :tim
    if not exist "%tim_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        echo: & echo: %w_save_tim%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\QQ\Misc\" "%tim_path%\Misc\" >nul&::load
        ::xcopy /y /e "%Saves%\QQ\Plugin\" "%tim_path%\Plugin\" >nul&::load
        echo: & echo: %w_load_tim%
        timeout 2 >nul & goto Menu )

    :wechat
    if not exist "%wechat_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        echo: & echo: %w_save_wechat%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        rename "d:\test\WeChatResource.dll" WeChatResource.7z
        "%compress_path%7z.exe" a "d:\test\WeChatResource.7z" "d:\test\word.txt"
        pause
        exit
        echo: & echo: %w_load_tim%
        timeout 2 >nul & goto Menu )

    :idm
    if not exist "%idm_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        echo: & echo: %w_save_idm%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        echo: & echo: %w_load_idm%
        timeout 2 >nul & goto Menu )

    :obs
    if not exist "%obs_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        if exist "%obs_path%\obs-objects\" rd /s /q "%Saves%\OBS\obs-objects\"
        xcopy /y /e "%obs_path%\obs-objects\" "%Saves%\OBS\obs-objects\" >nul&::save
        echo: & echo: %w_save_obs%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        if exist "%Saves%\OBS\obs-objects\" rd /s /q "%obs_path%\obs-objects\"
        xcopy /y /e "%Saves%\OBS\obs-objects\" "%obs_path%\obs-objects\" >nul&::load
        echo: & echo: %w_load_obs%
        timeout 2 >nul & goto Menu )

    :sougoupy
    if not exist "%sougoupy_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        echo f | xcopy /y /e "C:\Users\%USERNAME%\AppData\LocalLow\SogouPY.users\acc.dat" "%Saves%\SougouPY\SogouPY.users\acc.dat" >nul&::save
        echo: & echo: %w_save_sougoupy%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        echo f | xcopy /y /e "%Saves%\SougouPY\SogouPY.users\acc.dat" "C:\Users\%USERNAME%\AppData\LocalLow\SogouPY.users\acc.dat" >nul&::load
        echo: & echo: %w_load_sougoupy%
        timeout 2 >nul & goto Menu )

    :savesgo
    if not exist "%compress_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        echo: & echo: %w_start_compress%
        "%compress_path%7z.exe" a "%USERPROFILE%\Desktop\SavesGo %current_date%.zip" "%~dp0" >nul&::save
        echo: & echo: %w_save_savesgo%
        timeout 2 >nul & explorer /select,"%USERPROFILE%\Desktop\SavesGo %current_date%.zip" >nul
        exit )
    if /i %input:~0,4% == Load (
        echo: & echo: %w_load_savesgo%
        timeout 2 >nul & goto Menu )

    :potplayer
    if not exist "%potplayer_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        copy "%potplayer_path%\PotPlayerMini64.ini" "%Saves%\PotPlayer\PotPlayerMini64.ini" >nul&::save
        xcopy /y /e "%potplayer_path%\Skins\" "%Saves%\PotPlayer\Skins\" >nul&::save
        echo: & echo: %w_save_potplayer%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        taskkill /t /f /im PotPlayerMini64.exe >nul
        copy "%Saves%\PotPlayer\PotPlayerMini64.ini" "%potplayer_path%\PotPlayerMini64.ini" >nul&::load
        xcopy /y /e "%Saves%\PotPlayer\Skins\" "%potplayer_path%\Skins\" >nul&::load
        start "%potplayer_path%\PotPlayerMini64.exe" "%potplayer_path%\PotPlayerMini64.exe" >nul
        echo: & echo: %w_load_potplayer%
        timeout 2 >nul & goto Menu )

@REM Games list

    :r6vegas
    if not exist "%r6vegas_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%USERPROFILE%\Documents\Ubisoft\R6Vegas\" "%Saves%\R6Vegas\" >nul&::save
        echo: & echo: %w_save_r6vegas%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\R6Vegas\" "%USERPROFILE%\Documents\Ubisoft\R6Vegas\" >nul&::load
        echo: & echo: %w_load_r6vegas%
        timeout 2 >nul & goto Menu )

    :r6vegas2
    if not exist "%r6vegas2_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%USERPROFILE%\Documents\My Games\Ubisoft\R6Vegas2\" "%Saves%\R6Vegas2\" >nul&::save
        echo: & echo: %w_save_r6vegas2%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\R6Vegas\2" "%USERPROFILE%\Documents\My Games\Ubisoft\R6Vegas2\" >nul&::load
        echo: & echo: %w_load_r6vegas2%
        timeout 2 >nul & goto Menu )

    :justcause3
    if not exist "%justcause3_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%USERPROFILE%\Documents\Square Enix\Just Cause 3\Saves\" "%Saves%\Just Cause 3\Saves\" >nul&::save
        echo: & echo: %w_save_justcause3%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\Just Cause 3\Saves\" "%USERPROFILE%\Documents\Square Enix\Just Cause 3\Saves\" >nul&::load
        echo: & echo: %w_load_justcause3%
        timeout 2 >nul & goto Menu )

    :gta4
    if not exist "%gta4_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%USERPROFILE%\Documents\Rockstar Games\GTA IV\" "%Saves%\GTA IV\" >nul&::save
        echo: & echo: %w_save_gta4%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\GTA IV\" "%USERPROFILE%\Documents\Rockstar Games\GTA IV\" >nul&::load
        echo: & echo: %w_load_gta4%
        timeout 2 >nul & goto Menu )

    :gta5
    if not exist "%gta5_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%USERPROFILE%\Documents\Rockstar Games\GTA V\" "%Saves%\GTA V\" >nul&::save
        echo: & echo: %w_save_gta5%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\GTA V\" "%USERPROFILE%\Documents\Rockstar Games\GTA V\" >nul&::load
        echo: & echo: %w_load_gta5%
        timeout 2 >nul & goto Menu )

    :apex
    if not exist "%apex_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "C:\Users\%USERNAME%\Saved Games\Respawn\Apex\local\" "%Saves%\Apex\local\" >nul&::save
        xcopy /y /e "C:\Users\%USERNAME%\Saved Games\Respawn\Apex\profile\" "%Saves%\Apex\profile\" >nul&::save
        echo: & echo: %w_save_apex%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\Apex\local\" "C:\Users\%USERNAME%\Saved Games\Respawn\Apex\local\" >nul&::load
        xcopy /y /e "%Saves%\Apex\profile\" "C:\Users\%USERNAME%\Saved Games\Respawn\Apex\profile\" >nul&::load
        echo: & echo: %w_load_apex%
        timeout 2 >nul & goto Menu )

    :csgo
    if not exist "%csgo_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%steam_path%\userdata\%steam_number%\730\" "%Saves%\Counter-Strike Global Offensive\730\" >nul&::save
        echo: & echo: %w_save_csgo%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\Counter-Strike Global Offensive\730\" "%steam_path%\userdata\%steam_number%\730\" >nul&::load
        echo: & echo: %w_load_csgo%
        timeout 2 >nul & goto Menu )

    :minecraftuwp
    if not exist "%minecraftuwp_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%minecraftuwp_path%" "%Saves%\Minecraft\MinecraftUWP\" >nul&::save
        echo: & echo: %w_save_minecraftuwp%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\Minecraft\MinecraftUWP\" "%minecraftuwp_path%" >nul&::load
        echo: & echo: %w_load_minecraftuwp%
        timeout 2 >nul & goto Menu )

    :nfs9
    if not exist "%nfs9_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%USERPROFILE%\Documents\NFS Most Wanted\N.F.S\" "%Saves%\NFS Most Wanted\N.F.S\" >nul&::save
        echo: & echo: %w_save_nfs9%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\NFS Most Wanted\N.F.S\" "%USERPROFILE%\Documents\NFS Most Wanted\N.F.S\" >nul&::load
        echo: & echo: %w_load_nfs9%
        timeout 2 >nul & goto Menu )

    :undertale
    if not exist "%undertale_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%LOCALAPPDATA%\UNDERTALE\" "%Saves%\UNDERTALE\" >nul&::save
        echo: & echo: %w_save_undertale%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\UNDERTALE\" "%LOCALAPPDATA%\UNDERTALE\" >nul&::load
        echo: & echo: %w_load_undertale%
        timeout 2 >nul & goto Menu )

    :dyinglight
    if not exist "%dyinglight_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        xcopy /y /e "%USERPROFILE%\Documents\DyingLight\out\settings\" "%Saves%\DyingLight\out\settings\" >nul&::save
        echo: & echo: %w_save_dyinglight%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        xcopy /y /e "%Saves%\DyingLight\out\settings\" "%USERPROFILE%\Documents\DyingLight\out\settings\" >nul&::load
        echo: & echo: %w_load_dyinglight%
        timeout 2 >nul & goto Menu )

    :sleepingdogs
    if not exist "%sleepingdogs_path%" ( echo: & echo: %w_not_install% %input:~5% & timeout 3 >nul & goto Menu )
    if /i %input:~0,4% == Save (
        Copy "%sleepingdogs_path%\data\HK Options" "%Saves%\SleepingDogs\data\HK Options" >nul&::save
        Copy "%sleepingdogs_path%\data\HK Autosave Slot" "%Saves%\SleepingDogs\data\HK Autosave Slot" >nul&::save
        Copy "%sleepingdogs_path%\data\HK AutosaveG Slot" "%Saves%\SleepingDogs\data\HK AutosaveG Slot" >nul&::save
        Copy "%sleepingdogs_path%\data\HK AutosaveN Slot" "%Saves%\SleepingDogs\data\HK AutosaveN Slot" >nul&::save
        Copy "%sleepingdogs_path%\data\DisplaySettings.xml" "%Saves%\SleepingDogs\data\DisplaySettings.xml" >nul&::save
        echo: & echo: %w_save_sleepingdogs%
        timeout 2 >nul & goto Menu )
    if /i %input:~0,4% == Load (
        Copy "%Saves%\SleepingDogs\data\HK Options" "%sleepingdogs_path%\data\HK Options" >nul&::load
        Copy "%Saves%\SleepingDogs\data\HK Autosave Slot" "%sleepingdogs_path%\data\HK Autosave Slot" >nul&::load
        Copy "%Saves%\SleepingDogs\data\HK AutosaveG Slot" "%sleepingdogs_path%\data\HK AutosaveG Slot" >nul&::load
        Copy "%Saves%\SleepingDogs\data\HK AutosaveN Slot" "%sleepingdogs_path%\data\HK AutosaveN Slot" >nul&::load
        Copy "%Saves%\SleepingDogs\data\DisplaySettings.xml" "%sleepingdogs_path%\data\DisplaySettings.xml" >nul&::load
        echo: & echo: %w_load_sleepingdogs%
        timeout 2 >nul & goto Menu )

    :help

    :copyright
    echo: & echo: %w_cairl_copyright%
    echo: %w_cairl_email%
    pause >nul & goto Menu