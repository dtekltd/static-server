FROM debian:bullseye AS certs

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    update-ca-certificates

COPY server /server

# Use 'scratch' image for super-mini build.
FROM scratch AS prod

COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=certs /server /server

ENTRYPOINT ["/server"]