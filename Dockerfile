FROM teddysun/v2ray:latest

# Copiar el script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exponer el puerto que Cloud Run usará
EXPOSE 8080

# Ejecutar el script de entrada
CMD ["/entrypoint.sh"]
