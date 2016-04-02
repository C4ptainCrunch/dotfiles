# emacs-like keybindings
bindkey -e
# correct ^W binding
export WORDCHARS=${WORDCHARS:s,/,,}

#replace nbsp by normal spaces
function space {
    LBUFFER+=" "
    zle self-insert
}
zle -N space

#Only past commands beginning with the current input are shown
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# bind the delete key to delete-char
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
