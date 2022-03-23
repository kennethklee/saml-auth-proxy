FROM golang:1.17.8-alpine3.15 AS builder

WORKDIR /app
COPY . /app
RUN go build


FROM alpine:3.15

RUN apk add --no-cache -U \
  ca-certificates

COPY --from=builder /app/saml-auth-proxy /usr/bin
ENTRYPOINT ["/usr/bin/saml-auth-proxy"]