# ave Activates Virtual Environment

function ave {
    activate_script=bin/activate
    venvs_dir=$WORKON_HOME
    current_dir=$1

    # if ave is called without arguments, then assume current directory
    if [ -z "$current_dir" ]
    then
        current_dir=$(pwd)
    fi

    if [ -e "$current_dir/$activate_script" ]
    then
        # if bin/activate exists, source it
        source "$current_dir/$activate_script"
        # cd to project directory if it's source controled
        [[ -d "$current_dir/.git" ]] || [[ -d "$current_dir/.hg" ]] || [[ -d "$current_dir/.svn" ]] && cd "$current_dir"
    elif [ -e "$venvs_dir/$(basename "$current_dir")/$activate_script" ]
    then
        # if there is virtual environment inside WORKON_HOME, source it
        source "$venvs_dir/$(basename "$current_dir")/$activate_script"
        # cd to project directory if it's source controled
        [[ -d "$current_dir/.git" ]] || [[ -d "$current_dir/.hg" ]] || [[ -d "$current_dir/.svn" ]] && cd "$current_dir"
    else
        parent_dir="$(dirname "$current_dir")"
        # stop if parent directory is one from what we called ave from
        if [ "$parent_dir" == "." ] || [ "$parent_dir" == "$current_dir" ]; then return; fi
        # call ave for parent directory
        ave "$parent_dir"
    fi
}
