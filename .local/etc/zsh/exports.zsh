export EMAIL=nikita.marchant@gmail.com
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export WORDCHARS=${WORDCHARS:s,/,,} # to have an emacs-like backward-kill-word
export TERM=rxvt
export REPORTTIME=10 # Say how long a command took, if it took more than 10 seconds
export MAKEFLAGS="-j 4"

# default pager
if [[ -x $(which most) ]]
then
    export PAGER="most"
elif [[ -x $(which less) ]]
then
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
    if [[ -x $(which lesspipe.sh) ]]
    then
        LESSOPEN="| lesspipe.sh %s"
        export LESSOPEN
    fi
fi

# default editor
if [[ -x $(which nano) ]]
then
    export EDITOR="nano"
elif [[ -x $(which vim) ]]
then
    export EDITOR="vim"
elif [[ -x $(which vi) ]]
then
    export EDITOR="vi"
fi

export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
