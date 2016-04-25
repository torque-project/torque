BASE_TAG=torqueproject/ubuntu-base:develop
BOOTI_TAG=torqueproject/ubuntu-booti:develop
BOOTI_RUN_ARGS=-v $(PWD)/..:/torque -e TORQUE_DIR=/torque $(BOOTI_TAG)

build-base:
	docker build -t $(BASE_TAG) base
build-booti:
	docker build -t $(BOOTI_TAG) booti
repl: build-booti
	docker run -it $(BOOTI_RUN_ARGS)
test: build-booti
	docker run -e TORQUE_TEST=true $(BOOTI_RUN_ARGS)
shell: build-booti
	docker run -it $(BOOTI_RUN_ARGS) bash
