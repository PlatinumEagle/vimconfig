SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
    }
else
    start_agent;
fi

echo "Done initializing SSH agent."


#Add key(s) to ssh agent (so that password only needs to be provided once for a key duing a session
ssh-add ~/.ssh/id_rsa_robm-sentinelda-com
ssh-add ~/.ssh/id_rsa_mullinsrl

#Configure aliases
alias proj="cd /c/dev/projects"

