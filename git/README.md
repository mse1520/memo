# git 사용법

## git 설치
1. [git-scm.com](https://git-scm.com/) 해당 시이트로 이동하여 설치합니다
2. git을 설치하면 Git Bash, Git CMD 등을 확인할 수 있다  
Git CMD는 window 환경에서의 터미널이고,
Git Bash는 linux 환경에서의 터미널이다  

## git 용어 및 기본 동작 구조
- `HEAD`는 관리하고 있는 버전중 현재 위치를 가르킵니다
- git으로 버전관리 시 하나의 소스를 다양한 버전으로 나눌 수 있습니다  
나눠진 각각의 버전을 `branch`라고 합니다
- `add`는 working tree에 관리할 파일들을 올리는 명령어입니다
- `working tree`는 내가 작업하고 관리하는 파일들의 공간입니다  
- `commit`은 working tree에 올라온 수정 사항을 로컬 저장소에서 파일의 버전을 관리하게 합니다
- `push`는 로컬 저장소의 내용을 원격 저장소에 올리게 됩니다

## git 명령어

### 설정
```bash
# config 파일을 직접 열어서 수정한다
git config --global --edit

# 기본 에디터를 변경하는 옵션이다
# '에디터'는 nano, vim 등이 있다
git config --global core.editor 에디터

# 파일 제목이 한글일 때 깨짐 현상 해결
git config --global core.quotepath false

# git 유저 이메일 설정
git config --global user.email 이메일

# git 유저 이름 설정
git config --global user.name 이름
```

### 버전 관리
```bash
# git의 기본명령어 및 버전 등을 확인할 수 있다
git

# 현재경로를 버전관리 시작한다
git init .

# 관리 대상의 상태를 확인합니다
git status

# '파일'을 관리영역(working tree)에 올립니다
# add 할 때는 파일뿐만 아니라 디렉토리도 add 할 수 있으며 디렉토리가 대상인 경우 디렉토리 하위의 모든 파일을 add 합니다
git add 파일

# '파일'을 관리영역(working tree)에서 내립니다
git rm --cached 파일

# 변경점을 보여줍니다
git diff

# 관리영역(working tree)의 내용을 버전관리 합니다
# -m 옵션은 '내용'을 메세지로 사용합니다
# -a 옵션은 (기존에 등록된 파일들만)add와 동시에 commit 합니다
git commit
git commit -m 내용
git commit -am 내용 

# 가장 최근 commit message를 '내용'으로 수정합니다
git commit --amend -m 내용

# 버전의 history를 봅니다
# --stat 옵션은 버전과 변경된 파일의 리스트를 보여줍니다
# -p 옵션은 버전, 변경된 파일과 실제 변경된 내용까지 보여줍니다
# --all 옵션은 모든 브렌치의 내용을 보여줍니다 
# --oneline 옵션은 커밋한 내용을 한줄로 간단하게 표현해줍니다
# --graph 옵션은 커밋한 내용을 그래프로 보여줍니다
git log
git log --stat
git log -p
git log --all --graph --oneline

# 로그를 짧게 보여줍니다
git shortlog

# commit 하기전 지금까지 변경한 내용을 지웁니다
# --help 옵션은 reset의 자세한 명령어 사용법을 기술합니다
# --hard 옵션은 변경하고있는 내용을 포함해서 강력하게 지우는 명령어입니다
# 옵션은  soft, mixed, hard가 있습니다 
# 명시하지 않으면 기본이 mixed 입니다
git reset --help
git reset --hard
# 해당 버전으로 이동하고 그 이후의 버전은 삭제합니다
git reset --hard commitID
# '시점'에서 1칸 뒤의 버전까지 되돌립니다
git reset 시점~1

# 'HEAD'버전의 바로 전 버전을 새로운 버전으로 commit 합니다
# 주의 할 점은 가장 최근의 버전에서만 동작합니다
git revert HEAD

# 과거의 모든 버전(제거한 버전까지)의 내용을 볼 수 있다
git reflog
```

### 원격저장소
```bash
# 'remote' 라는 원격 저장소를 생성합니다
git init --bare remote.git

# 현재 버전관리에 어떤 원격저장소가 연결되어있는지 확인합니다
git remote
git remote -v
#  내 버전관리를 'origin'이란 이름으로 '원격주소'의 원격저장소를 추가합니다
git remote add origin 원격주소

# 'origin' 원격 저장소에 'master' 브렌치를 업로드합니다
git push origin master
# [-u | --set-upstream] 옵션은 'origin' 원격저장소에 'master'를 기본 업로드로 설정한다
# 해당 옵션 적용 시 'git push'명령어만으로 업로드할 수 있다
git push -u origin master
git push --set-upstream origin master
# 로컬에서 삭제된 develop 브랜치 내용을 원격저장소에 업로드합니다
git push origin :develop

# '원격주소'의 내용을 내 로컬저장소로 불러옵니다
# '폴더명' 생략 시 '원격주소'의 기본 이름으로 폴더가 생성됩니다
git clone 원격주소 폴더명

# 'origin' 원격저장소의 'master' 브렌치 내용을 가져옵니다
# [-u | --set-upstream] 옵션을 설정한 경우 'origin'과 'master'는 생략이 가능합니다
git pull origin master
```

### branch
```bash
# 브랜치의 내역을 봅니다
git branch
# 'apple'이란 브랜치를 만듭니다
git branch apple
# 'apple'이란 브랜치를 삭제합니다
git branch -D apple

# 'commitID'의 버전으로 HEAD가 이동합니다
git checkout commitID
# 'apple' 브랜치로 HEAD가 이동합니다
git checkout apple

# HEAD와 'o2' 브랜치의 내용을 병합합니다
git merge o2

# merge 하던 것을 취소합니다
git reset --merge
# 원격 저장소에 업로드된 버전만 업데이트 합니다
git fetch
# fetch와 merge를 동시에 하는 명령어 입니다
# FETCH_HEAD는 원격저장소의 가장 최근 버전을 가르킵니다
git fetch; git merge FETCH_HEAD
```

### cherry-pick & rebase
```bash
# HEAD에 'commitID' 버전의 변화만을 새로운 버전으로 만듭니다
git cherry-pick commitID

# 현재 브랜치에 base를 'commitID' 버전으로 변경합니다
git rebase commitID

# 같은 branch를 rebase 했을 시 강제로 push 해줄 수 있다
# -f 옵션은 강제로 업로드 하는 옵션입니다
git push -f
git push -f origin
```

### 협업 관련
```bash
# 'commitID'를 기준으로 수정된 버전을 파일로 만드는 명령어
git format-patch commitID

# 모든 .patch 파일을 3way-merge로 파일을 commit 합니다
# -i 옵션은 인터렉티브 모드로 사용자에게 어떻게 적용할 것인지 물어보며 진행하는 모드입니다
# v: 내용을 볼 수 있다
# y: 는 파일을 commit 합니다
# e: 는 commit 메세지를 변경할 수 있습니다
git am -3 -i *.patch
```

## 기타
### ssh 설정 on window
ssh 설정을 하는 이유는 window PC를 git 원격 저장소로 설정하기 위함입니다
1. 시작 버튼 클릭
2. 설정버튼 클릭
3. 앱 버튼 클릭 
3. 앱 및 기능 
4. 선택적 기능 
5. 기능 추가
6. OpenSSH 서버 설치
7. PowerShell 실행 
    ```powershell
    # ssh 상태를 가져옵니다
    Get-Service sshd

    # ssh를 실행합니다
    Start-Service sshd

    # ssh를 중지합니다
    Stop-Service sshd

    # ssh를 재시작합니다
    Restart-Service sshd

    # Git Bash를 기본 cli 터미널로 바꿔주는 명령어
    New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Program Files\Git\bin\bash.exe" -PropertyType String -Force
    ```

### vim 에디터 사용법
1. esc 클릭
2. 파일작성
3. :wq 입력
    - w 는 write
    - q 는 quit

### 참고
- git flow 를 검색해봅시다  
git으로 협업을 할 때 branch 권장 사용법에 대하여 설명하고 있습니다



