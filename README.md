
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





