# 코디세이 기초 프로그램 패키지

코디세이 학습에 필요한 Windows 개발 환경 설치 도구입니다.

## 사용 방법

1. GitHub 저장소에서 ZIP을 내려받아 압축을 풉니다.
2. setup_codyssey.bat을 실행합니다.
3. 메뉴에서 필요한 설치 항목을 선택합니다. 설치 과정이 끝나도 메뉴로 돌아오며, Q를 선택해야 종료됩니다.

## 메뉴

1. Google Chrome, Visual Studio Code, Git, Python 3.13을 winget으로 설치합니다.
2. 현재 사용자 계정에 VS Code 한국어 언어팩, Python, Pylance 확장을 설치하고 한국어 언어를 설정합니다. 관리자 권한이 필요한 별도 PowerShell 파일은 사용하지 않습니다.
3. 저장소 폴더의 .venv 가상환경에 requirements-codyssey.txt의 패키지를 설치합니다.
4. Docker Desktop을 설치합니다. Docker는 WSL 2, 가상화 및 관리자 권한을 요구할 수 있습니다.

## 제공된 2주차 사전 설치 BAT 관련

제공된 VSCODE_SETUP.bat은 C:\vscode\setup_user.ps1을 호출하지만, 압축 파일에는 해당 PowerShell 스크립트가 포함되어 있지 않습니다. 이 저장소의 설치기는 그 누락된 경로에 의존하지 않고, VS Code 확장 설치와 한국어 설정을 BAT 안에서 처리합니다.

## 참고

- 설치에는 인터넷과 winget(App Installer)이 필요합니다. 학교 또는 공용 PC의 권한·네트워크 정책에 따라 설치가 차단될 수 있습니다.
- Docker Desktop은 WSL 2와 하드웨어 가상화가 필요할 수 있습니다.
- 이 도구는 프로그램을 설치하며, PC 초기화로 삭제된 과제 파일은 복구하지 않습니다. 과제 파일은 별도 저장소나 클라우드에 백업하세요.
