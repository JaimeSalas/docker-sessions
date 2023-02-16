FROM golang:latest AS builder 

WORKDIR /app

COPY . .

RUN go env -w GO111MODULE=off && CG0_ENABLED=0 GOOS=linux go build .

FROM ubuntu:20.04 

RUN apt update && apt install -y iputils-ping

WORKDIR /app

COPY --from=builder /app .

ENTRYPOINT ["./app"]

# FROM golang:latest

# WORKDIR /app 

# COPY . .

# RUN go env -w GO111MODULE=off && CG0_ENABLED=0 GOOS=linux go build .

# ENTRYPOINT [ "./app" ]
