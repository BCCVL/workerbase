node('docker') {

    def imagename
    def img

    def INDEX_HOST = env.PIP_INDEX_HOST
    def INDEX_URL = "http://${INDEX_HOST}:3141/bccvl/prod/+simple/"

    // fetch source
    stage('Checkout') {

        checkout scm

        // fetch makent.jar from swift
        swiftDownload('maxent/maxent-3.3.3k.jar', './files/maxent.jar', 'SwiftTmpKey')

    }

    // build image
    stage('Build') {

        imagename = "hub.bccvl.org.au/bccvl/workerbase:${dateTag()}"

        docker.withRegistry('https://hub.bccvl.org.au', 'hub.bccvl.org.au') {
            img = docker.build(imagename, "--pull --no-cache --build-arg PIP_INDEX_URL=${INDEX_URL} --build-arg PIP_TRUSTED_HOST=${INDEX_HOST} . ")
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
