fpath=(~/.cache/zsh_complete $fpath)
autoload -U compinit
compinit -d ~/.cache/zcompdump -u
autoload -U bashcompinit && bashcompinit

source ~/.local/etc/zsh/path.zsh
source ~/.local/etc/zsh/exports.zsh

source ~/.local/etc/zsh/aliases.zsh

source ~/.local/etc/zsh/opt.zsh

source ~/.local/etc/zsh/completion.zsh

source ~/.local/etc/zsh/prompt.zsh
source ~/.local/etc/zsh/editing.zsh

source ~/.local/etc/zsh/bgnotify.plugin.zsh
