## Relase History

### 10.20.0 [2020-06-28]
* Updated image to `10.21.0-alpine3.11` for LTS version
* Added rsync
* tags: 10.20.0

### 10.15.0 [2018-12-13]
* Updated image to `10.15.3-alpine`, matching nodejs version in Firebase Functions
* tags: 10.15.0; 10.15

### 8.14.0 [2018-12-13]
* Updated image to `8.14.0-alpine`, matching nodejs version in Google App Engine
* Added `openssh-client` dependency
* Added `/bin/execs.sh` script
* Changed the yarn cache directory from `/var/data/yarn` to `/var/cache/yarn`
* tags: 8.14.0; 8.14

### 0.3.0 [2018-10-29]
* Added `python` dependencies 

### 0.2.0 [2018-10-29]
* Added `git` dependecy needed by `web3` package

### 0.1.0 [2018-10-29]
* First version as simple wrapper for `node:8.12-alpine`
