APP_NAME=devops-flask-app
PORT=5001
JENKINS_PORT=8080

# Application Flask
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

# Jenkins
jenkins-start:
	docker run -d -p $(JENKINS_PORT):8080 -p 50000:50000 \
	  -v jenkins_home:/var/jenkins_home \
	  -v /var/run/docker.sock:/var/run/docker.sock \
	  -v "/Users/nicolas/Documents/code perso":/code \
	  -e JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true" \
	  --name jenkins \
	  jenkins/jenkins:lts
	@echo "Jenkins démarré sur http://localhost:$(JENKINS_PORT)"
	@echo "Attendez 30 secondes puis récupérez le mot de passe initial avec: make jenkins-password"

jenkins-stop:
	docker stop jenkins

jenkins-start-existing:
	docker start jenkins
	@echo "Jenkins redémarré sur http://localhost:$(JENKINS_PORT)"

jenkins-password:
	docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

jenkins-logs:
	docker logs -f jenkins

jenkins-remove:
	docker stop jenkins
	docker rm jenkins

jenkins-open:
	open http://localhost:$(JENKINS_PORT)

# Tests locaux (sans Docker)
test:
	pytest test_app.py

lint:
	flake8 app.py

# Aide
help:
	@echo "Commandes disponibles:"
	@echo "  make build             - Build l'image Docker"
	@echo "  make up                - Lance l'app Flask"
	@echo "  make down              - Arrête l'app Flask"
	@echo "  make jenkins-start     - Démarre Jenkins (première fois)"
	@echo "  make jenkins-start-existing - Redémarre Jenkins existant"
	@echo "  make jenkins-stop      - Arrête Jenkins"
	@echo "  make jenkins-password  - Affiche le mot de passe Jenkins"
	@echo "  make jenkins-open      - Ouvre Jenkins dans le navigateur"