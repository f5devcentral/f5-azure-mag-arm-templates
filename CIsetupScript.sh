#!/bin/bash

get_state() {
    git config --global user.email $GITLAB_USER_EMAIL
    git config --global user.name $GITLAB_USER_NAME
    git config --global http.sslVerify false
    git clone $IAC_STATE_REPO_WITH_PASS
    cp iac_state/* ./
    mkdir -p ~/.ssh
    cp id_rsa ~/.ssh/ >> error.log 2>&1 || echo "no rsa key found"
    chmod og-rwx ~/.ssh/id_rsa >> error.log 2>&1 || echo "no rsa key found"
    echo "copied state to current directory $PWD"
    ls
    return 0
}

store_state() {
    ls
    cp *.tfstate iac_state/
    cd iac_state
    ls
    git add *
    git commit -m "updated state file" >> error.log 2>&1 || echo "nothing to commit"
    git push -f >> error.log 2>&1 || echo "push failed"
    echo "updated state file in remote repo"
    cd ..
    return 0
}
