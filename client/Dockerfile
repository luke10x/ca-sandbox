FROM ubuntu

RUN apt-get -y update && apt-get -y install curl

# Make ssl work on anything else than browsers (like curl)
COPY ./ca/root.pem /usr/share/ca-certificates/extra/foo.crt
RUN echo 'extra/foo.crt' | tee --append /etc/ca-certificates.conf

RUN update-ca-certificates --fresh
