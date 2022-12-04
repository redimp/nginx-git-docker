# nginx-git-docker

Serve git repositories via nginx in a docker container.

## Usage

```bash
# create an empty repository
mkdir -p repositories/test.git
git init --bare repositories/test.git --shared
git config --file repositories/test.git/config http.receivepack true
```

[modeline]: # ( vim: set fenc=utf-8 spell spl=en sts=4 et tw=72: )
