#/bin/bash
set -x
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

checking_brach()
		{
			ssh -o "StrictHostKeyChecking no" -i ~/.ssh/ssh_splunklive_rsa4k_201702  -l splunk ulvlfimw02 "cd /opt/splunk/splunk/etc;$(typeset -f gitoperation);gitoperation"
		}

run_cluster_bundle()
		{
			ssh -o "StrictHostKeyChecking no" -i ~/.ssh/ssh_splunklive_rsa4k_201702  -l splunk ulvlfimw02 " date; /opt/splunk/splunk/bin/splunk apply shcluster-bundle -target https://ulvlfisj01:8089  -auth cogatamukherjee:Wednesday123; date"
		}

restart_shbundle()
        {
            ssh -o "StrictHostKeyChecking no" -i ~/.ssh/ssh_splunklive_rsa4k_201702  -l splunk ulvlfisj01 "cd /opt/splunk/splunk/bin; ./splunk rolling-restart shcluster-members"
        }

exe_indexerbundle()
        {
            ssh -o "StrictHostKeyChecking no" -i ~/.ssh/ssh_splunklive_rsa4k_201702  -l splunk ulvlfimw02 "date; /opt/splunk/splunk/bin/splunk apply cluster-bundle; date"
        }
restart_peers
        {
            ssh -o "StrictHostKeyChecking no" -i ~/.ssh/ssh_splunklive_rsa4k_201702  -l splunk ulvlfimw02 "/opt/splunk/splunk/bin/splunk rolling-restart cluster-peers"
        }


show_menus() {
                clear
                echo "*********************"
                                                      echo " M A I N - M E N U"
                echo "*********************"
                echo "1. Checking the correct Release branch"
                echo "2. Run the Search head bundle on mw02"
                echo "3. Restart the bundle on Searchhead sj01"
                echo "4. Execute the bundle for Indexer on mw02"
		echo "5. Restart the peers on mw02"
                echo "6. Exit"
                }


read_options(){
                #local choice
                read -p "Enter choice [ 1 - 6] " choice
                case $choice in
                        1) checking_branch ;;
                        2) run_cluster_bundle ;;
                        3) restart_shbundle ;;
                        4) exe_indexerbundle ;;
			            5) restart_peers;;
                        6) exit 0;;
                        *) echo -e "${RED}Error...${STD}" && sleep 2
                esac
                }

tput clear
                while true
                do
                show_menus
                read_options
                done

