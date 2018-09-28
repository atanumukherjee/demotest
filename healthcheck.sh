#!/bin/bash
git_install(){
`wget ftp://amdc-linuxrepository-lx01.amdc.mckinsey.com/git/git-1.8.3.rc3.tar.gz`

`tar -xvf git-1.8.3.rc3.tar.gz`

cd /root/git-1.8.3.rc3


********************************************************************************************

echo "Checking Dependencies"

`sleep 5`

zypper in gcc

zypper in zlib

zypper in zlib-devel

echo "********************************************************************************************"
echo "Compiling and installing git"

`sleep 5`

./configure

make

make install


echo "Installation complete"

`sleep 2`

echo "********************************************************************************************"

cd /usr/bin

`ln -s /usr/local/bin/git`

echo "********************************************************************************************"
 echo "Checking git version"

git --version

`sleep 2`

echo "********************************************************************************************"
}



RED='\033[0;41;30m'
STD='\033[0;0;39m'

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
        }

chk_site(){
curlrc_remove(){
                find / -name '.curlrc';
                if rm .curlrc
                then
                        echo ".curlrc is successfully removed";
                else
                        echo "Not present, Already removed";
                fi
                }

rubygems(){
        if curl -s --head  http://www.rubygems.org | grep  "301 Moved Permanently" > /dev/null
        then
                echo "The HTTP server on rubygems.org  is up!"
        else
                echo "The HTTP server on rubygems.org  is down!"
        fi
        }

rubygemglobal(){
                if curl -s --head   http://rubygems.global.ssl.fastly.net | grep  "307 Temporary Redirect" > /dev/null
                then
                                                     echo "The HTTP server on rubygems.global  is up!"
                else
                        echo "The HTTP server on rubygems.global  is down!"
                fi
                }

solar(){
               if curl -s --head  http://ssc-solr.npncomx.mckinsey.com/solr | grep  "200 OK" > /dev/null
        then
                echo "The HTTP server on ssc-solr.npncomx.mckinsey.com  is up!"
        else
                echo "The HTTP server on ssc-solr.npncomx.mckinsey.com  is down!"
        fi
        }

registry(){
        if curl -s --head  http://registry.npmjs.org | grep  "200 OK" > /dev/null
        then
                echo "The HTTP server on registry.npmjs.org  is up!"
        else
                echo "The HTTP server on registry.npmjs.org  is down!"
        fi
        }

nodejs(){
        if curl -s --head  http://nodejs.org | grep  "200 OK" > /dev/null
        then
                echo "The HTTP server on nodejs.org  is up!"
        else
                echo "The HTTP server on nodejs.org  is down!"
                             fi
        }

github(){
         if curl -s --head  https://github.com | grep  "200 Connection established\|200 OK"   > /dev/null
        then
                echo "The HTTP server on github.com  is up!"
        else
                echo "The HTTP server on github.com  is down!"
        fi
        }
        curlrc_remove
        sleep 5
                                          rubygems
        sleep 2
        rubygemglobal
        sleep 2
        solar
        sleep 2
        registry
        sleep 2
        nodejs
        sleep 2
        github
        echo " *********************************************************"
        echo " Now Checking the Routing Table...."
        echo " *********************************************************"
        sleep 4
        route -n
        echo " *********************************************************"
        echo " Now Checking the NIC card...."
        echo " *********************************************************"
        sleep 4
        ifconfig
        sleep 1
        pause

        }
#chk_site
        echo " *********************************************************"
        echo " Now Checking the ports open for Mysql....."
        echo " *********************************************************"

