# 코디세이 기초 프로그램 패키지

코디세이 학습용 Windows 개발 환경을 빠르게 다시 준비하기 위한 설치 스크립트 모음입니다. 재부팅 때마다 PC 환경이 초기화되는 경우, 네트워크 연결 후 `setup_codyssey.bat`을 다시 실행할 수 있습니다.

## 기본 설치 항목

- Google Chrome
- Visual Studio Code
- Git
- Python 3.13
- VS Code 한국어 언어팩
- VS Code Python 및 Pylance 확장

## 설치 방법

1. 저장소의 **Code → Download ZIP**을 선택해 내려받고 압축을 풉니다.
2. `setup_codyssey.bat`을 실행합니다.
3. 설치가 끝나면 VS Code를 새로 열고 터미널에서 아래 명령으로 설치 여부를 확인합니다.

```bat
git --version
py -3.13 --version
code --version
```

설치기는 `winget`을 사용합니다. 인터넷 연결이 필요하며, 학교/공용 PC의 정책이나 관리자 권한 설정에 따라 일부 프로그램 설치가 차단될 수 있습니다. 이 경우 관리자에게 설치 가능 여부를 확인해야 합니다.

## 선택 설치

- `install_python_packages.bat`: 프로젝트별 `.venv` 가상환경에 NumPy, pandas, Matplotlib, seaborn, scikit-learn, Jupyter를 설치합니다.
- `install_docker_optional.bat`: Docker Desktop을 설치합니다. Docker Desktop은 PC의 WSL 2 기능 및 가상화 설정이 필요할 수 있으며, 이 스크립트는 Windows 기능을 자동으로 켜거나 재부팅하지 않습니다.

## 데이터 보관

이 저장소는 프로그램을 다시 설치하는 도구이며, PC 초기화로 삭제된 과제 파일을 복구하지는 않습니다. 과제 코드와 문서는 별도 GitHub 저장소에 커밋하거나 개인 클라우드에 백업하세요. 공용 PC에서 개인 계정 로그인 상태나 인증 정보를 저장하지 마세요.

## 라이선스 및 출처

이 저장소에는 프로그램 설치 파일을 포함하지 않습니다. `winget`을 통해 각 공급자의 설치 경로에서 내려받습니다. 각 프로그램의 사용 조건과 라이선스는 해당 공급자가 정한 내용을 따릅니다.
