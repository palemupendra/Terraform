// vars/checkoutGithubRepo.groovy
def call(Map config = [:]) {
    def repo = config.repo ?: error("repo is required")
    def branch = config.branch ?: 'main'
    def credentialsId = config.credentialsId ?: null

    checkout([
        $class: 'GitSCM',
        branches: [[name: "*/${branch}"]],
        userRemoteConfigs: [[
            url: repo,
            credentialsId: credentialsId
        ]]
    ])
}