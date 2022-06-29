export SUDOSOS_BASE_TAG := sudosos/
export SUDOSOS_BACK_END := back-end
export SUDOSOS_FRONT_END := front-end
export SUDOSOS_NGINX_PROXY := nginx-proxy
export SUDOSOS_POINT_OF_SALE := point-of-sale

ifdef $(CI_REGISTRY)
REGISTRY := $(CI_REGISTRY)/
endif

build-back-end:
	ls
	docker build ./sudosos-$(SUDOSOS_BACK_END) -t $(REGISTRY)$(SUDOSOS_BASE_TAG)$(SUDOSOS_BACK_END)

build-front-end:
	docker build ./sudosos-$(SUDOSOS_FRONT_END) -t $(REGISTRY)$(SUDOSOS_BASE_TAG)$(SUDOSOS_FRONT_END)

build-nginx-proxy:
	docker build ./sudosos-$(SUDOSOS_NGINX_PROXY) -t $(REGISTRY)$(SUDOSOS_BASE_TAG)$(SUDOSOS_NGINX_PROXY)

build-point-of-sale:
	docker build ./sudosos-$(SUDOSOS_POINT_OF_SALE) -t $(REGISTRY)$(SUDOSOS_BASE_TAG)$(SUDOSOS_POINT_OF_SALE)

build-all:
	make build-back-end
	make build-front-end
	make build-nginx-proxy
	make build-point-of-sale

push-all:
	docker push $(REGISTRY)$(SUDOSOS_BASE_TAG)$(SUDOSOS_BACK_END)
	docker push $(REGISTRY)$(SUDOSOS_BASE_TAG)$(SUDOSOS_FRONT_END)
	docker push $(REGISTRY)$(SUDOSOS_BASE_TAG)$(SUDOSOS_NGINX_PROXY)
	docker push $(REGISTRY)$(SUDOSOS_BASE_TAG)$(SUDOSOS_POINT_OF_SALE)
