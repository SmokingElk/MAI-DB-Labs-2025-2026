.PHONY: rebuild
rebuild: clean restart

.PHONY: restart
restart: down up

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down
	
.PHONY: clean
clean:
	docker compose down -v --remove-orphans