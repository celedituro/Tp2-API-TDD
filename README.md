# Salta Api

### Integrantes del grupo
* [Dituro Celeste](https://gitlab.com/celedituro)
* [Lopez Victoria Abril](https://gitlab.com/vickyylopezz)
* [Pfaab Ivan Lautaro](https://gitlab.com/ipfaab)
* [Villores Alejo](https://gitlab.com/alejovillores)


### Ambientes
`test` [http://salta-api-test.herokuapp.com/](http://salta-api-test.herokuapp.com/)\
`produccion` [http://salta-api-prod.herokuapp.com/](http://salta-api-prod.herokuapp.com/)


### Correr local en Docker

Para un desarrollo utilizando Docker se debe instalar desde 
[docker](https://docs.docker.com/get-docker/)

1\) Primero se debe contruir la imagen corriendo

`docker build -f Dockerfile -t <image_name:version> .`

Para image name, se puede evitar y se construirá como "latest".
Por ejemeplo, web-template or web-template:1.0.0

`docker build -f Dockerfile -t web-template .`

2\) Una vez que usted tiene la imagen, puede levantar el servidor corriendo:

`docker run -it -p <port>:<port> <image_name:version>`

Nuevamente, por ejemplo:

`docker run -it -p 3000:3000 web-template`

Luego, abra su navegador y ingrese en http://0.0.0.0:3000

### Correr local con Docker Compose

Primero, obtén [docker-compose](https://docs.docker.com/compose/install/).

Luego, puede ejecutar `start_dev_containers.sh` para sistemas Unix o `start_dev_container.cmd` para sistemas Windows . Luego de esto estará dentro del contenedor

Comience la app usando el comando `bundle exec padrino start -h 0.0.0.0` y checkee el estado de esta a través de `http://localhost:3000/`

### Deploy con Dockerfile + Heroku

1\) Setee `HEROKU_TOKEN` como variable de entorno con su token personal

2\) Ejecute `./scripts/build-image.sh` para crear el binario y luego ejecute `./scripts/deploy.sh` para actualizar heroku runtime


# Testing y migraciones

### Migraciones

RACK_ENV=test bundle exec rake db:migrate db:seed
RACK_ENV=development bundle exec rake db:migrate db:seed



Para correr los test de la aplicación, dentro del contenedor pueed ejecutar el script `sh test.sh`

# Test de Aceptación

Durante el desarrollo, cuando un desarrollador trabaja con sus cucumbers crea una instancia en progreso de la aplicacion, por lo que es suficiente correr los cucumbers
