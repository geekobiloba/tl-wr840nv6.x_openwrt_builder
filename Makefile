CT_IMG    := localhost/tl-wr840nv6.x_openwrt_builder
CT_NAME   := openwrt-builder
BUILD_DIR := /root/openwrt-19.07-tl-wr840n-v6.x/
OUT_DIR   := ./bin/

v6.2: container openwrt clean

container: container_img run

container_img: Dockerfile .config
	docker build -t $(CT_IMG) .

run:
	mkdir -p $(OUT_DIR)
	docker run -dit \
		--name $(CT_NAME) \
		-h     $(CT_NAME)  \
		-w     $(BUILD_DIR) \
		-v     $(OUT_DIR):$(BUILD_DIR)/bin/ \
		$(CT_IMG)

config:
	docker exec -it $(CT_NAME) make -C $(BUILD_DIR) menuconfig

openwrt:
	docker exec -it $(CT_NAME) make -C $(BUILD_DIR) clean
	docker exec -it $(CT_NAME) make -C $(BUILD_DIR)

clean:
	docker rm -f $(CT_NAME)

realclean:
	docker rmi -f $(CT_IMG)

pristine: realclean
	rm -rf $(OUT_DIR)

.PHONY: v6.2 container run config openwrt clean realclean pristine

