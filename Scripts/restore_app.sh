#!/bin/bash
#|---/ /+-----------------------------+---/ /|#
#|--/ /-| Script to configure my apps |--/ /-|#
#|-/ /--| Prasanth Rangan             |-/ /--|#
#|/ /---+-----------------------------+/ /---|#

source global_fn.sh
if [ $? -ne 0 ] ; then
    echo "Error: unable to source global_fn.sh, please execute from $(dirname $(realpath $0))..."
    exit 1
fi

# firefox
if pkg_installed firefox
    then
    firefox &
    sleep 3
    killall firefox

    FoxRel=`ls -l ~/.mozilla/firefox/ | grep .default-release | awk '{print $NF}'`
    if [ `echo $FoxRel | wc -w` -eq 1 ]
        then
        tar -xzf ${CloneDir}/Source/arcs/Firefox_UserConfig.tar.gz -C ~/.mozilla/firefox/${FoxRel}/
    else
        echo "ERROR: Please cleanup Firefox default-release directories"
    fi
fi

