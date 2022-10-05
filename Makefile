path := $(shell pwd)

php73-nvm: $(path)
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag bigbossstudio/php-apache-node:7.3-nvm $(path)/7.3/nvm

php73-12.16.1: $(path)
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag bigbossstudio/php-apache-node:7.3-12.16.1 $(path)/7.3/12.16.1

php74-nvm: $(path)
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag bigbossstudio/php-apache-node:7.4-nvm $(path)/7.4/nvm

php74-12.16.1: $(path)
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag bigbossstudio/php-apache-node:7.4-12.16.1 $(path)/7.4/12.16.1

php80-nvm: $(path)
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag bigbossstudio/php-apache-node:8.0-nvm $(path)/8.0/nvm

php80-15.3.0: $(path)
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag bigbossstudio/php-apache-node:8.0-12.16.1 $(path)/8.0/15.3.0

php81RC4-nvm: $(path)
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag bigbossstudio/php-apache-node:8.1RC4-nvm $(path)/8.1RC4/nvm

php81-nvm: $(path)
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 --tag bigbossstudio/php-apache-node:8.1-nvm $(path)/8.1/nvm

all: php73-12.16.1 php73-nvm php74-12.16.1 php74-nvm php80-12.16.1 php80-nvm php81-nvm
