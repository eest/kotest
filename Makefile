ARCH=		$(shell arch)
TEST_ARCH=
OUTPUT=kotest-out

run_tests=	yes
ifdef TEST_ARCH
ifneq "$(TEST_ARCH)" "$(ARCH)"
run_tests=	no
endif
endif

build: export GOSUMDB=sum.golang.org
build: export GOTOOLCHAIN=auto
build:
	go mod download
ifeq "$(run_tests)" "yes"
	go vet ./...
	go test -race ./...
endif
	CGO_ENABLED=0 go build -ldflags "-X main.version=$(cat VERSION || echo dev)" -o $(OUTPUT)
