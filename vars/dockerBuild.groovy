def call(Map config = [:]) {
    def imageName = config.imageName ?: 'my-app'
    def tag = config.tag ?: 'latest'
    sh "docker build -t ${imageName}:${tag} ."
}
