# caddy-cloudflare
Build an image with Cloudflare plugin using Caddy images.

...yaml
services:
  caddy:
    image: ghcr.io/luccawood/caddy-cloudflare:latest
    container_name: caddy
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp" # HTTP/3 需要 UDP 端口
    environment:
      # 建议通过环境变量传入 Token，不要直接写在 Caddyfile 里
      - CLOUDFLARE_API_TOKEN=你的_Cloudflare_API_Token
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - ./data:/data
      - ./config:/config
...
