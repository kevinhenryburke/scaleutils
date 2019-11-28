#!/bin/bash
mydir="${0%/*}"
source "$mydir"/user.properties
sfdx force:package:version:create --package $PACKAGENAME -d force-app --definitionfile ../config/project-scratch-def.json --wait 10 -k $COREINSTALLATIONPASSWORD