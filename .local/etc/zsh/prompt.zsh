autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{green}*%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}*%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git hg

setopt prompt_subst # exetension du prompt
autoload -U colors && colors  # couleurs
autoload -U promptinit
promptinit

# Détection d'un screen
if [[ $STY == "" ]]; then
    term_str=""
else
    screen_name=`echo $STY | cut -d. -f2`
    term_str="%F{yellow}$screen_name%{${reset_color}%} "
fi

computername=$(hostname -s)

if [[ $computername == "" ]]; then
    computername="UNKNOWN"
elif [[ $computername == *"localhost"* ]]; then
    computername="UNKNOWN"
fi

if [ -f "$HOME/.local/etc/computername" ]; then
    computername=$(cat "$HOME/.local/etc/computername")
fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    computername="%F{yellow}►%F{cyan}$computername%F{white}"
fi

# Detection du type de gestionnaire de version
function in_vcs {
  git branch >/dev/null 2>/dev/null && return 0
  hg root >/dev/null 2>/dev/null && return 0
  return -1
}

# prompt
function precmd {
    if [ `id -u` -eq 0 ]; then # if root
        local dircol="%{${fg_no_bold[red]}%}"
        local sign=" #"
    else
        local dircol="%{${fg_no_bold[green]}%}"
        local sign=">"

        if [ `whoami` != "nikita" ] || [ -n "$SUDO_USER" ]; then
            diffuser="%F{magenta}u:`whoami`%F{white} "
        fi
    fi

    # Check if we are in a git or hg directory
    $(in_vcs)
    if  [ "$?" -eq "0" ]
    then
        # Add a red dot if there is untracked files
        if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
            zstyle ':vcs_info:*' formats '%b%c%u'
        } else {
            zstyle ':vcs_info:*' formats '%b%c%u%f%F{red}*%F{cyan}'
        }

        vcs_info
        vcs_str="%F{cyan}[${vcs_info_msg_0_}%F{cyan}]%F{white} "
    else
        vcs_str=""
    fi

    if  [ $VIRTUAL_ENV ]; then
        virtualenv_str="%F{green}(`basename \"$VIRTUAL_ENV\"`) "
    else
        virtualenv_str=""
    fi

    export PS1="${dircol}%}%~%{${reset_color}%}${sign} "
    export RPS1='${diffuser}${virtualenv_str}${vcs_str}%F{white}${term_str}${computername}'
}


watch=notme
export LOGCHECK=60 # Check for login/out every 60 sec
