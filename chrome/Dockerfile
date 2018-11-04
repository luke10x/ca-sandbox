FROM selenium/node-chrome-debug:3.11.0-californium

RUN sudo apt-get -y update && sudo apt-get -y install curl

# Make ssl work on anything else than browsers (like curl)
COPY ./ca/root.pem /usr/share/ca-certificates/extra/foo.crt
RUN echo 'extra/foo.crt' | sudo tee --append /etc/ca-certificates.conf

RUN sudo update-ca-certificates --fresh
