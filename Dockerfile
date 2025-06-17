FROM teddysun/v2ray:latest

# Copiar el script de arranque dinámico
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expone el puerto que Cloud Run usará (obligatorio)
EXPOSE 8080

# Ejecuta el script en lugar del CMD fijo
CMD ["/entrypoint.sh"]
