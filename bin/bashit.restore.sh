#!/bin/bash

if ! typeset -F bash-it > /dev/null 2> /dev/null; then
    echo this must be sourced from the shell.
    echo . $0
    exit 1
fi

# Restore my bash-it plugins, aliases, completions.

for a in general
do
    bash-it enable alias $a
done


for p in base
do
    bash-it enable plugin $p
done

for c in awscli bash-it consul docker git go kubectl \
		makefile packer pip pip3 pipenv ssh system terraform \
		tmux vagrant vault
do
    bash-it enable completion $c
done
