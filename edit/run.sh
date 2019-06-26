#!/bin/bash
 
var=`dpkg --get-selections | grep libjasper1`     #um exemplo simples
var2=`dpkg --get-selections | grep libjasper-dev`
var3=`dpkg --get-selections | grep libdc1394-22`
var4=`dpkg --get-selections | grep execstack`

bool="a"


if [ -z "$var" ]
then
    echo "libjasper not found"
    bool=""
fi

if [ -z "$var2" ]
then
    echo "libjasper-dev not found"
    bool=""
fi

if [ -z "$bool" ]
then
    echo "Instalando Pacotes"
    if sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main" 
    then    
        if sudo apt update 
        then
            if sudo apt-get install libjasper1 libjasper-dev -y 
            then
                echo "libjasper e libjasperdev instalados com sucesso."
            else
                echo "libjasper e libjasperdev não foram instalados."
            fi
        fi
    fi
fi

if [ -z "$var3" ]
then
    if sudo apt-get install libdc1394-22 -y 
    then
        echo "libdc1394-22 instalado com sucesso."
    else
        echo "libdc1394-22 instalado com sucesso."
    fi
fi

if [ -z "$var4" ]
then
    if sudo apt-get install execstack -y 
    then 
        sudo execstack -c ./lib/libopencv_java400.so
    fi 
    
fi

cd dist
java -Djava.library.path=../lib -jar Projeto.jar

