 pipeline {
         agent  any

stages {

    stage ('dummy Jenkinsfile - no job real made'){
                steps {
		    echo 'dummy Jenkinsfile'
                }
            }



        
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
             sh  '''
             mdspell -V
             mdspell -n -a -r --en-us --dictionary dicts/en_US-large "*.md" "*/*.md" "*/*/*.md"
             '''
          }
        }
      


    }
}