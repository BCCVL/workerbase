node('docker') {

    def imagename
    def img

    // fetch source
    stage('Checkout') {

        checkout scm

        // fetch makent.jar from swift
        swiftDownload('maxent/maxent-3.3.3k.jar', './files/maxent.jar', 'SwiftTmpKey')

    }

    // build image
    stage('Build') {

        imagename = "hub.bccvl.org.au/bccvl/workerbase:${dateTag()}"

        withCredentials([string(credentialsId: 'pypi_index_url_prod', variable: 'PYPI_INDEX_URL')]) {

            docker.withRegistry('https://hub.bccvl.org.au', 'hub.bccvl.org.au') {
                img = docker.build(imagename, "--pull --no-cache --build-arg PIP_INDEX_URL=${PYPI_INDEX_URL} . ")
            }
        }

    }

    // publish image to registry
    stage('Publish') {

        docker.withRegistry('https://hub.bccvl.org.au', 'hub.bccvlorg.au') {
            img.push()
        }

        slackSend color: 'good', message: "New Image ${imagename}\n${env.JOB_URL}"

    }
}
