install:
	docker run \
		--user $(id -u):$(id -g) \
		-v $(PWD)/generate-certs.sh:/generate-certs.sh \
		-v $(PWD)/mitm/certs:/certs \
		-v $(PWD)/client/ca:/ca \
		ubuntu bash /generate-certs.sh

google:
	docker-compose run client bash -c 'curl https://www.google.com'

.PHONY: install google 

