@echo off
setlocal enabledelayedexpansion

:: ตรวจสอบการมีอยู่ของ winget
winget --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo winget ไม่ได้ติดตั้งอยู่บนเครื่องนี้ กรุณาติดตั้ง winget ก่อนดำเนินการต่อ
    pause
    exit /b
)

:: รายการโปรแกรมที่ต้องการติดตั้ง
set "programs=Python.Python.3.10 Git.Git Microsoft.VisualStudio.2022.Community"

:: ฟังก์ชั่นสำหรับการติดตั้งโปรแกรม
:install_program
for %%p in (%programs%) do (
    echo กำลังติดตั้ง %%p...
    
    if "%%p"=="Microsoft.VisualStudio.2022.Community" (
        winget install %%p --silent --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended" --source winget
    ) else (
        winget install -e --id %%p --accept-source-agreements --accept-package-agreements --source winget
    )

    if %ERRORLEVEL% NEQ 0 (
        echo การติดตั้ง %%p ล้มเหลว จะลองใหม่อีกครั้ง...
        set "retry=1"
    ) else (
        echo การติดตั้ง %%p สำเร็จ
        set "retry=0"
    )

    if "!retry!"=="1" (
        goto :install_program
    )
)

echo การติดตั้งเสร็จสิ้น คุณอาจต้องการรีสตาร์ทเครื่อง
pause
exit /b

REM :: โปรดทำการ Restart  เครื่องก่อน การใช้งาน ::
REM :: โปรดทำการ Restart  เครื่องก่อน การใช้งาน ::
shutdown -r -t 600 -c "Your machine you need to reboot in 5 minutes." -f 
Call :AskQuestion
exit
::***********************************************************************
:AskQuestion
(
    echo    Set Ws = CreateObject("wscript.shell"^)
    echo    wscript.sleep 180000
    echo    Answ = MsgBox("Did you want to cancel the scheduled reboot of your the computer ?"_
    echo ,VbYesNo+VbQuestion,"Did you want to cancel the scheduled reboot of your the computer ?"^)
    echo    If Answ = VbYes then 
    echo        Return = Ws.Run("cmd /c Shutdown -a",0,True^)
    echo    Else
    echo        wscript.Quit(1^)
    echo    End If
)>"%tmp%\%~n0.vbs"
Start "" "%tmp%\%~n0.vbs"