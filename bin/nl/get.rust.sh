#!/bin/bash
set -xe

mkdir -p $HOME/tmp
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs  > $HOME/tmp/rust-install.sh

more $HOME/tmp/rust-install.sh

bash $HOME/tmp/rust-install.sh


PATH=$HOME/.cargo/bin

rustup toolchain add nightly

rustup update

