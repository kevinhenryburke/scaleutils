#!/bin/bash
mydir="${0%/*}"
source "$mydir"/user.properties
# config load


sfdx force:package:install --package "04t1n000002aDMvAAM" -k $COREINSTALLATIONPASSWORD --wait 5 --publishwait 5 -s AdminsOnly


# RESULT_JSON=`sfdx force:data:soql:query -t -q "SELECT id FROM SubscriberPackageVersion WHERE Name='$PACKAGENAME'"`
# echo $RESULT_JSON
