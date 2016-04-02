
# menu activable avec les flèches
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

zstyle ':completion:*:descriptions' format '%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo %d found%b'

# compléter même si la commande n'est pas dans le path (ex sudo ifconfig)
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# eviter de reporposer un argument déjà utilisé
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

zstyle ':completion:*:cd:*' ignore-parents parent pwd tag-order local-directories path-directories

# cache
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' cache-path ~/.cache/zsh_completions

# Auto-complétion non sensible à la casse
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'

#correction des erreurs
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:approximate:*' max-errors 1 numeric

