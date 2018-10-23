#!/bin/bash
set -x
gitoperation()
{
DAYOFWEEK=$(date +"%u")
if [ "$DAYOFWEEK" == 2 ]; then
{
Date=`date +%Y-%m-%d`
BranchName='Splunk_Release_'$Date
#git branch
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p');
echo "My current Branch is" $branch

if [ "$branch" == "$BranchName" ]; then
        echo "Already in Current branch"
elif [ "$branch" != "$BranchName" ]
then
   echo "No Match found"
else
        git checkout Splunk_Release_$Date
        echo "switched"
fi
}
else
{
echo "This is not Monday"
}
fi
}
gitoperation
