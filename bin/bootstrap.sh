#!/usr/bin/env bash

if [ ! -f /etc/apt/mirrors.sohu.com ]; then
    sed -i 's/us.archive.ubuntu.com/mirrors.sohu.com/' /etc/apt/sources.list
    apt-get update
    touch /etc/apt/mirrors.sohu.com
fi

if [ ! -h /home/vagrant/workspace ]; then
	ln -s /vagrant/workspace /home/vagrant/workspace 
fi

#VG_RVM_PATH=`which rvm`
#if [ -f $VG_RVM_PATH ]; then
#	rvm use 1.9.3
#fi
