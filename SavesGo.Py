#Version 0.0.1

import os, shutil, winreg, time

language = 'english'
backMenu = True

while backMenu == True:

    if language == 'english': 

        w_readme = 'Welcome to use this program.\n"SavesGo" can help you to quickly Save/Load the information file for supported software.'
        w_software_title = 'Software List'
        w_games_title = 'Games List'
        w_waiting_input = 'I want '
        w_saving_steam_1 = 'Saving "Steam config - 1"...'
        w_saving_steam_2 = 'Saving "Steam config - 2"...'
        w_done = 'Done!'

    if language == 'chinese': 

        w_readme = '欢迎使用本程序！\nSavesGo 可以帮您快速管理受支持软件的储存/恢复事宜，是您度身定制的储存库！'
        w_software_title = '软件目录'
        w_games_title = '游戏目录'
        w_waiting_input = '我需要 '
        w_saving_steam_1 = '正在保存 "Steam config - 1"...'
        w_saving_steam_2 = '正在保存 "Steam config - 2"...'
        w_done = '完成！'

    p_savesgo = os.path.dirname(__file__)

    print(w_readme)
    print()
    print()
    print(w_software_title)
    print('==========')
    print('- Steam')
    print('- QQ')
    print('- TIM')
    print('- IDM')
    print('- OBS')
    print('- PotPlayer')
    print()
    print()
    print(w_games_title)
    print('==========')
    print('- R6Vegas')
    print('- R6Veags2')
    print('- JustCause3')
    print('- GTA4')
    print('- GTA5')
    print('- CSGO')
    print('- Apex')
    print('- MinecraftUWP')
    print('- NFS9')
    print('- Undertale')
    print('- DyingLight')
    print('- SleepingDogs')
    print()
    print()

    UserInput = input(w_waiting_input).lower()

    if UserInput == 'zh':
        language = 'zh'
        backMenu = True

    if UserInput == 'en':
        language = 'en'
        backMenu = True

    if UserInput[:4] == 'save':

        if UserInput[5:] == 'steam':

            if os.path.exists(winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,r'SOFTWARE\WOW6432Node\Valve\Steam'),'InstallPath')[0]):
                os.system('cls')

                p_steam = winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,r'SOFTWARE\WOW6432Node\Valve\Steam'),'InstallPath')[0]
                steam_id = winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_CURRENT_USER,r'SOFTWARE\Valve\Steam\ActiveProcess'), 'ActiveUser')[0]

                print(w_saving_steam_1)
                if os.path.exists('%s\\Saves\\Steam\\config'%(p_savesgo)):shutil.rmtree('%s\\Saves\\Steam\\config'%(p_savesgo))
                shutil.copytree('%s\\config'%(p_steam),'%s\\Saves\\Steam\\config'%(p_steam))
                
                print(w_saving_steam_2)
                if os.path.exists('%s\\Saves\\userdata\\%s\\config'%(p_savesgo,steam_id)):shutil.rmtree('%s\\Saves\\userdata\\%s\\config'%(p_savesgo,steam_id))
                shutil.copytree('%s\\userdata\\%s\\config'%(p_steam,steam_id),'%s\\Saves\\userdata\\%s\\config'%(p_savesgo,steam_id))
                
                print(w_done)
                time.sleep(2)
                backMenu = True
