pipeline {
    agent { label 'linux-agent' }
    environment {        
        ENV='dev'
        DOCKER_HUB_USERNAME='chehine'
        DOCKER_HUB_PASSWORD=credentials('DOCKER_HUB_PASSWORD')
        SNOWFLAKE_PASSWORD=credentials('SNOWFLAKE_PASSWORD')
        ARGOCD_PASSWORD=credentials('ARGOCD_PASSWORD')
        DOCKER_HUB_ACCOUNT='chehine'
        K8S_REPLICAS='1'
		K8S_URL='http://35.203.121.53:31111'
    }
    stages {

        stage('Migrate DEV Database') {
            steps { sh './stages/flyway/flyway.sh' }}


        stage('Deploy DEV to Local') {
            steps { sh './stages/deploy/deploy.sh' }}
        
        
        stage('Deploy DEV to K8S') {
            environment {
                NAMESPACE = "dev"
            }
            steps { sh './stages/argocd/argocd.sh' }}
        
        
        stage('DEV Sanity Tests') {
            steps { sh './stages/test/sanity.sh' }}
                        
        
        stage('Promote Image') {
            input { message "Do you want to proceed for Production Deployment?" }
            steps { sh './stages/promote/promote.sh' }}
               
        
        stage('Migrate PROD Database') {
            environment { ENV = "prod" }
            steps { sh './stages/flyway/flyway.sh' }}

        
        stage('Deploy PROD to K8S') {
            environment {
                ENV = "prod"
                K8S_REPLICAS='3'
            }
            steps { sh './stages/argocd/argocd.sh' }}
        
        stage('PROD Sanity Tests') {
            environment { K8S_URL='http://35.203.121.53:32222'
                          ENV="PROD"
                        }
            steps { sh './stages/test/sanity.sh' }}
    }
}
