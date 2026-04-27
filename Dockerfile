# 使用官方 builder 编译带插件的 Caddy
FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

# 最终镜像
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy