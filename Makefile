.PHONY: up down logs ps test

up:
	docker compose up -d --build

down:
	docker compose down

logs:
	docker compose logs --tail 50

ps:
	docker compose ps

test:
	./scripts/test.sh
