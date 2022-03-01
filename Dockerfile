FROM golang:1.17-alpine

RUN apk add --no-cache make git openssh bash
        
COPY . .

ENV CGO_ENABLED=0 
RUN make install-tools