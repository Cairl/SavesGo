#Version 0.0.1
import os, shutil, winreg, time

language = "zh"
SavesGo_Path = os.path.dirname(__file__)

if (language == "en"): 
    readme = "Welcome to use this program. \nSavesGo can help you to quickly Save or Load the information file for supported software. Is your personal repository!"
    software_title = "Software Menu"
    games_title = "Games Menu"
    waiting_input = "My choice is:"

if (language == "zh"): 
    readme = "欢迎使用本程序！\nSavesGo 可以帮您快速管理受支持软件的储存/恢复事宜，是您度身定制的储存库！"
    software_title = "软件目录"
    games_title = "游戏目录"
    waiting_input = "我需要的是："

def mainMenu():
    os.system("cls")
    print(readme)
    print()
    print()
    print(software_title)
    print("==========")
    print("- Steam")
    print("- QQ")
    print("- TIM")
    print("- IDM")
    print("- OBS")
    print("- PotPlayer")
    print()
    print()
    print(games_title)
    print("==========")
    print("- R6Vegas")
    print("- R6Veags2")
    print("- JustCause3")
    print("- GTA4")
    print("- GTA5")
    print("- CSGO")
    print("- Apex")
    print("- MinecraftUWP")
    print("- NFS9")
    print("- Undertale")
    print("- DyingLight")
    print("- SleepingDogs")
    print()
    print()

mainMenu()

UserInput = input(waiting_input).lower()

if UserInput[:4] == "save":

    if UserInput[5:] == "steam":
        if os.path.exists(winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,r"SOFTWARE\WOW6432Node\Valve\Steam"), "InstallPath")[0]):
            os.system("cls")
            Steam_Path = winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,r"SOFTWARE\WOW6432Node\Valve\Steam"), "InstallPath")[0]
            Steam_ID = winreg.QueryValueEx(winreg.OpenKey(winreg.HKEY_CURRENT_USER,r"SOFTWARE\Valve\Steam\ActiveProcess"), "ActiveUser")[0]
            shutil.copyfile("%s\\config"%(Steam_Path),"%s\\Steam\\config"%(SavesGo_Path))
            shutil.copyfile("%s\\userdata\\%s\\config"%(Steam_Path,Steam_ID),"%s\\userdata\\%s\\config"%(SavesGo_Path,Steam_ID),)
            print("you got it")
            time.sleep(5)
            mainMenu()

