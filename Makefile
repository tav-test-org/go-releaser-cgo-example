PACKAGE_NAME          := github.com/tav-test-org/go-releaser-cgo-example
GOLANG_CROSS_VERSION  ?= v1.17.6

relase:
	docker run \
		--rm \
		--privileged \
		-e CGO_ENABLED=1 \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v `pwd`:/go/src/${PACKAGE_NAME} \
		-v `pwd`/sysroot:/sysroot \
		-w /go/src/${PACKAGE_NAME} \
		goreleaser/goreleaser-cross:${GOLANG_CROSS_VERSION} \
		release --rm-dist