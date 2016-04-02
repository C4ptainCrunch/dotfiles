setopt share_history            # all zsh sessions share the same history files
setopt append_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt histignoredups

setopt nocheckjobs              # don't warn me about bg processes when exiting
setopt nohup                    # and don't kill them, either

setopt recexact                 # recognise exact, ambiguous matches
setopt transient_rprompt
setopt completealiases

setopt correct                  # autocorrect
unsetopt correctall             # auto-corret


unsetopt beep                   # No beep
unsetopt hist_beep              # No beep
unsetopt list_beep              # No beep
