FROM teddysun/v2ray:latest

# Usa bash como shell predeterminado
SHELL ["/bin/bash", "-c"]

# Copia el script de arranque y da permisos
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

# Exponer el puerto que Cloud Run usará (opcional pero recomendable)
EXPOSE 8080

# Ejecutar el script como proceso principal
CMD ["/entrypoint.sh"]
