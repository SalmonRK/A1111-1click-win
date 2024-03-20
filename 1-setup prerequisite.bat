@echo off
::Python
winget install -e --id Python.Python.3.10 --accept-source-agreements --accept-package-agreements --source winget
::GIT
winget install -e --id Git.Git --source winget
::VisualStudio
winget install Microsoft.VisualStudio.2022.Community --silent --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended" --source winget
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
