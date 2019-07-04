#!/bin/bash

for i in {libdc1394-22,libjasper1,libjasper-dev,libavcodec57,libavformat57,libswscale4,execstack};
 do
   var=`dpkg --get-selections | grep $i`

   if [ -z "$var" ]
	then
	    echo "Install Packages Needed"
	    if sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main" 
	    then    
		if sudo apt update 
		then
		    if sudo apt-get install libjasper1 libdc1394-22 libjasper-dev libavcodec57 libavformat57 libswscale4 -y 
		    then
			echo ""
		        echo "Packages successfully installed."
			
		    else
		        echo "Packages have not been installed."
			return
		    fi
		fi
	    fi
	    break
		sudo execstack -c ./lib/libopencv_java400.so
	fi
 done

cd dist
java -Djava.library.path=../lib -jar Projeto.jar

