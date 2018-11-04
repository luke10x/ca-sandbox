FROM selenium/node-chrome-debug:3.11.0-californium
#COPY ./ca/root.pem /usr/local/share/ca-certificates/root.pem
COPY ./ca/root.pem /usr/share/ca-certificates/extra/foo.crt
USER root
RUN echo 'extra/foo.crt' >> /etc/ca-certificates.conf
RUN update-ca-certificates --fresh
USER seluser
