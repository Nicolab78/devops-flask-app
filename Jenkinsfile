pipeline {
    agent any
    
    triggers {
        pollSCM('* * * * *') 
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t devops-flask-app .'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'docker run --rm devops-flask-app pytest test_app.py'
            }
        }
        
        stage('Lint') {
            steps {
                echo 'Running linter...'
                sh 'docker run --rm devops-flask-app flake8 app.py'
            }
        }
    }
    
    post {
        success {
            echo '✅ Pipeline réussie !'
        }
        failure {
            echo '❌ Pipeline échouée !'
        }
    }
}