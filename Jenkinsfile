pipeline {
  agent any

  tools {
    jdk 'jdk21'
    maven 'maven'
  }

  environment {
    IMAGE_NAME = 'yennies/dearus-app'
  }

  stages {
    stage('Build') {
      steps {
        echo '📦 Maven build 시작'
        dir('backend') {
          sh 'mvn clean package -DskipTests'
        }
      }
    }

    stage('Docker Build') {
      steps {
        echo '🐳 Docker 이미지 빌드'
        dir('backend') {
          sh 'docker build -t $IMAGE_NAME .'
        }
      }
    }

    stage('Docker Push') {
      steps {
        echo '📤 DockerHub에 푸시'
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          dir('backend') {
            sh """
              echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
              docker push $IMAGE_NAME
            """
          }
        }
      }
    }

    stage('Deploy') {
      steps {
        echo '🚀 Docker Compose로 배포 시작'
        dir('backend') { // docker-compose.yml 있는 폴더로 이동
          withCredentials([usernamePassword(credentialsId: 'db-credentials', usernameVariable: 'DB_USER', passwordVariable: 'DB_PASS')]) {
            sh """
              echo "DB 접속 확인용 - 사용자: $DB_USER"

              # 기존 컨테이너 종료
              docker compose down

              # 최신 코드로 재배포
              docker compose up -d
            """
          }
        }
      }
    }
  }

  post {
    failure {
      echo '❌ 실패: 로그 확인 요망'
    }
  }
}
