install:
	docker run \
		--user $(id -u):$(id -g) \
		-v $(PWD)/generate-certs.sh:/generate-certs.sh \
		-v $(PWD)/mitm/certs:/certs \
		-v $(PWD)/chrome/ca:/ca \
		ubuntu bash /generate-certs.sh

.PHONY: install
