APP_NAME=devops-flask-app
PORT=5001

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

logs:
	docker-compose logs -f

ps:
	docker-compose ps

open:
	open http://localhost:$(PORT)