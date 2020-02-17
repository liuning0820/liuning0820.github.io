pipeline {
          agent  any

          options {
            timeout(time: 1, unit: 'HOURS')
            timestamps()
            
        }


  stages {

 
    stage('Spell Check') {             
      agent {
        dockerfile {
            filename 'Dockerfile.mdspell'
            args '-u="root"'
            reuseNode true
          }
        }
          
      environment {
            // mdspell uses chalk to color output.
            // chalk uses a library called supports-color which auto-detects terminal support.
            // this env var will force the library to use color.
           FORCE_COLOR = "1";
        }

      steps {
        echo 'Checking spelling...'
        // mdspell -n -a -r --en-us "*.md" "*/*.md" "*/*/*.md"
        sh  ''' 
        mdspell -n -a -r --en-us "./_posts/*.md"
        '''
      }
    }
  }

  post { 
      unstable { 
            echo 'Pipeline is unstable!'
            emailext(subject: "Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' ", body: "Job '<${env.BUILD_URL}>' Unstable.", from: 'liuning0820@outlook.com',to: 'liuning0820@outlook.com')
      }

      always { 
            emailext(subject: "Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' ", body: "Job '<${env.BUILD_URL}>' Unstable.", from: 'liuning0820@outlook.com',to: 'liuning0820@outlook.com')
            echo 'Pipeline Completed!'
      }

}  
}


