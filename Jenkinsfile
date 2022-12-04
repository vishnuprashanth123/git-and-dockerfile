pipeline {
    agent any

    stages {
        stage('clone') {
            steps {
                echo 'git clone url'
                git url: 'https://github.com/vishnuprashanth123/git-and-dockerfile.git',
                branch: 'dev1',
                credentialsId:'githubrepo'
            }
        }
          stage('Build') {
            steps {
                echo 'ecr image'
                sh 'chmod 777 buildimage.sh'
                sh './buildimage.sh'
            }
        }
          stage('Deploy') {
            steps {
                echo 'ecr deploy cluster and update services'
             sh 'aws ecs update-service --cluster ecs-cluster-jenkins --service ecs-service --task-definition  ecs-task --region ap-south-1'
            }
        }
    }
}
