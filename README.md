# 코디세이 기초 프로그램 패키지

Windows PC에서 코디세이 학습에 필요한 개발 환경을 설치합니다. PC가 초기화되면 인터넷에 연결한 뒤 설치기를 다시 실행하세요.

## 사용 방법

1. 저장소에서 Code → Download ZIP을 선택하고 압축을 풉니다.
2. 폴더 안의 setup_codyssey.bat을 더블클릭합니다.
3. 메뉴에서 필요한 작업을 선택합니다. 실행 시 별도 명령 프롬프트 창이 열리며 결과를 확인할 수 있도록 유지됩니다.

## 설치 메뉴

1. 기본 프로그램: Google Chrome, Visual Studio Code, Git, Python 3.13
2. VS Code 확장: 한국어 언어팩, Python, Pylance
3. Python 패키지: NumPy, pandas, Matplotlib, seaborn, scikit-learn, Jupyter를 저장소 폴더의 .venv 가상환경에 설치
4. Docker Desktop
5. 전체 설치: 위 항목을 순서대로 실행

설치 후 새 명령 프롬프트에서 git --version, py -3.13 --version, code --version 명령으로 확인할 수 있습니다.

Python 패키지 가상환경은 저장소 폴더에서 .venv\Scripts\activate 명령으로 활성화합니다.

## 참고

- 설치는 winget과 인터넷 연결을 사용합니다. Microsoft Store의 앱 설치 관리자(App Installer)가 필요합니다.
- 학교/공용 PC의 권한이나 네트워크 정책으로 설치가 차단될 수 있습니다.
- Docker Desktop은 WSL 2 및 하드웨어 가상화가 필요할 수 있으며 재부팅이나 추가 설정을 요구할 수 있습니다.
- 이 도구는 프로그램 설치기이며, PC 초기화로 삭제된 과제 파일을 복구하지 않습니다. 과제 파일은 별도로 GitHub 등에 백업하세요.
- 설치 프로그램 자체는 저장소에 포함하지 않습니다. winget을 통해 공급자 배포본으로 설치합니다.