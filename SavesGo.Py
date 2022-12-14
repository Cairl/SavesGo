#Version 0.0.1

#导入模块
import os, shutil, winreg, time

#设置前置变量
language = 'english'
backMenu = 0
p_savesgo = os.path.dirname(__file__)

#定义函数组-保存类
def save_steam():
    if os.path.exists(winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,r'SOFTWARE\WOW6432Node\Valve\Steam'),'InstallPath')[0]):
        os.system('cls')

        p_steam = winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,r'SOFTWARE\WOW6432Node\Valve\Steam'),'InstallPath')[0]
        steam_id = winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_CURRENT_USER,r'SOFTWARE\Valve\Steam\ActiveProcess'), 'ActiveUser')[0]

        print(w_saving_steam1)
        if os.path.exists('%s\\Saves\\Steam\\config'%(p_savesgo)):shutil.rmtree('%s\\Saves\\Steam\\config'%(p_savesgo))
        shutil.copytree('%s\\config'%(p_steam),'%s\\Saves\\Steam\\config'%(p_savesgo))
        
        print(w_saving_steam2)
        if os.path.exists('%s\\Saves\\userdata\\%s\\config'%(p_savesgo,steam_id)):shutil.rmtree('%s\\Saves\\userdata\\%s\\config'%(p_savesgo,steam_id))
        shutil.copytree('%s\\userdata\\%s\\config'%(p_steam,steam_id),'%s\\Saves\\userdata\\%s\\config'%(p_savesgo,steam_id))
        
        print(w_done),time.sleep(2)

#定义函数组-储存类
def load_steam():
    if os.path.exists(winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,r'SOFTWARE\WOW6432Node\Valve\Steam'),'InstallPath')[0]):
        os.system('cls')

        p_steam = winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,r'SOFTWARE\WOW6432Node\Valve\Steam'),'InstallPath')[0]
        steam_id = winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_CURRENT_USER,r'SOFTWARE\Valve\Steam\ActiveProcess'), 'ActiveUser')[0]

        print(w_loading_steam1)
        if os.path.exists('%s\\config'%(p_steam)):shutil.rmtree('%s\\config'%(p_steam))
        shutil.copytree('%s\\Saves\\Steam\\config'%(p_savesgo),'%s\\config'%(p_steam))
        
        print(w_loading_steam2)
        if os.path.exists('%s\\userdata\\%s\\config'%(p_steam,steam_id)):shutil.rmtree('%s\\userdata\\%s\\config'%(p_steam,steam_id))
        shutil.copytree('%s\\Saves\\userdata\\%s\\config'%(p_savesgo,steam_id),'%s\\userdata\\%s\\config'%(p_steam,steam_id))
        
        print(w_done),time.sleep(2)

#构写目录
while True:

    if language == 'english': 

        w_readme = 'Welcome to use this program.\n"SavesGo" can help you to quickly Save/Load the information file for supported software.'
        w_software_title = 'Software List'
        w_games_title = 'Games List'
        w_waiting_input = 'I want '
        w_saving_steam1 = 'Saving "Steam config - 1"...'
        w_saving_steam2 = 'Saving "Steam config - 2"...'
        w_loading_steam1 = 'Loading "Steam config - 1"...'
        w_loading_steam2 = 'Loading "Steam config - 2"...'
        w_done = 'Done!'
        w_error_input = 'Sorry. Your typed is not support.'
        w_error_not_found = 'Sorry. Not found this object from your device.'
        w_save_lack = 'I want save '
        w_load_lack = 'I want load '

    if language == 'chinese': 

        w_readme = '欢迎使用本程序！\nSavesGo 可以帮您快速管理受支持软件的储存/恢复事宜，是您度身定制的储存库！'
        w_software_title = '软件目录'
        w_games_title = '游戏目录'
        w_waiting_input = '我需要 '
        w_saving_steam1 = '正在保存 "Steam config - 1"...'
        w_saving_steam2 = '正在保存 "Steam config - 2"...'
        w_loading_steam1 = '正在加载 "Steam config - 1"...'
        w_loading_steam2 = '正在加载 "Steam config - 2"...'
        w_done = '完成！'
        w_error_input = '抱歉，您键入的内容不受支持。'
        w_error_not_found = '抱歉，在您的设备上找不到该对象。'
        w_save_lack = '我需要储存 '
        w_load_lack = '我需要恢复 '

    print()
    print(w_readme)
    print()
    print(w_software_title)
    print('=============')
    print('- Steam')
    print('- QQ')
    print('- TIM')
    print('- IDM')
    print('- OBS')
    print('- PotPlayer')
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

    #等待输入
    UserInput = input(w_waiting_input).lower()

    #输入结果：语言
    if UserInput == 'chinese':language = 'chinese'
    if UserInput == 'english':language = 'english'
    
    #输入结果：半结果-保存
    if UserInput == 'save':

        UserInput = input(w_save_lack).lower()

        if UserInput == 'steam':save_steam()
        continue
    
    #输入结果：半结果-加载
    if UserInput == 'load':
        
        UserInput = input(w_load_lack).lower()

        if UserInput == 'steam':load_steam()
        continue

        #输入结果：全结果-保存
    if UserInput[:4] == 'save':
        
        if UserInput[5:] == 'steam':save_steam()
        continue

    #输入结果：全结果-加载
    if UserInput[:4] == 'load':

        if UserInput[5:] == 'steam':load_steam()
        continue
