set -x
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
