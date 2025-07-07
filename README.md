# ✒️ DearUs

<p align="center">
<img src="https://github.com/likeLion-backendJava15/team6-dearus/blob/main/backend/src/main/resources/static/img/dearus-logo.png?raw=true" style="width:50%">
</p>


## 📖 프로젝트 소개

DearUs는 사용자가 자신의 감정과 일상을 기록하고 공유할 수 있는 공유 일기 웹 애플리케이션입니다.

<br>

## ✨ 주요 기능

- **일기 작성 및 관리:** 사용자는 일기를 작성, 수정, 삭제할 수 있습니다.
- **감정 통계:** 사용자는 자신의 감정 통계를 확인할 수 있습니다.
- **태그:** 사용자는 태그를 이용하여 일기를 분류할 수 있습니다.
- **댓글:** 사용자는 다른 사람의 일기에 댓글을 작성할 수 있습니다.
- **멤버 초대:** 사용자는 다른 사용자를 자신의 일기장에 초대할 수 있습니다.

<br>

## 🛠️ 기술 스택

### Backend

![Java](https://img.shields.io/badge/java-%231E8CBE.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring](https://img.shields.io/badge/springboot-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)
![Spring Security](https://img.shields.io/badge/Spring%20Security-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white)

### Frontend

![Thymeleaf](https://img.shields.io/badge/Thymeleaf-%23005C0F.svg?style=for-the-badge&logo=Thymeleaf&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23F7DF1E.svg?style=for-the-badge&logo=javascript&logoColor=black)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)

### Database

![MySQL](https://img.shields.io/badge/mysql-%2300758F.svg?style=for-the-badge&logo=mysql&logoColor=white)

### DevOps & Deployment

![Docker](https://img.shields.io/badge/docker-%232496ED.svg?style=for-the-badge&logo=docker&logoColor=white)
![Jenkins](https://img.shields.io/badge/jenkins-%23D24939.svg?style=for-the-badge&logo=jenkins&logoColor=white)

### Version Control & Collaboration

![GitHub](https://img.shields.io/badge/github-%23181717.svg?style=for-the-badge&logo=github&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05032.svg?style=for-the-badge&logo=git&logoColor=white)
[![Notion](https://img.shields.io/badge/notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white)](https://www.notion.so/yennies/DearUs-20638212968b8148b20cd6c827ab1378?source=copy_link)
![Discord](https://img.shields.io/badge/discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)

<br>

## 👨‍💻 팀원 소개

|                                      Profile                                       |                     Name                      |            Role            |
| :--------------------------------------------------------------------------------: | :-------------------------------------------: | :-------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/156408029?s=88&v=4" width="100"> |  [이예은](https://github.com/petite-coder/)   | 일기, 댓글 CRUD, 초대 확인 |
| <img src="https://avatars.githubusercontent.com/u/48876760?s=88&v=4" width="100">  |    [정병수](https://github.com/cTosMaster)    |        일기장 CRUD         |
| <img src="https://avatars.githubusercontent.com/u/77006400?s=88&v=4" width="100">  |   [박규환](https://github.com/KyuhwanPark)    |    태그 CRUD, 멤버 관리    |
| <img src="https://avatars.githubusercontent.com/u/144826575?s=88&v=4" width="100"> |   [신재현](https://github.com/jaehyeonsin1)   |         감정 통계          |
| <img src="https://avatars.githubusercontent.com/u/169969437?s=88&v=4" width="100"> |  [hyojin0911](https://github.com/hyojin0911)  |         멤버 관리          |
| <img src="https://avatars.githubusercontent.com/u/200905713?s=88&v=4" width="100"> | [sunhyun0508](https://github.com/sunhyun0508) |         댓글 CRUD          |

<br>

## 🚀 API 엔드포인트

|    Category     |  Method  | Endpoint                                    | Description               |
| :-------------: | :------: | :------------------------------------------ | :------------------------------------------------------------------------- |
|    다이어리     |  `POST`  | `/api/diary`                                | 다이어리 생성             |
|    다이어리     |  `GET`   | `/api/diary`                                | 내 다이어리 목록 조회     |
|    다이어리     |  `GET`   | `/api/diary/{id}`                           | 다이어리 상세 조회        |
|    다이어리     |  `PUT`   | `/api/diary/{id}`                           | 다이어리 수정             |
|    다이어리     | `DELETE` | `/api/diary/{id}`                           | 다이어리 삭제             |
|      일기       |  `POST`  | `/api/entry`                                | 일기 생성                 |
|      일기       |  `GET`   | `/api/diary/{diaryId}/entries`              | 다이어리별 일기 목록 조회 |
|      일기       |  `GET`   | `/api/entry/{entryId}`                      | 일기 상세 조회            |
|      일기       |  `PUT`   | `/api/entry/{entryId}`                      | 일기 수정                 |
|      일기       | `DELETE` | `/api/entry/{entryId}`                      | 일기 삭제                 |
|      댓글       |  `POST`  | `/api/entry/{entryId}/comments`             | 댓글 생성                 |
|      댓글       |  `GET`   | `/api/entry/{entryId}/comments`             | 댓글 목록 조회            |
|      댓글       |  `PUT`   | `/api/entry/{entryId}/comments/{commentId}` | 댓글 수정                 |
|      댓글       | `DELETE` | `/api/entry/{entryId}/comments/{commentId}` | 댓글 삭제                 |
|    감정 통계    |  `GET`   | `/api/emotion/{diaryId}/stat`               | 감정 통계 조회            |
|      태그       |  `POST`  | `/api/tag`                                  | 태그 생성                 |
|      태그       |  `GET`   | `/api/tag`                                  | 태그 목록 조회            |
|      태그       |  `PUT`   | `/api/tag/{tagId}`                          | 태그 수정                 |
|      태그       | `DELETE` | `/api/tag/{tagId}`                          | 태그 삭제                 |
|      태그       |  `GET`   | `/api/tag/{tagId}/entries`                  | 태그별 일기 목록 조회     |
|      태그       |  `POST`  | `/api/entry/{entryId}/tags`                 | 일기에 태그 연결          |
|      태그       | `DELETE` | `/api/entry/{entryId}/tags/{tagId}`         | 일기에서 태그 제거        |
|      멤버       |  `POST`  | `/api/diary/{diaryId}/invite`               | 멤버 초대                 |
|      멤버       |  `POST`  | `/api/diary/{diaryId}/accept`               | 초대 수락                 |
|      멤버       |  `GET`   | `/api/diary/{diaryId}/members`              | 멤버 목록 조회            |
|      멤버       | `DELETE` | `/api/diary/{diaryId}/members/{userId}`     | 멤버 추방                 |
|      멤버       |  `GET`   | `/api/invites`                              | 받은 초대 목록 조회       |
|      멤버       | `DELETE` | `/api/diary/{diaryId}/decline`              | 초대 거절                 |
|     이미지      |  `POST`  | `/image/upload`                             | 이미지 업로드             |
| 페이지 컨트롤러 |  `GET`   | `/`                                         | 환영 페이지               |
| 페이지 컨트롤러 |  `GET`   | `/login`                                    | 로그인 페이지             |
| 페이지 컨트롤러 |  `GET`   | `/signup`                                   | 회원가입 페이지           |
| 페이지 컨트롤러 |  `GET`   | `/diary/form`                               | 다이어리 생성/수정 페이지 |
| 페이지 컨트롤러 |  `GET`   | `/diary/list`                               | 다이어리 목록 페이지      |
| 페이지 컨트롤러 |  `GET`   | `/entry/form`                               | 일기 생성/수정 페이지     |
| 페이지 컨트롤러 |  `GET`   | `/entry/list`                               | 일기 목록 페이지          |
| 페이지 컨트롤러 |  `GET`   | `/entry/{entryId}`                          | 일기 상세 페이지          |
| 페이지 컨트롤러 |  `GET`   | `/emotion/stat`                             | 감정 통계 페이지          |
| 페이지 컨트롤러 |  `GET`   | `/tag/view`                                 | 태그별 일기 목록 페이지   |
| 페이지 컨트롤러 |  `GET`   | `/manage/members`                           | 멤버 관리 페이지          |

<br>

## ⚙️ 실행 방법

### 1. DB설정

MySQL에서 db/diaryTable.sql 파일 실행

<br>

### 2. 환경변수 설정
backend 폴더에 ```.env```  파일 생성 후 아래 형식으로 입력
```
DB_URL=jdbc:mysql://localhost:포트번호/스키마이름?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Seoul
DB_USERNAME=Username
DB_PASSWORD=비밀번호
```

<br>

### 3. 실행
1.  **레포지토리 클론:**
    ```bash
    git clone https://github.com/your-username/team6-dearus.git
    ```
2.  **백엔드 디렉토리로 이동:**
    ```bash
    cd team6-dearus/backend
    ```
3.  **Maven으로 애플리케이션 실행:**
    ```bash
    ./mvnw spring-boot:run
    ```
4.  **애플리케이션 접속:**
    브라우저에서 `http://localhost:9000`으로 접속합니다.
