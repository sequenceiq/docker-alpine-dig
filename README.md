While working with DNS you always need the **dig** tool. Installing dig in various linux 
is always different. The containing package name is:

- debian/ubuntu: dnsutils
- centos: bind-utils
- alpine: n/a

This repo aims 2 target:

- [x] Statically compiled single binary version, to make installation a simple download
- [ ] Create an alpine linux package for dig

## Statically compiled binary

To achive this goal 4 components are used:

- Alpine linux: as it targets static compilation with [musl libc](http://www.musl-libc.org)
- Docker: the easiest way to have a reproducible automated build process
- CircleCI: They provide free continous build env, with docker capability
- Github Releases: the final artifact will be stored as a [versioned Github Release](https://github.com/sequenceiq/docker-alpine-dig/releases/tag/v9.10.2)


### Installation

The one-liner install for all 64 bit linux:
```
curl -L https://github.com/sequenceiq/docker-alpine-dig/releases/download/v9.10.2/dig.tgz|tar -xzv -C /usr/local/bin/
```

## Alpine linux package

It's just scratching my own itch: to learn how to create an Alpine linux package.
It will only happen if I can fit it into a couple of hours effort ...
