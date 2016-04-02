#!/usr/bin/env zsh

if [ -d $HOME/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH;
fi

if [ -d /sbin ]; then
    export PATH=$PATH:/sbin;
fi

if [ -d $HOME/.pyenv/bin ]; then
    export PATH=$HOME/.pyenv/bin:$PATH;
fi
