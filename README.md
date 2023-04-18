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

# Primer ejemplo Crear una imagen y contenedor de React

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

Aquí definimos la imagen base que necesita en este caso es node versión 18. Creamos la carpeta donde se guardara la aplicación, definimos el directorio de trabajo donde se ejecutaran los comandos COPY, RUN, CMD. Copiamos los archivos necesarios. Hacemos la instalacion de las dependencias necesarias. Exponemos el puerto que estara utilizando la imagen. y finalmente ejecutamos la aplicación.

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

![docker run]()
