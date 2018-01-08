#!/usr/bin/env bash

basetheme=powerline-multiline
source "$BASH_IT/themes/$basetheme/$basetheme.theme.bash"

POWERLINE_LEFT_PROMPT="newline user_info hostname scm cwd"
POWERLINE_RIGHT_PROMPT="ansible python_venv clock"

POWERLINE_LEFT_SEPARATOR=""
POWERLINE_RIGHT_SEPARATOR=""
POWERLINE_LEFT_END=""
POWERLINE_RIGHT_END=""
POWERLINE_ANSIBLE_CHAR="Ⓐ "
POWERLINE_USER_INFO_SSH_CHAR="(ssh)"

# https://misc.flogisoft.com/bash/tip_colors_and_formatting#background1
ANSIBLE_THEME_PROMPT_COLOR=88
#BATTERY_STATUS_THEME_PROMPT_CRITICAL_COLOR=160
#BATTERY_STATUS_THEME_PROMPT_GOOD_COLOR=70
#BATTERY_STATUS_THEME_PROMPT_LOW_COLOR=208
CLOCK_THEME_PROMPT_COLOR=232 # 240
#CWD_THEME_PROMPT_COLOR=240
#IN_VIM_THEME_PROMPT_COLOR=245
#LAST_STATUS_THEME_PROMPT_COLOR=196
#PYTHON_VENV_THEME_PROMPT_COLOR=35
#RUBY_THEME_PROMPT_COLOR=161
#SCM_THEME_PROMPT_CLEAN_COLOR=25
#SCM_THEME_PROMPT_COLOR=${SCM_THEME_PROMPT_CLEAN_COLOR}
#SCM_THEME_PROMPT_DIRTY_COLOR=88
#SCM_THEME_PROMPT_STAGED_COLOR=30
#SCM_THEME_PROMPT_UNSTAGED_COLOR=92
#USER_INFO_THEME_PROMPT_COLOR=32
#USER_INFO_THEME_PROMPT_COLOR_SUDO=202


function rename_function() {
    local ORIG_FUNC=$(declare -f $1)
    local NEWNAME_FUNC="$2${ORIG_FUNC#$1}"
    eval "$NEWNAME_FUNC"
}

function __powerline_ansible_prompt() {
  if [[ "$PATH" =~ "ansible" ]]; then
        local ANSIBLE=$(ansible --version | head -n1 | \
          sed -e 's/ansible //' -e's/ last updated.*//')
        echo "${POWERLINE_ANSIBLE_CHAR}${ANSIBLE}|${ANSIBLE_THEME_PROMPT_COLOR}"
  fi
}

function __powerline_newline_prompt() {
  echo -e '\\n'
}

rename_function __powerline_prompt_command ___powerline_prompt_command

function __powerline_prompt_command {
  local last_status="$?" ## always the first
  local separator_char="${POWERLINE_LEFT_SEPARATOR}"
  local move_cursor_rightmost='\033[500C'

  LEFT_PROMPT=""
  RIGHT_PROMPT=""
  RIGHT_PROMPT_LENGTH=0
  SEGMENTS_AT_LEFT=0
  SEGMENTS_AT_RIGHT=0
  LAST_SEGMENT_COLOR=""

  ## left prompt ##
  for segment in $POWERLINE_LEFT_PROMPT; do
    local info="$(__powerline_${segment}_prompt)"
    [[ -n "${info}" ]] && __powerline_left_segment "${info}"
  done
  LEFT_PROMPT+="$(__powerline_last_status_prompt ${last_status})"
  [[ -n "${LEFT_PROMPT}" ]] && LEFT_PROMPT+="$(set_color ${LAST_SEGMENT_COLOR} -)${POWERLINE_LEFT_END}${normal}"

  ## right prompt ##
  if [[ -n "${POWERLINE_RIGHT_PROMPT}" ]]; then
    LEFT_PROMPT+="${move_cursor_rightmost}"
    for segment in $POWERLINE_RIGHT_PROMPT; do
      local info="$(__powerline_${segment}_prompt)"
      [[ -n "${info}" ]] && __powerline_right_segment "${info}"
    done
      LEFT_PROMPT+="\033[${RIGHT_PROMPT_LENGTH}D"
  fi

  PS1="${LEFT_PROMPT}${RIGHT_PROMPT}\n${PROMPT_CHAR} "

  ## cleanup ##
  unset LAST_SEGMENT_COLOR \
        LEFT_PROMPT RIGHT_PROMPT RIGHT_PROMPT_LENGTH \
        SEGMENTS_AT_LEFT SEGMENTS_AT_RIGHT SEGMENTS_AT_LEFT
}

