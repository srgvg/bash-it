cite about-plugin
about-plugin 'add a newline before the prompt'

function preexec_newline_before_prompt_install () {
    function preexec () {
      echo
    }

    preexec_install
}

preexec_newline_before_prompt_install

