#!/bin/bash
source ../lib/helpers.sh

require_command "brew"
require_command "gem"
run_install_unless "brew install redis", "redis-server"
run_install_unless "gem install lunchy", "lunchy"
got_command rbenv
if [[ $? -eq 0 ]]; then rbenv rehash; fi


VER=`redis-server -v | ruby -e 'puts STDIN.read.split[2].split("=")[1]'`
plist_source=/usr/local/Cellar/redis/$VER/homebrew.mxcl.redis.plist
agents_dir=$HOME/Library/LaunchAgents
ensure_mkdir $agents_dir
cp_file $plist_source $agents_dir
launchctl load -w $agents_dir/homebrew.mxcl.redis.plist

# if you've upgraded then you'll need to :
# launchctl unload -w $HOME/Library/LaunchAgents/homebrew.mxcl.redis.plist
# and then put then re-run this to recopy and register latest version