chk_ports(){
        echo "1 . Confidential"
        echo "2 . UnConfidential"
         echo "3 . P360"
        echo "4 . NPN"
        read a
        if [ $a -eq 1 ]
        then
                netcat -v -z -w 5 atldc-sscdb.comx.mckinsey.com 3306
#if [ $? -eq 0 ]
#then
#exit
#else
                                         fi

        if [ $a -eq 2 ]
        then
                netcat -v -z -w 5 atldc-sscdemodb.comx.mckinsey.com  3306
#if [ $? -eq 0 ]
#then
#exit
#else
#echo "connection not open"
#fi
                                                                                                      fi


        if [ $a -eq 3 ]
        then
        netcat -v -z -w 5  atldc-sscp360db.comx.mckinsey.com 3306
#if [ $? -eq 0 ]
#then
#exit
#else
#echo "Connection not open"
#fi
        fi


        if [ $a -eq 4 ]
        then
        netcat -v -z -w 5 ssc-db.npncomx.mckinsey.com  3306
#if [ $? -eq 0 ]
#then
#exit
#else
#echo "Connection not open"
               fi
        pause

        echo " *********************************************************"
        echo " Now Checking the  Ports for Mail Server...."
        echo " *********************************************************"


        if netcat -v -z -w 5 amdc-ext-mx01.mckinsey.com 25
                                                                        then
        echo " Connection is open"
        elif [ $? -eq 0 ]
        then
        exit
        else
        echo "Connection is closed"
        fi
#exit
        pause

        }
#chk_ports

comp_proxy(){
                echo "1 . NPN Server"
                echo "2 . Production"
                echo "3. script to be copied"
                read a
                if [ $a -eq 1 ]
                then


                git clone  git://githuben.intranet.mckinsey.com/Atanu-Mukherjee/mdl_check_list.git
                cd mdl_check_list;
                cp /etc/sysconfig/proxy /etc/sysconfig/proxy_original;
                cp proxy_NPN /etc/sysconfig/proxy

                diff /etc/sysconfig/proxy_original  /etc/sysconfig/proxy| grep '>' |wc -l > file1
                        if cat file1 |grep 0
                        then
                        echo "File was matched"
                        else
                        echo "File was not matched"
                        fi
                fi

        #sleep 4
        cd ..
        rm  -fr mdl_check_list
        #rm ../file1


                                       #rm ../file1


                if [ $a -eq 2 ]
                then

                git clone  git://githuben.intranet.mckinsey.com/Atanu-Mukherjee/mdl_check_list.git
                cd mdl_check_list;
                cp /etc/sysconfig/proxy /etc/sysconfig/proxy_original;
                cp proxy_Prod /etc/sysconfig/proxy

                diff /etc/sysconfig/proxy_original  /etc/sysconfig/proxy| grep '>' |wc -l > file1
                        if cat file1 |grep 0
                        then
                        echo "File was matched"
                        else
                         echo "File was not matched"
                        fi
                fi

        #sleep 4
        cd ..
        rm  -fr mdl_check_list
        #rm ../file1
        #pause

                if [ $a -eq 3 ]
                then
                git clone  git://githuben.intranet.mckinsey.com/Atanu-Mukherjee/mdl_check_list.git
                cd mdl_check_list;
                cp copyscript /usr/local/bin/
                chmod 755 /usr/local/bin/copyscript
                cd ..
                rm -fr mdl_check_list
                fi
                pause
                }



    show_menus() {
                clear
                echo "*********************"
                                                      echo " M A I N - M E N U"
                echo "*********************"
                echo "1. Checking & Comparing the Proxy file"
                echo "2. Checking the URL, Routing Table & NIC"
                echo "3. Checking the Ports Connection"
                echo "4. Installing Git on New box"
                echo "5. Exit"
                }


read_options(){
                local choice
                read -p "Enter choice [ 1 - 5] " choice
                case $choice in
                        1) comp_proxy ;;
                        2) chk_site ;;
                        3) chk_ports ;;
                        4) git_install ;;
                        5) exit 0;;
                        *) echo -e "${RED}Error...${STD}" && sleep 2
                esac
                }

tput clear
                while true
                do
                show_menus
                read_options
                done
#tput clear
