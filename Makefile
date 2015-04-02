NAME=dig
VERSION=9.10.2

build:
	mkdir -p build
	docker build -t sequenceiq/alpine-dig:$(VERSION) .
	docker run sequenceiq/alpine-dig:$(VERSION) cat /usr/bin/dig > build/dig

release:
	rm -rf release && mkdir release
	go get github.com/progrium/gh-release/...
	cp build/* release
	gh-release create sequenceiq/docker-alpine-dig $(VERSION)

circleci:
	rm ~/.gitconfig

.PHONY: build release
