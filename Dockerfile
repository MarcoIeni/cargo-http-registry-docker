FROM rust:1-bullseye AS builder

WORKDIR /app

RUN cargo install cargo-http-registry --locked --root .

FROM debian:bullseye-slim as runner

WORKDIR /app

COPY --from=builder /app/bin/cargo-http-registry /usr/local/bin
ENTRYPOINT ["cargo-http-registry"]
