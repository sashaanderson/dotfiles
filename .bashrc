ulimit -c 0 # disable stackdump files

[ -z "$PS1" ] && return

# --------------------------------------------------------------------------

function settitle {
    echo -ne "\033]0;$1\007"
}

function prompt_command {
    local err=$?
    if [[ "$err" -ne 0 ]]; then
        echo -e "\e[1;31m$err\e[0m" >&2
    fi
    settitle "${PWD/#$HOME/\~}"
    trap 'preexec_function' DEBUG
}

function preexec_function {
    [ -n "$COMP_LINE" ] && return
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return
    local cmd=`history 1`
    cmd=${cmd#*[0-9] }
    cmd=$(tr -dc '[[:print:]]' <<< "$cmd")
    cmd=${cmd//\\/\\\\}
    settitle "$cmd"
    trap - DEBUG
}

#PROMPT_COMMAND='settitle "$PWD"'
PROMPT_COMMAND=prompt_command
PS1='\w$ '

### Environment variables, for interactive shell only

export EDITOR=vim
export PAGER=less
export LESS=-X      # do not clear screen on exit

### Aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

function gvim()
{
    if [[ -t 0 ]]; then
        #gvim.exe "$@" &
        cygstart gvim.exe "$@"
    else
        gvim.exe "$@"
    fi
}

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias ls='ls --color=auto'
alias ll='ls -lA'
alias la='ls -A'
alias lf='ls -ACF'
alias lt='ls -lAt'

alias e='explorer /e,.'
alias pdb="perl -d -e 1"
