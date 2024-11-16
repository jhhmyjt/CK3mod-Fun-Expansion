@echo off
setlocal enabledelayedexpansion

echo find
set "path1=C:\Users\25823\Awakened\Game\ModDev\CK3\hc-mod\desc\FE_override_file"
set "path2=C:\Program Files (x86)\Steam\steamapps\common\Crusader Kings III\game\common"

echo check
REM 检查路径是否存在
@REM if not exist "%path1%" (
@REM     echo path1 %path1%
@REM     pause
@REM     exit /b
@REM )
@REM @REM if not exist "%path2%" (
@REM @REM     echo path2 %path2%
@REM @REM     pause
@REM @REM     exit /b
@REM @REM )

REM 遍历 path1 目录下的所有文件
for %%f in ("%path1%\*") do (
    set "filename=%%~nxf"
    
    REM 在 path2 的所有子目录中搜索同名文件
    set "found=0"
    for /r "%path2%" %%d in ("!filename!") do (
        echo find: %%d
        echo copy to %path1%
        copy /Y "%%d" "%path1%\"
        set "found=1"
    )
    
    @REM if !found! equ 0 (
    @REM     echo not find: !filename!
    @REM )
)

echo finish
pause
endlocal