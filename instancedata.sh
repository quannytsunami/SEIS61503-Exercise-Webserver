#!/bin/bash

cd /home/ec2-user/scripts
touch metadata.txt
curl -w "\n" "\n" http://169.254.169.254/latest/meta-data/hostname > curl -w "\n" "\n" http://169.254.169.254/latest/meta-data/iam >> curl -w "\n" "\n" http://169.254.169.254/latest/meta-data/security-groups >> metadata.txt
