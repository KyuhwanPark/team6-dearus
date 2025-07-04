pipeline {
  agent any

  tools {
    jdk 'jdk21'
    maven 'maven'
  }

  environment {
    IMAGE_NAME = 'yennies/dearus-app' // TODO: 본인 DockerHub ID로 교체
  }

  stages {
    stage('Build') {
      steps {
        dir("${env.WORK_DIR}") {
          echo '📦 Maven build 시작'
          sh 'mvn clean package -DskipTests'
        }
      }
    }

    stage('Docker Build') {
      steps {
        dir("${env.WORK_DIR}") {
          echo '🐳 Docker 이미지 빌드'
          sh 'docker build -t $IMAGE_NAME .'
        }
      }
    }


    stage('Docker Push') {
      steps {
        dir("${env.WORK_DIR}") {
          echo '📤 DockerHub 푸시'
          withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
            sh '''
              echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
              docker push $IMAGE_NAME
            '''
        }
      }
    }
  }
}

 post {
    success {
      echo "✅ 빌드 및 Docker 이미지 푸시 완료"
    }
    failure {
      echo "❌ 실패: 로그 확인 요망"
    }
  }
}
