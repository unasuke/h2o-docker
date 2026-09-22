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
- noble (only master)
- resolute (only master)
- bookworm (only master)
- trixie (only master)

### versions
- master

Tagged releases (v2.2.x, v2.3.0-beta1, v2.3.0-beta2) are no longer built. Images
pushed before are kept on the registry.

see also <https://github.com/unasuke/h2o-docker/pkgs/container/h2o-docker>
