pipeline {
          agent  any

          options {
            timestamps()
        }

        // environment {
        //   FOO = 'BAR'
        // }


  stages {

    stage('test') {
      steps{
        error("Blocking pipeline")
        }

        post{
      always{
        echo "1"
      }

      changed{
        echo "2"
      }

      failure{
        echo "3"
      }

      unsuccessful{
        echo "4"
      }

      unstable{
        echo "5"
      }

      cleanup{
        echo "6"
      }
    }
        
      }
    }

    

       
    // stage('Spell Check') {             
    //   agent {
    //     dockerfile {
    //         filename 'Dockerfile.mdspell'
    //         args '-u="root"'
    //         reuseNode true
    //       }
    //     }
          
    //   environment {
    //         // mdspell uses chalk to color output.
    //         // chalk uses a library called supports-color which auto-detects terminal support.
    //         // this env var will force the library to use color.
    //        FORCE_COLOR = "1";
    //     }

    //   steps {
    //     echo 'Checking spelling...'
    //     // mdspell -n -a -r --en-us "*.md" "*/*.md" "*/*/*.md"
    //     sh  ''' 
    //     mdspell -n -a -r --en-us "./_posts/*.md"
    //     '''
    //   }
    // }  

    post{
      always{
        echo "8"
      }
    }  


  }


