FROM golang:1.16.0-alpine3.13 AS builder

WORKDIR /app
COPY . /app
RUN go build


FROM alpine:3.9

RUN apk add --no-cache -U \
  ca-certificates

COPY --from=builder /app/saml-auth-proxy /usr/bin
ENTRYPOINT ["/usr/bin/saml-auth-proxy"]