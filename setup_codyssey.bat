@echo off
setlocal EnableExtensions
chcp 65001 >nul
cd /d "%~dp0"
title Codyssey Basic Setup

:menu
cls
echo ==============================================
echo       코디세이 기초 프로그램 설치기
echo ==============================================
echo.
echo 1. 기본 프로그램 설치 (Chrome, VS Code, Git, Python 3.13)
echo 2. VS Code 한국어 전환 및 Python 확장 설치
echo 3. Python 학습 패키지 설치
echo 4. Docker Desktop 설치
echo Q. 종료
echo.
set "choice="
set /p "choice=번호를 입력하세요: "
if /i "%choice%"=="1" goto install_core
if /i "%choice%"=="2" goto install_vscode_extensions
if /i "%choice%"=="3" goto install_python_packages
if /i "%choice%"=="4" goto install_docker
if /i "%choice%"=="Q" goto finish
echo 올바른 번호를 입력하세요.
pause
goto menu

:install_core
where winget >nul 2>nul
if errorlevel 1 goto winget_missing
echo.
echo Google Chrome 설치 중...
winget install --id Google.Chrome --exact --accept-package-agreements --accept-source-agreements
if errorlevel 1 echo [확인 필요] Google Chrome 설치에 실패했습니다.
echo.
echo Visual Studio Code 설치 중...
winget install --id Microsoft.VisualStudioCode --exact --accept-package-agreements --accept-source-agreements
if errorlevel 1 echo [확인 필요] Visual Studio Code 설치에 실패했습니다.
echo.
echo Git 설치 중...
winget install --id Git.Git --exact --accept-package-agreements --accept-source-agreements
if errorlevel 1 echo [확인 필요] Git 설치에 실패했습니다.
echo.
echo Python 3.13 설치 중...
winget install --id Python.Python.3.13 --exact --accept-package-agreements --accept-source-agreements
if errorlevel 1 echo [확인 필요] Python 3.13 설치에 실패했습니다.
echo.
echo 기본 프로그램 설치 단계가 끝났습니다.
echo 오류가 나온 항목이 있으면 화면의 winget 메시지를 확인하세요.
pause
goto menu

:install_vscode_extensions
set "CODE_CMD="
if exist "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd" set "CODE_CMD=%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd"
if not defined CODE_CMD if exist "%ProgramFiles%\Microsoft VS Code\bin\code.cmd" set "CODE_CMD=%ProgramFiles%\Microsoft VS Code\bin\code.cmd"
if not defined CODE_CMD for /f "delims=" %%C in ('where code.cmd 2^>nul') do if not defined CODE_CMD set "CODE_CMD=%%C"
if not defined CODE_CMD goto vscode_missing
echo.
echo 현재 사용자 계정에 VS Code 한국어 언어팩 설치 중...
call "%CODE_CMD%" --install-extension MS-CEINTL.vscode-language-pack-ko
if errorlevel 1 echo [확인 필요] 한국어 언어팩 설치에 실패했습니다.
echo.
echo 현재 사용자 계정에 Python 확장 설치 중...
call "%CODE_CMD%" --install-extension ms-python.python
if errorlevel 1 echo [확인 필요] Python 확장 설치에 실패했습니다.
echo.
echo 현재 사용자 계정에 Pylance 확장 설치 중...
call "%CODE_CMD%" --install-extension ms-python.vscode-pylance
if errorlevel 1 echo [확인 필요] Pylance 설치에 실패했습니다.
if not exist "%APPDATA%\Code\User" mkdir "%APPDATA%\Code\User"
> "%APPDATA%\Code\User\locale.json" echo {"locale":"ko"}
echo.
echo 완료했습니다. VS Code를 완전히 종료한 뒤 다시 실행하세요.
pause
goto menu

:install_python_packages
where py >nul 2>nul
if errorlevel 1 goto python_missing
py -3.13 --version >nul 2>nul
if errorlevel 1 goto python313_missing
if not exist "requirements-codyssey.txt" goto requirements_missing
if not exist ".venv\Scripts\python.exe" py -3.13 -m venv .venv
if errorlevel 1 goto venv_failed
".venv\Scripts\python.exe" -m pip install --upgrade pip
if errorlevel 1 echo [확인 필요] pip 업데이트에 실패했습니다.
".venv\Scripts\python.exe" -m pip install -r requirements-codyssey.txt
if errorlevel 1 goto packages_failed
echo.
echo Python 학습 패키지 설치가 끝났습니다.
echo VS Code에서 .venv\Scripts\python.exe 를 인터프리터로 선택하세요.
pause
goto menu

:install_docker
where winget >nul 2>nul
if errorlevel 1 goto winget_missing
echo Docker Desktop은 관리자 권한, WSL 2 및 하드웨어 가상화가 필요할 수 있습니다.
echo 설치가 진행되는 동안 이 창을 닫지 마세요.
winget install --id Docker.DockerDesktop --exact --accept-package-agreements --accept-source-agreements
if errorlevel 1 echo [확인 필요] Docker Desktop 설치가 완료되지 않았습니다.
echo Docker 설치 단계가 끝났습니다.
pause
goto menu

:winget_missing
echo [오류] winget을 찾을 수 없습니다. Microsoft Store에서 앱 설치 관리자(App Installer)를 설치하거나 업데이트하세요.
pause
goto menu

:vscode_missing
echo [오류] VS Code를 찾을 수 없습니다. 먼저 메뉴 1로 VS Code를 설치하고 다시 실행하세요.
pause
goto menu

:python_missing
echo [오류] Python Launcher py를 찾을 수 없습니다. 먼저 메뉴 1로 Python 3.13을 설치하세요.
pause
goto menu

:python313_missing
echo [오류] Python 3.13을 찾을 수 없습니다. 메뉴 1에서 설치를 완료한 뒤 다시 실행하세요.
pause
goto menu

:requirements_missing
echo [오류] requirements-codyssey.txt가 없습니다. 저장소 파일을 모두 내려받아 BAT와 같은 폴더에 두세요.
pause
goto menu

:venv_failed
echo [오류] Python 가상환경을 만들지 못했습니다.
pause
goto menu

:packages_failed
echo [오류] Python 패키지 설치에 실패했습니다. 인터넷 연결과 화면의 pip 오류를 확인하세요.
pause
goto menu

:finish
echo 설치기를 종료합니다.
pause
exit /b 0
