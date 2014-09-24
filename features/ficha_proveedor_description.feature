# language: es
Característica: Descripción de fichas de proveedores

  Como administrador,
  Para optimizar (comparar precios, conocer plazos, nombres propios) una compra de un artículo 
  Quiero tiener una lista de proveedores que ofrecen dicho artículo.

  Antecedentes:
    Dado tabla de fichas:
     | nombre                                         |     codigo |
     | Captador solar plano QRD CR10ALDP8 1900x1090mm | 0000000531 |
     | Panel fotovoltaico 24V 240Wp                   | 0000000523 |
     | Tornillo abrazadera M10                        | 0000000350 |
    Dado tabla de proveedores:
     | nombre     | 
     | Jorge & Co | 

  @wip
  Escenario: Crear una nueva ficha de proveedor con una ficha
    Cuando entro la pagina de la ficha "Tornillo abrazadera M10"
    Cuando hago click en "Nueva ficha de proveedor"
    Entonces se abre un formulario
    Cuando relleno el campo "Nombre" con "Tornillo abrazadera M10B"
    Y elijo opción "Jorge & Co" en el campo "Proveedor"
    Y relleno el campo "Precio" con "999"
    Y relleno el campo "Codigo" con "XXX1234"
    Y presiono "Guardar" 
    Entonces vuelvo a la pagina de la ficha "Tornillo abrazadera M10"
    Entonces aparece lista de "fichas de proveedor" que contiene enlace "Jorge & Co: 999 €"


