# Makefile for Docker Nginx PHP Composer MySQL

# MySQL
MYSQL_DUMPS_DIR=db

help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  apidoc              Generate documentation of API"
	@echo "  code-sniff          Check the API with PHP Code Sniffer (PSR2)"
	@echo "  clean               Clean directories for reset"
	@echo "  composer-up         Update PHP dependencies with composer"
	@echo "  docker-start        Create and start containers"
	@echo "  docker-stop         Stop and clear all services"
	@echo "  gen-certs           Generate SSL certificates"
	@echo "  logs                Follow log output"
	@echo "  mysql-dump          Create backup of all databases"
	@echo "  mysql-restore       Restore backup of all databases"
	@echo "  phpmd               Analyse the API with PHP Mess Detector"
	@echo "  test                Test application"

init:
	@$(shell cp -n $(shell pwd)/web/app/composer.json.dist $(shell pwd)/web/app/composer.json 2> /dev/null)

composer-up:
	@docker run --rm -v $(shell pwd)/web/app:/app composer update

docker-start: init
	docker-compose up -d

docker-stop:
	@docker-compose down -v
	@make clean

logs:
	@docker-compose logs -f

mysql-dump:
	@mkdir -p $(MYSQL_DUMPS_DIR)
	@docker exec $(shell docker-compose ps -q mysql) mysqldump --all-databases -u $(MYSQL_ROOT_USER) -p $(MYSQL_ROOT_PASSWORD) astah8 > $(MYSQL_ROOT_PASSWORD)/astah.sql
	@make resetOwner

mysql-restore:
	@docker exec -i $(shell docker-compose ps -q mysql) mysql -u root --database=astah8 < $(MYSQL_DUMPS_DIR)/astah.sql

phpmd:
	@docker-compose exec -T bitnami/php-fpm \
	./app/vendor/bin/phpmd \
	./app/src \
	text cleancode,codesize,controversial,design,naming,unusedcode

test: code-sniff
	@docker-compose exec -T php ./app/vendor/bin/phpunit --colors=always --configuration ./app/
	@make resetOwner

