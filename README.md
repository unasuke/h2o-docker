# H2O docker image
[![build](https://github.com/unasuke/h2o-docker/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/unasuke/h2o-docker/actions/workflows/build.yml)
[![scheduled build](https://github.com/unasuke/h2o-docker/actions/workflows/scheduled.yml/badge.svg?branch=main)](https://github.com/unasuke/h2o-docker/actions/workflows/scheduled.yml)

## how to use
```shell
$ docker run -it --rm -p 8080:8080 --volume foo:bar ghcr.io/unasuke/h2o-docker:jammy-master h2o -c h2o.conf # with volume mount and pass config file
```

## images
- `ghcr.io/unasuke/h2o-docker:<distro>-<version>`

### distributions
- bionic
- focal
- jammy (only master)
- buster
- bullseye

### versions
- v2.2.0
- v2.2.1
- v2.2.2
- v2.2.3
- v2.2.4
- v2.2.5
- v2.3.0-beta1
- v2.2.6
- v2.3.0-beta2
- master

see also <https://github.com/unasuke/h2o-docker/pkgs/container/h2o-docker>
