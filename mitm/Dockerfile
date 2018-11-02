FROM nginx:latest

RUN apt-get update \
    && apt-get install -y openssl \
    && rm -rf /var/lib/apt/lists/*

RUN openssl dhparam -out /etc/ssl/certs/dhparam-2048.pem 2048

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d /etc/nginx/conf.d
COPY ./www/mitm /var/www/mitm

# Generate CA private key: mitm-ca.key
RUN openssl genrsa -out /mitm-ca.key 2048

# Generate a root certificate: mitm-ca.pem
RUN openssl req -x509 -new -nodes \
    -key /mitm-ca.key \
    -sha256 -days 1825 \
    -subj "/C=DE/ST=NRW/L=Berlin/O=o/OU=pps/CN=www/emailAddress=email" \
    -out /mitm-ca.pem

# Create a private key
RUN openssl genrsa -out /etc/ssl/certs/google.com.key 2048

# Create a CSR
RUN openssl req -new -key /etc/ssl/certs/google.com.key \
    -subj "/C=DE/ST=NRW/L=Berlin/O=o/OU=pps/CN=www/emailAddress=email" \
    -out /etc/ssl/certs/google.com.csr

RUN openssl x509 -req -in /etc/ssl/certs/google.com.csr \
    -CA /mitm-ca.pem \
    -CAkey /mitm-ca.key -CAcreateserial \
    -out /etc/ssl/certs/google.com.crt -days 1825 -sha256

RUN ls /etc/ssl/certs -las


