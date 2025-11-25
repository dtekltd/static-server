FROM debian:bullseye AS certs

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    update-ca-certificates

COPY static-server /static-server

# Use 'scratch' image for super-mini build.
FROM scratch AS prod

COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=certs /static-server /static-server

ENTRYPOINT ["/static-server"]
CMD ["/static"]
