# Server Setup & Command Guide
기본적으로 알면 좋은 서버 설정 및 명령어들을 정리하여 작성하였습니다.

- [Document](../README.md)
- [Server Setup & Command Guide](./docs/setup-and-command.md)
- [Python usage](./docs/python.md)
- [Project ai](./ai/README.md)
- [Project api](./api/README.md)
- [Code Docs](./docs/code.md)

## Linux

### ssh-keygen
암호키를 만들때 사용하며 서버에 배포하기 위한 용도로 암호를 생성합니다.

#### 기본 명령어
```bash
# ssh-keygen -t rsa -C <원격 git 로그인 이메일>
ssh-keygen -t rsa -C metanode@metanode.co.kr
# -t 암호화 방식 -m 파일형식 -C 코멘트
ssh-keygen -t rsa -m pem -f metacube -C metanode@metanode.co.kr
```

#### 서버 키파일 생성후 접속하기 (응용)
1. 키파일 생성
    ```bash
    ssh-keygen -t rsa -m pem -f my_key
    ```
2. 퍼블릭키 서버 등록
    ```bash
    cat ~/.ssh/my_key.pub >> ~/.ssh/authorized_keys
    ```
3. ssh 설정 파일(/etc/ssh/sshd_config) 수정
    ```bash
    # 키접속 허용
    PubkeyAuthentication yes
    # 패스워드 접속 금지
    PasswordAuthentication no
    ```
4. ssh 재시작
    ```bash
    sudo systemctl restart ssh
    ```

### cron 작성방법
Spring scheduler, logstash, contab등에서 사용할 수 있습니다.

```bash
# 분(0-59) 시간(0-23) 일(1-31) 월(1-12) 요일(0-7)
* * * * * # 매분마다 실행
*/15 * * * * # 15분마다 실행
15,30 * * * * # 매시 15분, 30분에 실행
15-30 * * * * # 매시 15분에서 30분까지 매분마다 실행
```

## Window

### 스크립트 실행 정책 변경
개발 환경에서 특정 명령어 또는 특정 패키지의 실행이 자유롭게 하기 위한 설정입니다.

```bash
# 현재 파워쉘의 실행 정책을 확인 (기본값은 Restricted)
Get-ExecutionPolicy
# 파워쉘 실행 정책을 'RemoteSigned'으로 변경
Set-ExecutionPolicy RemoteSigned
```

### 자바 환경변수 임시 설정 방법
JAVA_HOME 환경변수를 임시로 설정해 필요한 버전의 자바버전을 사용할 수 있습니다.

```bash
$env:JAVA_HOME='C:/Users/user/Desktop/workspace/java/microsoft-jdk-17.0.11-windows-x64/jdk-17.0.11+9'
```