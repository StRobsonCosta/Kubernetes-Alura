#!/bin/bash

# Variáveis de ambiente
DB_HOST=${DB_HOST}
DB_PORT=${DB_PORT}
DB_NAME=${DB_NAME}
DB_USER=${DB_USER}
DB_PASSWORD=${DB_PASSWORD}
AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
AWS_REGION=${AWS_REGION}
S3_BUCKET=${S3_BUCKET}
BACKUP_PATH=/backup

# Verifique se o diretório de backup existe, senão, crie
mkdir -p $BACKUP_PATH

# Defina o nome do arquivo de backup
BACKUP_FILE=$BACKUP_PATH/backup-$(date +%Y%m%d%H%M%S).sql

# Faça o backup do banco de dados
mysqldump -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Envie o arquivo de backup para o S3
aws s3 cp $BACKUP_FILE s3://$S3_BUCKET/

# Remova o arquivo de backup local
rm $BACKUP_FILE