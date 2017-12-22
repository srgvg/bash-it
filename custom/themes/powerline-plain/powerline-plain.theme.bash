#!/usr/bin/env bash

function __powerline_ansible_prompt {
  if [[ "$PATH" =~ "ansible" ]]; then
        ANSIVER=$(ansible --version | head -n1 | sed -e 's/ansible //' -e's/ last updated.*//')
        echo "ansible ${ANSIVER}"
    fi
}

POWERLINE_PROMPT="user_info ansible scm python_venv cwd last_status"

source "$BASH_IT/themes/$BASH_IT_THEME/$BASH_IT_THEME.theme.bash"

