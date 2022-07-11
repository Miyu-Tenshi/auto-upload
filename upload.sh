#!/usr/bin/bash

_1="\e[34m";_2="\e[32m";_3="\e[36m";_4="\e[31m";_5="\e[35m";_6="\e[33m";_7="\e[37m";_8="\e[90m";_9="\e[94m";_0="\e[30m";_a="\e[92m";_b="\e[94m";_c="\e[91m";_d="\e[95m";_e="\e[93m";_f="\e[97m";_l="\e[1;m";_s="\e[2;m";_o="\e[3;m";_n="\e[4;m";_bf="\e[6;m";_br="\e[7;m";_m="\e[9;m";_r="\e[0m";_cl="\e[2K";_rl="\r";

uploadRepo() {
    
    declare -a GITDATA;
    declare -r GIT_ENV=".github/.env";

    getData() {
        ! [ -f "$GIT_ENV" ] && echo -e "${_l}${_c}please \"upload init\" first" && exit 1;
        GITDATA=($(cat $GIT_ENV | cut -d "=" -f 2) "$(IFS= read -p "$(printf $_3)COMMIT MESSAGE$(printf $_f) :$(printf $_8) " && echo ${REPLY[@]})")
    }
    push() {
        local ERR=${1:-0}
        git push --set-upstream -f origin ${GITDATA[3]}
        if [ $? != 0 ] && [ $ERR == 0 ]; then 
            eval "$(ssh-agent -s)" &> /dev/null && ssh-add ~/.ssh/${GITDATA[0]} 2> /dev/null;
            [ $? != 0 ] && echo -en "$_cl$_l$_5[${_c}TIPS${_5}]$_f :$_3 if repository is private will must set ssh filename is username github$_rl" && exit 1;
            push 1;
        fi
        if [ $? != 0 ] && [ $ERR == 1 ]; then 
            echo -en "$_cl$_l$_5[${_c}FAILED${_5}]$_f :$_c please check your name, email, url and repository is private?$_rl";
            exit 1;
        fi
        echo -en "$_cl$_l$_5[${_2}INFO$_5]$_f :$_a upload to github has finished$_rl";
    }
    commit() {
        git add . &> /dev/null;
        git config --local user.name ${GITDATA[0]};
        git config --local user.email ${GITDATA[1]};
        git commit --author="${GITDATA[0]} <${GITDATA[1]}>" -m "${GITDATA[4]:-no comment}" &> /dev/null;
        echo -en "$_cl$_l$_5[${_2}INFO$_5]$_f :$_6 commiting$_rl";
        push;
    }
    initial() {
        GITDATA=(GIT_USERNAME GIT_EMAIL GIT_URL GIT_BRANCH);
        declare -ra GIT_IGNORE=(.github .env .gitignore);

        rm -rf $(dirname $GIT_ENV) .gitignore .git && mkdir $(dirname $GIT_ENV) && touch $GIT_ENV;

        for i in ${GIT_IGNORE[@]}; do echo $i >> .gitignore; done;
        for (( i=0; i<${#GITDATA[@]}; i++ )); do
            echo -en "$_3${GITDATA[$i]:4}$_f :$_8 "; read ${GITDATA[$i]};
            eval "local value=\$${GITDATA[$i]}";
            echo "${GITDATA[$i]}=$value" >> $GIT_ENV;
        done

        getData;
        git init -q;
        git branch -M ${GITDATA[3]}
        git remote add origin ${GITDATA[2]};
        commit;
    }
    optional() {
        case $1 in
            "") getData; commit;;
            "-i" | "init") initial;;
            "-n");;
        esac
    }
    optional $1;
}
uploadRepo $1