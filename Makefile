.PHONY: compile tests bootstrap_db build launch_server

compile:
	./mvnw compile -f pom.xml

test:
	./mvnw test

bootstrap_db:
	docker-compose up -d db

build: compile
	./mvnw package -DskipTests

launch_server: build bootstrap_db
	java -jar target/master_process-0.0.1-SNAPSHOT.jar
