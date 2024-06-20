# Use uma imagem base oficial do Python
FROM python:3.9-slim

# Instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    awscli \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Adicione o script de backup ao contêiner
COPY backup.sh /usr/local/bin/backup.sh

# Dê permissão de execução ao script de backup
RUN chmod +x /usr/local/bin/backup.sh

# Defina o ponto de entrada do contêiner
ENTRYPOINT ["/usr/local/bin/backup.sh"]
