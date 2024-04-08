FROM golang:1.22-alpine

WORKDIR /app

COPY go.mod .
COPY main.go .

# install dlv with go install
RUN CGO_ENABLED=0 go install -ldflags "-s -w -extldflags '-static'" github.com/go-delve/delve/cmd/dlv@latest
# build go app binary without some optimization to prevent debugging errors
RUN CGO_ENABLED=0 go build -gcflags "all=-N -l" -o debug-exec ./main.go
RUN chmod +x debug-exec

# expose port 4000 debug to listen
EXPOSE 4000

# exec go app binary with dlv listen in exposed port 4000
CMD [ "/go/bin/dlv", "--listen=:4000", "--headless=true", "--log=true", "--accept-multiclient", "--api-version=2", "exec", "/app/debug-exec" ]
