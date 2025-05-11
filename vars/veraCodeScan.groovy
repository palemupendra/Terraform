def call(Map config = [:]) {
    // Example VeraCode scan step
    sh "veracode scan --appname ${config.appName ?: 'default-app'} --filepath ${config.filePath ?: '.'}"
} 