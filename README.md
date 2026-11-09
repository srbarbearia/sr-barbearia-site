# Site da SR Barbearia

Página única estática (HTML + CSS), servida por nginx em Docker no Easypanel.

- `index.html` — o site inteiro
- `logo.png` — logo (favicon e imagem de compartilhamento são gerados no build a partir dela)
- `Dockerfile` + `nginx.conf` — como o Easypanel publica

Cada push na branch `main` gera um novo deploy no Easypanel.
