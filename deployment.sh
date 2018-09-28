#/bin/bash
gitoperation()
{
Date=`date +%Y-%m-%d`
BranchName='Splunk_Release_'$Date
#git branch
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p');
echo "My current Branch is" $branch

if [ "$branch" == "$BranchName" ]; then
echo "Already in Current branch"
else
git checkout Splunk_Release_$Date
echo "switched"
fi
git pull
git diff master
}

ssh -o "StrictHostKeyChecking no" -i ~/.ssh/ssh_splunklive_rsa4k_201702  -l splunk ulvlfimw02 "cd /opt/splunk/splunk/etc;$(typeset -f gitoperation);gitoperation"

ssh -o "StrictHostKeyChecking no" -i ~/.ssh/ssh_splunklive_rsa4k_201702  -l splunk ulvlfisj01 " date; /opt/splunk/splunk/bin/splunk show shcluster-status -auth cogatamukherjee:Wednesday123; date"