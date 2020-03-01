main() {
    local args=( $@ )
    local core=${args[0]}
    local arg=${args[1]}
    export __args__=${args[@]:2}

    local dpath=$( dirname ${BASH_SOURCE:-${(%):-%x}})/../../..
    local adpath=$( cd "$dpath" && pwd )
    local path=cmd/$arg/main.sh
    if [ "$core" == "." ]; then path=core/cmd/$arg/main.sh; fi
    export __APATH__=$adpath/$path
    export __ADPATH__=$( dirname "$__APATH__" )

    local file
    for file in cmd.sh .gitignore
    do cp "$adpath/core/$file" "$adpath"
    done
    local dir 
    for dir in data cmd env tools tools/src
    do
        if [ ! -d $adpath/$dir ]; then mkdir $adpath/$dir; fi
        if [ ! -f $adpath/$dir/.gitkeep ]; then touch $adpath/$dir/.gitkeep; fi
    done
    if [ ! -f $adpath/env/cmd ]; then echo cmd > $adpath/env/cmd; fi
    local name=$( cat "$adpath"/env/CMD 2> /dev/null || : )
    if [ "$name" != "" ]
    then eval "$name() { . $adpath/cmd.sh \$@; } && export -f $name"
    fi
}
main $1