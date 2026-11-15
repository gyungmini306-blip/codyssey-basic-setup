@echo off
setlocal EnableExtensions
chcp 65001 >nul
title Codyssey Basic Setup

echo ==============================================
echo   코디세이 기초 프로그램 설치기
echo ==============================================
echo.

where winget >nul 2>nul
if errorlevel 1 (
    echo [오류] winget을 찾을 수 없습니다.
    echo Microsoft Store의 앱 설치 관리자(App Installer)를 업데이트한 뒤 다시 실행하세요.
    echo.
    pause
    exit /b 1
)

echo 프로그램 설치를 시작합니다. 기존 프로그램은 winget 정책에 따라 처리됩니다.
echo 설치 중 권한 또는 기관 정책 오류가 나면 해당 항목은 건너뛰고 다음 항목을 진행합니다.
echo.

call :install Google.Chrome.EXE "Google Chrome"
call :install Microsoft.VisualStudioCode "Visual Studio Code"
call :install Git.Git "Git"
call :install Python.Python.3.13 "Python 3.13"

call :find_code
if not defined CODE_CMD (
    echo [안내] VS Code 명령줄을 찾지 못해 확장 설치를 건너뜁니다.
    echo VS Code 설치 후 이 파일을 다시 실행하거나 README의 확인 방법을 참고하세요.
) else (
    call :extension MS-CEINTL.vscode-language-pack-ko "한국어 언어팩"
    call :extension ms-python.python "Python 확장"
    call :extension ms-python.vscode-pylance "Pylance 확장"
)

echo.
echo ==============================================
echo 설치 단계가 끝났습니다.
echo 오류가 표시된 항목은 README의 안내를 확인하세요.
echo ==============================================
pause
exit /b 0

:install
echo [설치] %~2
winget install --id "%~1" --exact --silent --accept-package-agreements --accept-source-agreements
if errorlevel 1 (
    echo [확인 필요] %~2 설치가 완료되지 않았습니다. 네트워크, 권한 또는 winget 오류를 확인하세요.
) else (
    echo [완료] %~2
)
echo.
exit /b 0

:find_code
set "CODE_CMD="
if exist "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd" set "CODE_CMD=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd"
if not defined CODE_CMD if exist "%ProgramFiles%\Microsoft VS Code\bin\code.cmd" set "CODE_CMD=%ProgramFiles%\Microsoft VS Code\bin\code.cmd"
if not defined CODE_CMD for /f "delims=" %%C in ('where code.cmd 2^>nul') do if not defined CODE_CMD set "CODE_CMD=%%C"
exit /b 0

:extension
echo [확장 설치] %~2
call "%CODE_CMD%" --install-extension "%~1"
if errorlevel 1 (
    echo [확인 필요] %~2 설치에 실패했습니다.
) else (
    echo [완료] %~2
)
echo.
exit /b 0
