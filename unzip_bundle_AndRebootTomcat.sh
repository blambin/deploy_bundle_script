#!/bin/sh

config_file=./bundle_upload.conf
. ${config_file}

pkill -9f java &&
unzip -o ${project_dir}.zip  &&

../bin/startup.sh  

