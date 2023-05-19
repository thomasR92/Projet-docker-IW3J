FROM alpine:latest

RUN apk update \
    && apk add postgresql \
    && rm -rf /var/cache/apk/*

RUN mkdir /app && \ 
    chown postgres:postgres /app && \
    su postgres -c 'initdb -D /app' && \
    chmod -R 750 /app

#installation de vim
RUN apk update && apk add vim

#   chown -R (recusrive) chown a tout les dossier (et dossier/file enfant)

RUN mkdir /run/postgresql && \
    chown postgres:postgres /run/postgresql

RUN mkdir -p /app
RUN echo "host all all all trust";
# ou RUN echo "host all all all trust"  >> "/var/lib/postgresql/data/pg_hba.conf" 
# ou RUN "host all all 0.0.0.0/0 md5" >> "/var/lib/postgresql/data/pg_hba.conf"
# donner les droits de connection venant de tout le monde sur ce fichier

EXPOSE 5432

CMD su postgres -c 'postgres -D /app'

# creation d'un user dans postgres
# RUN psql -U postgres
# RUN CREATE USER user WITH PASSWORD 'password';
# RUN \du