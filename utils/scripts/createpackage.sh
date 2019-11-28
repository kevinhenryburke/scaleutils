#!/bin/bash
mydir="${0%/*}"
source "$mydir"/user.properties
sfdx force:package:create --name $PACKAGENAME --description $PACKAGENAME --packagetype Unlocked -r force-app
