FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y stress-ng && rm -rf /var/lib/apt/lists/*

COPY a.out .

RUN chmod +x /a.out

CMD ["/a.out"]
