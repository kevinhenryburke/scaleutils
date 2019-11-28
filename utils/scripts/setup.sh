#!/bin/bash
mydir="${0%/*}"
source "$mydir"/user.properties
sfdx force:org:delete -u $DEFAULTSCRATCH
sfdx force:org:create -f "$mydir"/../config/project-scratch-def.json -a $DEFAULTSCRATCH  --setdefaultusername -d 30
sfdx force:source:push -u $DEFAULTSCRATCH

export SFDX_DOMAIN_RETRY=0
sfdx force:org:open -u $DEFAULTSCRATCH
