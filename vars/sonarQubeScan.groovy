def call(Map config = [:]) {
    withSonarQubeEnv(config.sonarEnv ?: 'SonarQube') {
        sh "sonar-scanner -Dsonar.projectKey=${config.projectKey} -Dsonar.sources=."
    }
} 