#!/bin/bash -l
source lib/helpers.sh

RUBY_VER="2.0.0-p247"

got_command 'ruby'
if [ $? -eq 0 ]; then
  yak "got ruby already - checking against $RUBY_VER target"
  r_version=`ruby --version | awk '{ print $2}'`
  existing_version=${r_version/p/-p}
  if [ $existing_version == "$RUBY_VER" ]; then 
    boom "you have the version of ruby in your path I would install - go away"
  else
    echo "your existing ruby $existing_version not my target version $RUBY_VER"
    echo "moving forward"
  fi
fi

## TODO check for fedora/redhat and use yum lines instead
ubuntu_install "build-essential libreadline6-dev curl zlib1g-dev openssl libssl-dev bison"
ubuntu_install "libreadline-dev git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev "
ubuntu_install "sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool"

got_command 'rvm'
if [ $? -eq 0 ]; then
  boom "RVM found.. I'm expecting rbenv -- rvm implode and setup rbenv"
else
  echo "rvm not found.. moving on with rbenv"
fi

yak "PATH=$PATH"

got_command 'rbenv'
if [ $? -eq 0 ]; then
  yak "installing ruby-$RUBY_VER"
  rbenv install $RUBY_VER
  rbenv rehash
  rbenv global $RUBY_VER
else
  boom "rbenv not found .. failed to install ruby $RUBY_VER"
fi
