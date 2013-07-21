#!/bin/bash
# written for my ubuntu boxen
# script to just get stupid out of the way
# chef should take this over when I learn it for real

# get my generic stuff available
source lib/helpers.sh

ubuntu_install "build-essential libreadline6-dev curl zlib1g-dev openssl libssl-dev bison"
ubuntu_install "libreadline-dev git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev "
ubuntu_install "sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool"

ubuntu_install 'tmux curl wget feh'

./rbenv
./ruby
./tat
