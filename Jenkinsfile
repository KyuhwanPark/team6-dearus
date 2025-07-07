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
        dir('backend') {
          withCredentials([
            usernamePassword(credentialsId: 'db-credentials', usernameVariable: 'DB_USERNAME', passwordVariable: 'DB_PASSWORD'),
            usernamePassword(credentialsId: 'mysql-root', usernameVariable: 'MYSQL_USER', passwordVariable: 'MYSQL_ROOT_PASSWORD')
          ]) {
            sh """
              DB_NAME=dearus \\
              DB_URL=jdbc:mysql://dearus-db:3306/dearus \\
              DB_USERNAME=$DB_USERNAME \\
              DB_PASSWORD=$DB_PASSWORD \\
              MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \\
              docker compose up -d --build
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
