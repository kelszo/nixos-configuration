# user colors
if [ $UID -eq 0 ]; then USERCOLOR="red"; else USERCOLOR="green"; fi

# workdir
local current_dir='${PWD/#$HOME/~}'

# return status
local ret_status="%(?:%{$fg_bold[255]%}➤  :%{$fg_bold[red]%}➤  %s)"

NEWLINE=$'\n'

PROMPT="${NEWLINE}\
${current_dir}\
%{$reset_color%}
${ret_status}\
%{$reset_color%}"