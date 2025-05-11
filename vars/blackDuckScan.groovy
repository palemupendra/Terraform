def call(Map config = [:]) {
    // Example BlackDuck scan step
    sh "blackduck scan --project ${config.projectName ?: 'default-project'} --version ${config.projectVersion ?: 'latest'}"
} 