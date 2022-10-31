MODULE = $(shell go list -m)
SERVER_NAME = http-proxy-server

.PHONY: generate build test lint build-docker compose compose-down migrate
generate:
	go generate ./...

build: # build a server
	go build -a -o $(SERVER_NAME) $(MODULE)/cmd/server

test:
	go clean -testcache
	go test ./... -v

server:
	go run $(MODULE)/cmd