# Docker 

## Requerido

Docker desktop [Download link](https://docs.docker.com/get-docker/)

**o**

Docker ubuntu

Uninstall older versions  `sudo apt-get remove docker docker-engine docker.io containerd runc`

Install last version `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`

---

También podemos usar docker con librerías como react tanto para generar una imagen, como trabajar en modo de desarrollo.

A continuación veremos los pasos para realizar esto.

---

# Primer ejemplo: _Crear una imagen y contenedor de React_

## Pasos
1. Crear la aplicación
2. Crear Dockerfile
3. Crear imagen
4. Crear contenedor

## Crear la aplicación

Para crear la aplicación usaremos el comando _`npx create-react-app`_.

![npx create-react-app](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/1.png?raw=true)

Después de la instalación podemos ejecutar la aplicación para verificar que se encuentra funcionando.

![ejecutar](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/2.png?raw=true)

![localhost](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/3.png?raw=true)

## Crear Dockerfile

Después de verificar que la aplicación levanta. Podemos crear el dockerfile para crear la imagen de nuestra app.

![localhost](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/4.png?raw=true)

Aquí definimos la imagen base que necesita en este caso es node versión 18. Creamos la carpeta donde se guardara la aplicación, definimos el directorio de trabajo donde se ejecutaran los comandos COPY, RUN, CMD. Copiamos los archivos necesarios. Hacemos la instalacion de las dependencias necesarias. Exponemos el puerto que estara utilizando la imagen. y finalmente el comando para ejecutar la aplicación.

## Crear imagen

Para crear la imagen utilizaremos el comando _`docker build`_.

Aquí utilizamos -t para darle un nombre y tag a nuestra imagen y utilizamos . ya que nuestro Dockerfile se encuentra en la ruta raiz de nuestro proyecto.

![crear imagen](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/5.png?raw=true)

## Crear y ejecutar contenedor

Para crear el contenedor a partir de nuestra imagen utilizaremos el comando _`docker create`_.

Aquí utilizamos --name para darle un nombre a nuestro contenedor, definimos el puerto, y la imagen que utilizaremos para crear el contenedor.

![crear contenedor](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/6.png?raw=true)

Para ejecutar el contenedor utilizamos el comando _`docker start`_.

![ejecutar contenedor](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/7.png?raw=true)

![localhost](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/8.png?raw=true)

Si queremos crear y ver los logs o la información del contenedor podemos utilizar _`docker run -it miapp sh`_.

Aqui vemos que nos posiciona dentro del proyecto porque lo definimos asi en el Dockerfile con el WORKDIR.

![docker run](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/9.png?raw=true)


# Segundo ejemplo: _Crear un ambiente de trabajo de desarrollo_

## Pasos
1. Crear la aplicación
2. Crear Dockerfile.dev
3. Crear docker-compose-dev.yml
4. Crear imagen y contenedor y ejecutar contenedor

## Crear la aplicación

Para crear la aplicación usaremos el comando _`npx create-react-app`_.

![npx create-react-app](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/1.png?raw=true)

Después de la instalación podemos ejecutar la aplicación para verificar que se encuentra funcionando.

![ejecutar](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/2.png?raw=true)

![localhost](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/3.png?raw=true)

Agregar key a package.json para que nodemon pueda funcionar correctamente.

![key](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/11.png?raw=true)

## Crear Dockerfile.dev

Después de verificar que la aplicación levanta. Podemos crear el dockerfile para crear la imagen de nuestra app.

![localhost](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/10.png?raw=true)

Aquí definimos la imagen base que necesita en este caso es node versión 18. Creamos la carpeta donde se guardara la aplicación, definimos el directorio de trabajo donde se ejecutaran los comandos RUN, CMD. Aqui no copeamos los archivos ya que utilizaremos volumes para hacer una copia de nuestra aplicación local. Exponemos el puerto que estara utilizando la imagen. y finalmente el comando para ejecutar la aplicación.

## Crear docker-compose-dev.yml

![docker-compose-dev](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/12.png?raw=true)

Aqui definimos la version, el servicio, el contexto donde se encuentra el dockerfile, el archivo docker que se usara para crear la imagen, el nombre del contenedor, el puerto definimos true a stdin_open (poder trabajar en el proyecto fuera del contenedor), y el volumen que sera el encargado de hacer la copia de mi aplicación local a la parte donde se encuentra guardado la aplicación.

## Crear imagen, contenedor y ejecutar contenedor

El siguiente comando que utilizaremos sera _`docker-compose -f docker-compose-dev.yml up`_

![docker-compose up](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/13.png?raw=true)

Una vez realizado esto podemos hacer cambios en nuestro directorio local y esto lo actualiza en nuestro contenedor debido a que nodemon detecta los cambios en nuestros archivos (js, mjs, json).

![localhost old](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/8.png?raw=true)

![file](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/14.png?raw=true)

![file](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/15.png?raw=true)

![localhost new](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/16.png?raw=true)

## Terminar el proceso

Con los comandos _`docker-compose down`_ podemos terminar el proceso y eliminar el contenedor con _`docker rm`_ y la imagen con _`docker image rm`_.

![end process](https://github.com/brandonruizmora/docker-react/blob/master/imagenes/17.png?raw=true)
