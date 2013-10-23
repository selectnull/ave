#!/bin/bash

function ave {
    activate_script=bin/activate
    venvs_dir=~/.venvs
    current_dir=$1

    # if ave is called without arguments, then assume current directory
    if [ -z $current_dir ]
    then
        current_dir=`pwd`
    fi

    if [ -e $current_dir/$activate_script ]
    then
        # if bin/activate exists, source it
        source $current_dir/$activate_script
    elif [ -e $venvs_dir/`basename $current_dir`/$activate_script ]
    then
        # if there is virtual environment inside ~/venvs_dir, source it
        source $venvs_dir/`basename $current_dir`/$activate_script 
    else
        parent_dir=${current_dir%/*}
        # stop if parent directory is not owned by me
        if [ ! -O $parent_dir ]; then return; fi
        # call ave for parent directory
        ave $parent_dir
    fi
}

