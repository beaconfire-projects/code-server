podTemplate() {
    node('code-server') {
        stage('Node Project') {
            def scmSpec = [
                $class: 'GitSCM',
                branches: scm.branches,
                extensions: [
                    [$class: 'LocalBranch', localBranch: '**'],
                    [$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: true, recursiveSubmodules: true, reference: '', trackingSubmodules: false]
                ],
                userRemoteConfigs: scm.userRemoteConfigs
            ]
            checkout scmSpec
            container('node') {
                stage('Build a Node Project') {
                    echo 'Start to build IDE ...'
                    sh('echo $VERSION')
                    sh('git submodule update --init')
                    sh('quilt push -a')
                    sh('yarn')
                    sh('yarn build')
                    sh('yarn build:vscode')
                    sh('yarn release')
                    sh('yarn release:standalone')
                    sh('yarn test:integration')
                    sh('yarn package')
                    echo 'Finish to build IDE !!!' 
                }
            }
            // container('docker') {
            //     stage('Build a Docker Project') {
            //         sh('docker build -t beaconfireiic/${JOB_NAME%%_*}:$(cat GIT_BRANCH)-$BUILD_ID-k8s .')
            //         sh('docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD $DOCKER_REGISTRY')
            //         sh('docker push beaconfireiic/${JOB_NAME%%_*}:$(cat GIT_BRANCH)-$BUILD_ID-k8s')
            //     }
            // }
        }
    }
}