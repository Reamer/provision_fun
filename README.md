# provision_fun

# Run Docker-Container with local SSH-Agent

```console
docker run -ti -v $SSH_AUTH_SOCK:/ssh-agent -v $PWD:/root/Work -e SSH_AUTH_SOCK=/ssh-agent provision_fun bash
```
