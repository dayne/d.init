#!/bin/bash
# written for my ubuntu boxen
# script to just get stupid out of the way
# chef should take this over when I learn it for real

# get my generic stuff available
source lib/helpers.sh

ubuntu_install 'tmux curl wget feh vim'

agree "install build essentials and compiling stuff?"
if [ $? -eq 0 ]; then
	ubuntu_install "build-essential libreadline6-dev curl zlib1g-dev openssl libssl-dev bison"
	ubuntu_install "libreadline-dev git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev "
	ubuntu_install "sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool"
fi

agree "go ahead and go nuts with rbenv, ruby and tat?"
if [ $? -eq 0 ]; then
	./rbenv
	./ruby
	./tat
fi
