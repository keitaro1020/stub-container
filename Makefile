.PHONY: docker_build_push
docker_build_push:
	docker build --platform linux/x86_64 -t stub-container .
	docker tag stub-container:latest keitaro1020/stub-container:latest
	docker push keitaro1020/stub-container:latest