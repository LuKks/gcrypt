# gcrypt

Encrypted git repositories for privacy made easy

![](https://img.shields.io/npm/v/gcrypt.svg) ![](https://img.shields.io/npm/dt/gcrypt.svg) ![](https://img.shields.io/github/license/LuKks/gcrypt.svg)

```sh
# Create a new remote encrypted repository 
gcrypt init git@github.com:user/repo.git

# Encrypt repository already on GitHub
gcrypt encrypt git@github.com:user/repo.git

# Clone encrypted repository
gcrypt clone git@github.com:user/repo.git
```

## Requirements
```sh
apt install git-remote-gcrypt
```

## Install
```sh
npm i -g LuKks/gcrypt
```

## Description
Makes easy to work with fully encrypted git repositories.\
It uses [spwhitton/git-remote-gcrypt](https://github.com/spwhitton/git-remote-gcrypt), so check it out.\
The unique disadvantage that I noticed pushing is a bit slow but not big deal.\
Using your GPG key for encryption, if you have multiple keys read [git-remote-gcrypt](https://github.com/spwhitton/git-remote-gcrypt).

## Examples
#### Create a new encrypted repository
Create an empty repository on GitHub then:
```sh
gcrypt init git@github.com:user/repo.git
# or
gcrypt init git@github.com:user/repo.git ~/Desktop/my-encrypted-repo
```

#### Encrypt repository already on GitHub
```sh
gcrypt encrypt git@github.com:user/repo.git
```
Take caution, it will erase the entire repository (branches, tags, etc),\
just keeping a single commit/branch where would be all encrypted togheter.

#### Clone encrypted repository
```sh
gcrypt clone git@github.com:user/repo.git
# or
gcrypt clone git@github.com:user/repo.git ~/Desktop/my-encrypted-repo
```

## Notes
#### Multiple GPG keys
If you have multiple GPG keys, set which would be used for encryption.

Check your GPG keys list:
```sh
gpg --list-secret-keys --keyid-format LONG
```

And set it:
```sh
git config --global --add gcrypt.participants "A1234B1234C1234D"
```

## Useful links
https://github.com/spwhitton/git-remote-gcrypt/ \
https://www.alwaysrightinstitute.com/gcrypt/ \
https://caolan.uk/articles/encrypted-git-repositories/

## License
Code released under the [MIT License](https://github.com/LuKks/gcrypt/blob/master/LICENSE).
