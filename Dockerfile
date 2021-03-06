FROM rust:1.34.1 as builder

RUN cargo install diesel_cli --no-default-features --features mysql
RUN mkdir -p /out && cp /root/.cargo/bin/diesel /out/

FROM alpine:latest
COPY --from=builder /out/diesel /bin/

RUN apk add --no-cache ca-certificates

CMD diesel

