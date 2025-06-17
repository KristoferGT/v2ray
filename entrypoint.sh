#!/bin/bash

# Variables con valores por defecto si no están definidas
DHOST=${DHOST:-"127.0.0.1"}
DPORT=${DPORT:-"22"}
PORT=${PORT:-"8080"}  # Puerto que Cloud Run asigna

# Crear config.json dinámico
cat > /etc/v2ray/config.json <<EOF
{
  "inbounds": [
    {
      "port": $PORT,
      "listen": "0.0.0.0",
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "abcd1234-ef56-7890-abcd-1234567890ff",
            "level": 0
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/Cloud-CDN"
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {
        "redirect": "$DHOST:$DPORT"
      }
    }
  ]
}
EOF

# Ejecutar V2Ray
exec v2ray run -config /etc/v2ray/config.json
