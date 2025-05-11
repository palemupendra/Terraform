def call(Map config = [:]) {
    def imageName = config.imageName ?: 'my-app'
    def tag = config.tag ?: 'latest'
    def ecrRepo = config.ecrRepo ?: error('ecrRepo is required')
    def awsRegion = config.awsRegion ?: 'us-east-1'

    sh "aws ecr get-login-password --region ${awsRegion} | docker login --username AWS --password-stdin ${ecrRepo}"
    sh "docker tag ${imageName}:${tag} ${ecrRepo}:${tag}"
    sh "docker push ${ecrRepo}:${tag}"
} 