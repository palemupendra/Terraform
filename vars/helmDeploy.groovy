def call(Map config = [:]) {
    def releaseName = config.releaseName ?: 'my-release'
    def chartPath = config.chartPath ?: '.'
    def namespace = config.namespace ?: 'default'
    def kubeContext = config.kubeContext ?: ''
    def valuesFile = config.valuesFile ? "-f ${config.valuesFile}" : ''

    def contextCmd = kubeContext ? "--kube-context ${kubeContext}" : ''
    sh "helm upgrade --install ${releaseName} ${chartPath} ${valuesFile} --namespace ${namespace} ${contextCmd}"
} 