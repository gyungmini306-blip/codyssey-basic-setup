@echo off
setlocal EnableExtensions
chcp 65001 >nul
title Codyssey Python Packages
cd /d "%~dp0"

echo ==============================================
echo   코디세이 Python 선택 패키지 설치
echo ==============================================
echo.

where py >nul 2>nul
if errorlevel 1 (
    echo [오류] Python Launcher(py)를 찾을 수 없습니다.
    echo setup_codyssey.bat을 실행한 뒤 새 터미널에서 다시 실행하세요.
    pause
    exit /b 1
)

py -3.13 --version
if errorlevel 1 (
    echo [오류] Python 3.13이 설치되어 있지 않습니다.
    pause
    exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
    py -3.13 -m venv .venv
    if errorlevel 1 (
        echo [오류] 가상환경 생성에 실패했습니다.
        pause
        exit /b 1
    )
)

".venv\Scripts\python.exe" -m pip install --upgrade pip
if errorlevel 1 echo [확인 필요] pip 업데이트 중 오류가 발생했습니다.
".venv\Scripts\python.exe" -m pip install -r requirements-codyssey.txt
if errorlevel 1 (
    echo [오류] Python 패키지 설치에 실패했습니다. 네트워크 연결을 확인하세요.
    pause
    exit /b 1
)

echo.
echo [완료] Python 선택 패키지 설치가 끝났습니다.
echo VS Code에서 Python 인터프리터로 .venv\Scripts\python.exe 를 선택하세요.
pause
exit /b 0
