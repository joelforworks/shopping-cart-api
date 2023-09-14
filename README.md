
# README

### Proceso
```
crear modelos  
crear controllers
crear rutas
crear postman para documentar y facilitar las pruebas los endpoints
describir cada endpoint
Pequeño tutorial de como utilizar el programa
```

### Puntos flojos

```
Rendimiento en endpoints como add/remove produc
Falta de seguridad
Mal planteamiento de modelos
Mal manejo de errores
```

### Mejora de sistema

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
    * En algunos endpoints como add/remove product/event recorro un array, pudiendo dar problemas de rendimiento

Errores y validaciones 
    * Me he  centrado en lo esencial del ejercicio que es un carrito de compra,
      por ende me falta muchas validaciones y errores, aqui dejo ejemplos:
		* Validar si esta fuera de stock
		* Validar si existe x modelo
```	

## API Endpoints

| Endpoint                   | HTTP Method | Descripción                      |
| ---------------------------| ----------- | --------------------------------|
| `/events`                  | GET         | Lista de todos los eventos.      |
| `/events/:id`              | GET         | Detalle de un evento específico por ID. |
| `/events`                  | POST        | Crea un nuevo evento.            |
| `/products`                | GET         | Lista de todos los productos.    |
| `/products/:id`            | GET         | Detalle de un porducto específico por ID. |
| `/products`                | POST        | Crea un nuevo producto.          |
| `/carts`                   | GET         | Lista de todos los carritos.       |
| `/carts/:id`               | GET         | Detalle de un carrito específico por ID. |
| `/carts`                   | POST        | Crea un nuevo carrito.             |
| `/carts/:id/products`      | POST        | Agregua un producto a un carrito por ID. |
| `/carts/:id/products`      | DELETE      | Elimina un producto a un carrito por ID. |
| `/carts/:id/events`        | POST        | Agregua un evento a un carrito por ID.  |
| `/carts/:id/events`        | DELETE      | Elimina un evento a un carrito por ID. |
| `/tickets`                 | GET         | Lista de todos los tickets.     |
| `/tickets/:id`             | GET         | Detalle de un ticket específico por ID. |
| `/tickets`                 | POST        | Crea un nuevo ticket.           |

