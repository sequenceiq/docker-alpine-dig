NAME=dig
VERSION=9.10.2

build:
	mkdir -p build
	docker build -t sequenceiq/alpine-dig:$(VERSION) -f Dockerfile .
	docker run --rm sequenceiq/alpine-dig:9.10.2 cat /usr/bin/dig > build/dig

release:
	rm -rf release && mkdir release
	go get github.com/progrium/gh-release/...
	cp build/* release
	gh-release create sequenceiq/$(NAME) $(VERSION) \
		$(shell git rev-parse --abbrev-ref HEAD) $(VERSION)

circleci:
	rm ~/.gitconfig

.PHONY: build release
