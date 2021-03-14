#!/bin/bash
# assign variables 

ACTION=${1:-launch}
version=1.0.0

function configure_setup() {

sudo yum update -y
sudo amazon-linux-extras install nginx1.12 -y
sudo chkconfig nginx on 
sudo aws s3 cp s3://quannytsunami-assignment-webserver/index.html /usr/share/nginx/html/index.html
sudo service nginx start
}

function remove() {

sudo nginx -s stop
cd /usr/share/nginx/html/
rm /usr/share/nginx/html/*
sudo yum remove nginx -y
}

function show_version(){

cat << EOF
$version
EOF
}
function display_help() {

cat << EOF
Usage: ${0} {-h|--help|-v|--version} <filename>
OPTIONS:
	-h | --help	Display the command help
	-v | --version	Display the version
Examples:
	Display help:
		$ ${0} -h
	Display version:
		$ ${0} -v
EOF
}

if [ -z "$1" ]
	then
		configure_setup
else
	case "$ACTION" in
		-h|--help)
			display_help
			;;
		-r|--remove)
			remove
			;;
		-v|--version)
			show_version
			;;
		*)
		echo "Usage ${0} {-c|-h|-v}"
		exit 1
	esac
fi
