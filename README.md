
# README

## Índice

1. [Proceso](#proceso)
2. [Puntos Flojos](#puntos-flojos)
3. [Mejora del Sistema](#mejora-del-sistema)
4. [Problemas](#problemas)
5. [API Endpoints](#api-endpoints)
6. [Despliegue](#despliegue)
7. [Tutorial](#tutorial)


# Proceso

```
Crear modelos  
Crear controllers
Crear rutas
Crear postman para documentar y facilitar las pruebas los endpoints
Dockerizar el projecto 😳 
Describir cada endpoint
Pequeño tutorial de como utilizar el programa
```

### Puntos flojos

```
Rendimiento en endpoints como add/remove produc
Falta de seguridad
Mal planteamiento de modelos
Mal manejo de errores
```

### Mejora del sistema

```
Mal planteamiento de modelos
    * Concurrencia de dato en Productos y Eventos
    * Poniendo un campo stock me ahorraría esta concurrencia de datos.

Inheritance
    * Hacer que Productos y Eventos hereden de un modelo padre los campos
      que se repiten (precio, nombre, thumbnail y descripción).
      Mejor escalado y mejor manejo del de tipo de producto (producto o evento en este caso)

Falta de seguridad
    * Añadiría una capa de usuarios para poder mejorar la seguridad de cada carrito.
      Una capa de usuarios y tokens para más seguridad (standard jwt por ejemplo)  

Mejora de rendimiento
    * En algunos endpoints como add/remove product/event recorro un array, 
      pudiendo dar problemas de rendimiento

Errores y validaciones 
    * Me he  centrado en lo esencial del ejercicio que es un carrito de compra,
      por ende me falta muchas validaciones y errores, aqui dejo ejemplos:
		* Validar si esta fuera de stock
		* Validar si existe x modelo
```	

### Problemas

```
* Install rails
    Instalar ruby on rails xd
* Ruby version  2.6 to > 2.7
    Mi ordenador tenía una versión de ruby antigua; visitando 3423423 foros
    pude cambiar de versión y proseguir.
* Problems with M1 :)
    Movida con el procesador de mi ordenador teniendo que volver a visitar 4534579 foros.
* Aprender ruby y rails
	Aprender este bonito lengua parecido a si amigo python
	y leer que me aporta las clases más importantes de rails
* Manejo de errores
    rails genera errores por default y no he descubierto todavía como
 	generar mis errores con mis messages personalizados	·
* Variables de entorno
    rails no cargaba bien las variables del archivo .env
    stack overflow me ayudo a quitar este simple if.
* Error al hacer migrate en docker
    Configure docker-compose y Dockerfile.
    Fui a la terminal del contendor y puse este comando: rake db:migrate.
	Hizo la migracion y todo funcionaba 🙂

```


## API Endpoints

<table>
<thead>
<tr>
<th>Endpoint</th>
<th>HTTP Method</th>
<th>Description</th>
<th>Body</th>
</tr>
</thead>
<tbody>
<tr>
<td>/events</td>
<td>GET</td>
<td>Obtain a list of all events.</td>
<td>N/A</td>
</tr>
<tr>
<td>/events/:id</td>
<td>GET</td>
<td>Retrieve details of a specific event by ID.</td>
<td>N/A</td>
</tr>
<tr>
<td>/events</td>
<td>POST</td>
<td>Create a new event.</td>
<td>

```css
{
    "name":string,
    "price":integer,
    "thumbnail":string,
    "description":string
}
```

</td>
</tr>
<tr>
<td>/products</td>
<td>GET</td>
<td>Fetch a list of all products.</td>
<td>N/A</td>
</tr>
<tr>
<td>/products/:id</td>
<td>GET</td>
<td>Retrieve details of a specific product by ID.</td>
<td>N/A</td>
</tr>
<tr>
<td>/products</td>
<td>POST</td>
<td>Create a new product.</td>
<td>

```css
{
    "name":string,
    "price":integer,
    "thumbnail":string,
    "description":string
}
```

</td>
</tr>
<tr>
<td>/carts</td>
<td>GET</td>
<td>Get a list of all carts.</td>
<td>N/A</td>
</tr>
<tr>
<td>/carts/:id</td>
<td>GET</td>
<td>Retrieve details of a specific cart by ID.</td>
<td>N/A</td>
</tr>
<tr>
<td>/carts</td>
<td>POST</td>
<td>Create a new cart.</td>
<td>N/A</td>
</tr>
<tr>
<td>/carts/:id/products</td>
<td>POST</td>
<td>Add a product to a cart by ID.</td>
<td>

```css
{
    "products_ids":integer[]
}
```

</td>
</tr>
<tr>
<td>/carts/:id/products</td>
<td>DELETE</td>
<td>Remove a product from a cart by ID.</td>
<td>

```css
{
    "products_ids":integer[]
}
```

</td>
</tr>
<tr>
<td>/carts/:id/events</td>
<td>POST</td>
<td>Add an event to a cart by ID.</td>
<td>

```css
{
    "event_ids":integer[]
}
```

</td>
</tr>
<tr>
<td>/carts/:id/events</td>
<td>DELETE</td>
<td>Remove an event from a cart by ID.</td>
<td>

```css
{
    "event_ids":integer[]
}
```

 </td>
</tr>
<tr>
<td>/tickets</td>
<td>GET</td>
<td>Retrieve a list of all tickets.</td>
<td>N/A</td>
</tr>
<tr>
<td>/tickets/:id</td>
<td>GET</td>
<td>Fetch details of a specific ticket by ID.</td>
<td>N/A</td>
</tr>
<tr>
<td>/tickets</td>
<td>POST</td>
<td>Create a new ticket.</td>
<td>

```css
{
    "cart_id":integer
}
```

</td>
</tr>
</tbody>
</table>


## DESPLIEGUE


### 1 Crear un archivo .env 

```bash
#root dir

cp env.example .env

```

### 2 Añadir variables de entorno 

```zsh
#/.env
# Elige el nombre de usuario de la base de datos
export DB_USER=user
# La contraseña de la base de datos que tiene que poner la aplicacion 
export DB_PASSWORD=password
# Elige el nombre de la base de datos
export DB_DATABASE=database
# Elige la contraseña para la base de datos
export DB_ROOT_PASSWORD=password

```

### 3 Build

```zsh
#root dir

docker-compose up --build

```

### 4 Arrancar la base de batos

```zsh
# Ir a la terminal de la aplicacion en el contenador de docker

rake db:migrate

```
<img width="616" alt="image" src="https://github.com/joelforworks/shopping-cart-api/assets/101220133/dfe2303e-dbab-4008-9686-1f350c180d1f">


## Tutorial

Adjunto postman en le projecto

### Crear productos y eventos

<img width="442" alt="image" src="https://github.com/joelforworks/shopping-cart-api/assets/101220133/b8264d44-b7eb-40e8-8048-96ddea1768c1">

Repetir el proceso con sus respectivos [endpoints](#api-endpoints)

### Crear un carrito 

```
Cuando se crea un carrito no tiene productos y eventos por default
```

<img width="418" alt="image" src="https://github.com/joelforworks/shopping-cart-api/assets/101220133/b3aa746a-f261-465c-9c30-f5779cd589cf">

## Añadir producto y eventos al carrito

Ver [aquí](#api-endpoints) como funciona los endpoint de añadir productos/eventos

<img width="402" alt="image" src="https://github.com/joelforworks/shopping-cart-api/assets/101220133/1558e5ac-1d10-488e-9d56-554852f9eb76">

## Crear un ticket

```
Por ultimo crear nuestro tiquet
```


<img width="462" alt="image" src="https://github.com/joelforworks/shopping-cart-api/assets/101220133/129d709c-be5c-4bf4-bf9a-80615a8fef71">


## Y esto sería todo muchas gracias. :)


