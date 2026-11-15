@echo off
if /i not "%~1"=="--run" (
    start "Codyssey Basic Setup" "%ComSpec%" /k call "%~f0" --run
    exit /b 0
)
shift
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
echo 1. 기본 프로그램 설치 (Chrome, VS Code, Git, Python)
echo 2. VS Code 한국어 및 Python 확장 설치
echo 3. Python 학습 패키지 설치 (NumPy, pandas 등)
echo 4. Docker Desktop 설치
echo 5. 전체 설치
echo Q. 종료
echo.
set "choice="
set /p "choice=번호를 입력하세요: "
if /i "%choice%"=="1" goto do_core
if /i "%choice%"=="2" goto do_extensions
if /i "%choice%"=="3" goto do_python
if /i "%choice%"=="4" goto do_docker
if /i "%choice%"=="5" goto do_all
if /i "%choice%"=="Q" goto finish
echo 올바른 번호를 입력하세요.
pause
goto menu

:do_core
call :core
goto menu
:do_extensions
call :extensions
goto menu
:do_python
call :python_packages
goto menu
:do_docker
call :docker
goto menu
:do_all
call :core
call :extensions
call :python_packages
call :docker
goto menu

:check_winget
where winget >nul 2>nul
if errorlevel 1 (
    echo [오류] winget을 찾을 수 없습니다. Microsoft Store에서 앱 설치 관리자(App Installer)를 설치하거나 업데이트하세요.
    exit /b 1
)
exit /b 0

:core
call :check_winget
if errorlevel 1 goto core_done
echo.
echo [1/4] Google Chrome 설치
call :install Google.Chrome "Google Chrome"
echo [2/4] Visual Studio Code 설치
call :install Microsoft.VisualStudioCode "Visual Studio Code"
echo [3/4] Git 설치
call :install Git.Git "Git"
echo [4/4] Python 3.13 설치
call :install Python.Python.3.13 "Python 3.13"
:core_done
echo 기본 프로그램 설치 단계가 끝났습니다.
pause
exit /b 0

:install
winget install --id "%~1" --exact --silent --accept-package-agreements --accept-source-agreements
if errorlevel 1 (echo [확인 필요] %~2 설치 실패 또는 오류) else (echo [완료] %~2 설치/확인)
echo.
exit /b 0

:extensions
call :find_code
if not defined CODE_CMD (
    echo [오류] VS Code의 code 명령을 찾을 수 없습니다. 기본 프로그램 설치 후 다시 실행하세요.
    pause
    exit /b 0
)
call :extension MS-CEINTL.vscode-language-pack-ko "한국어 언어팩"
call :extension ms-python.python "Python 확장"
call :extension ms-python.vscode-pylance "Pylance 확장"
pause
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
if errorlevel 1 (echo [확인 필요] %~2 설치 실패) else (echo [완료] %~2)
echo.
exit /b 0

:python_packages
where py >nul 2>nul
if errorlevel 1 (
    echo [오류] Python Launcher(py)를 찾을 수 없습니다. 먼저 기본 프로그램 설치를 실행하세요.
    pause
    exit /b 0
)
if not exist "requirements-codyssey.txt" (
    echo [오류] requirements-codyssey.txt가 없습니다. 저장소 파일을 함께 내려받아 주세요.
    pause
    exit /b 0
)
if not exist ".venv\Scripts\python.exe" py -3.13 -m venv .venv
if errorlevel 1 (
    echo [오류] Python 3.13 가상환경을 만들지 못했습니다.
    pause
    exit /b 0
)
".venv\Scripts\python.exe" -m pip install --upgrade pip
".venv\Scripts\python.exe" -m pip install -r requirements-codyssey.txt
if errorlevel 1 (echo [확인 필요] Python 패키지 설치 오류) else (echo [완료] Python 패키지 설치)
pause
exit /b 0

:docker
call :check_winget
if errorlevel 1 (
    pause
    exit /b 0
)
echo Docker Desktop 설치를 시작합니다. 관리자 권한 확인 창이 나타날 수 있습니다.
winget install --id Docker.DockerDesktop --exact --accept-package-agreements --accept-source-agreements
if errorlevel 1 (echo [확인 필요] Docker Desktop 설치 오류) else (echo [완료] Docker Desktop 설치)
echo Docker는 WSL 2 및 하드웨어 가상화가 필요할 수 있습니다.
pause
exit /b 0

:finish
echo 설치기를 종료합니다.
pause
exit /b 0