# provision_fun

# Run Docker-Container with local SSH-Agent

```console
docker run -ti -v $SSH_AUTH_SOCK:/ssh-agent -v $pwd:/root/Work provision_fun bash
# Inside Docker Container
export SSH_AUTH_SOCK=/ssh-agent
