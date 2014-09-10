# language: es
Característica: Descripción de unidades de negocio, familias y subfamilias

  Como usuario,
  para encontrar fichas de materiales bajo el criterio dado por categoría,
  Quiero ver una lista de enlaces a detalles de materiales en ciertas categorías

  Antecedentes:
    Dado tabla de "fichas":
     | Nombre                                         |     Codigo | Subfamilia |
     | Captador solar plano QRD CR10ALDP8 1900x1090mm | 0000000531 | Captadores |
     | Panel fotovoltaico 24V 240Wp                   | 0000000523 | Paneles    |
     | Tornillo abrazadera M10                        | 0000000350 | Accesorios |
    Dado tabla de "unidades de negocio":
     | nombre  |
     | Agua    |
     | Energia |
    Dado tabla de "familias":
     | nombre        | unidad de negocio |
     | Solar termica | Agua              |
     | FV            | Energia           |
     | Fontaneria    | Agua              |
    Dado tabla de "subfamilias":
     | nombre     | famila        |
     | Accesorios | Fontaneria    |
     | Paneles    | FV            |
     | Captadores | Solar termica |
  Escenario: Mostrar lista de todas las fichas de los materiales en una subfamilia 
    Cunado en la pagina inicial hago click en el enlace "Lista de subfamilas"
    Entonces aparezca una lista de enlaces de subfamilias que contiene una fila que contine "Accesorios", "Fontaneria", "Agua"
    Y cuando hago click en "Accesorios"
    Entonces aparezca un lista que contiene enlace a "Tornillo abrazadera M10"

