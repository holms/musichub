# musichub-deploy

This repository contains everything needed for deployment

* [Architecture](#architecture)
* [Local development](#local-development)
* [Commit emoji](#commit-emoji)
* [Contributors](#contributors)

## Architecture 

TODO

### What we use for host:

* Docker-swarm
* Digital ocean
* Docker hub

### What we use for app:

* Pgsql
* Django-rest-framework

## Local development

### Project setup for Mac

* Install Xcode
* Install Xcode command line tools
  Run `xcode-select --install` and click the install button. If you'll have an error pop-up appeared, this means it's already installed
* Install [https://www.macports.org/install.php](Macports)
* Install [https://docs.docker.com/engine/installation/mac/](Docker for Mac)
* Install git and bash from Macports
  ```
  sudo port -v install bash git
  ```
* Checkout this repo

```
  git clone --depth 30 git@github.com:holms/musichub-deploy.git musichub && \
  cd musichub && \
  git clone --depth 30 git@github.com:musichub-frontend.git front && \
  git clone --depth 30 git@github.com:musichub-backend.git back
```
###

First you need to build `backend development base container`. This container has all pre-install dependencies for `backend development container`. This is done to save your time when re-building `backend development container`, so you'll just reinstall only `required.txt` and nothing else.

```
make back-build-base
```

### Cleanup

#### Destroy everything

To remove volumes, containers, images:
```
make destroy
```

#### Kill containers

```
make kill
```

## Commit emoji

This helps to distinct what developer is working with, without understanding commit message

Commit Type | Emoji
----------  | -------------
Solved! | :tada: `:tada:`
Version Tag | :bookmark: `:bookmark:`
New Features | :sparkles: `:sparkles:`
Bugfix | :bug: `:bug:`
Metadata | :card_index: `:card_index:`
Documentation | :books: `:books:`
Internationalization | :globe_with_meridians: `:globe_with_meridians:`
Performance | :racehorse: `:racehorse:`
Cosmetic fixes | :lipstick: `:lipstick:`
Refactoring | :wrench: `:wrench:`
Tests | :rotating_light: `:rotating_light:`
Deprecation | :poop: `:poop:`
Work In Progress (WIP) | :construction: `:construction:`
Cleanup | :toilet: `:toilet:`
Other | [Be creative](http://www.emoji-cheat-sheet.com/)

## Contributors
Name             | Email          |
---------------- | -------------- |
Roman Gorodeckij | holms@holms.lt |
