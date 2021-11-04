FROM authexec/docker-sgx-tools as builder

FROM debian:buster-slim

RUN useradd -ms /bin/bash enclave
COPY --from=builder /usr/lib/x86_64-linux-gnu/libssl* /usr/lib/x86_64-linux-gnu/
COPY --from=builder /usr/lib/x86_64-linux-gnu/libcrypto* /usr/lib/x86_64-linux-gnu/
COPY --from=builder /usr/local/cargo/bin/ftxsgx-runner /bin/ftxsgx-runner

USER enclave
