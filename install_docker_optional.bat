@echo off
setlocal EnableExtensions
chcp 65001 >nul
title Codyssey Optional Docker Setup
cd /d "%~dp0"

echo ==============================================
echo   Docker Desktop 선택 설치
echo ==============================================
echo Docker Desktop은 WSL 2, 가상화, PC 정책에 따라 관리자 권한이 필요할 수 있습니다.
echo 이 스크립트는 Windows 기능 변경이나 재부팅을 자동으로 실행하지 않습니다.
echo.
choice /C YN /N /M "Docker Desktop 설치를 시작할까요? (Y/N): "
if errorlevel 2 exit /b 0

where winget >nul 2>nul
if errorlevel 1 (
    echo [오류] winget을 찾을 수 없습니다. Microsoft Store의 앱 설치 관리자를 확인하세요.
    pause
    exit /b 1
)

winget install --id Docker.DockerDesktop --exact --accept-package-agreements --accept-source-agreements
if errorlevel 1 (
    echo [확인 필요] Docker Desktop 설치가 완료되지 않았습니다.
    echo 관리자 권한, WSL 2 및 학교 PC 정책을 확인하세요.
    pause
    exit /b 1
)

echo.
echo [완료] Docker Desktop 설치 요청이 끝났습니다.
echo Docker Desktop을 실행해 초기 설정을 마친 뒤, README의 공식 설치 안내를 확인하세요.
pause
exit /b 0
