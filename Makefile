#
# Ultility Makefile to build/push Docker images
#
USER   := jsemer
REPO   := timeloop-accelergy-tutorial

NAME   := ${USER}/${REPO}
TAG    := $$(git log -1 --pretty=%h)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest


all:	build


# Pull all submodules

pull:
	@for i in src/*; do (echo "Pull $$i"; cd $$i; git pull); done


# Build and tag docker image

build:
	docker build ${BUILD_FLAGS} -t ${IMG} .
	docker tag ${IMG} ${LATEST}
 

# Push docker image

push:
	docker push ${NAME}
 

# Login to docker hub

login:
	@docker log -u ${DOCKER_USER} -p ${DOCKER_PASS}

