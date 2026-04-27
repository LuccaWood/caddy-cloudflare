# caddy-cloudflare
自构建的镜像，使用官方的caddy和提供的cloudflare插件，构建的带有插件的dns验证版本
构建时使用如下yaml
```yaml
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
      - CLOUDFLARE_API_TOKEN=你的_Cloudflare_API_Token
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - ./data:/data
      - ./config:/config
```


使用时，Caddyfile文件配置
```
example.com {
    tls {
        dns cloudflare {env.CLOUDFLARE_API_TOKEN}
    }
    
    # 你的反向代理配置
    reverse_proxy 192.168.1.100:8080 
}
```
