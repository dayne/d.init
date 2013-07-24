#!/bin/bash

function boom() { 
  echo "############-------------------| BOOM |-------------------------###########"
  echo ${1}
  echo "############-------------------| BOOM |-------------------------###########"
  sleep 1
  exit 1
}


function yak() {
  echo "###########################################################################"
  echo ${1} 
  #echo "# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #"
  sleep 1 
}

function ubuntu_install() {
  yak "ubuntu_install $1"
  dpkg -l $1 > /dev/null 2>&1
  if [ $? -eq 1 ]; then
    yak "#> sudo apt-get install $1"
    sleep 0.5 
    sudo apt-get install $1
  else
    echo "#> already got the packages ... skipping install "
  fi
}

function got_command() {
  which $1 2> /dev/null
  if [ $? -eq 1 ]; then
    echo "#>> missing command : $1"
    return 1
  else
    echo "#>> command found: $1"
    return 0
  fi
}

function require_command() {
  which $1 > /dev/null 2>&1
  if [ $? -eq 1 ]; then
    boom "required command not found: $1"
  fi
}

function agree() {
  while( true ); do
    echo -n "$1 : (y/n) : "
    read answer
    if [ $answer == "n" ]; then
      return 1; 
    elif [ $answer == 'y' ]; then
      return 0;
    fi
    echo "invalid answer - provide a 'y' or a 'n'"
    sleep 0.5
  done
}

function run() {
  echo "###########################################################################"
  echo "# >>>>> # $1 "
  sleep 0.4
  $1
}
