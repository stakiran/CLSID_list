@echo off
setlocal
set BASEDIR=%~dp0
set SAVEPATH=%BASEDIR%3_queries.txt

del %SAVEPATH%
for /F "usebackq" %%i in (`type 2_keyonly.txt`) do (
  reg query %%i /f "*" /d >> %SAVEPATH%
)
