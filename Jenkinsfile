import java.text.SimpleDateFormat
import java.util.Date

node {
    // fetch source
    stage 'Checkout'

    checkout scm

    // copy maxent.jar into clone
    sh "cp ${env.JENKINS_HOME}/maxent.jar ./files/"

    // build image
    stage 'Build'

    def imagename = 'hub.bccvl.org.au/bccvl/workerbase'
    def img = docker.build(imagename)

    // publish image to registry
    stage 'Publish'

    def imagetag = date()
    img.push(imagetag)

    slackSend color: 'good', message: "New Image ${imagename}:${imagetag}\n${env.JOB_URL}"
}

@NonCPS
def date() {
    return new SimpleDateFormat("yyyy-MM-dd").format(new Date())
}
