# language: es
Característica: Descripción de fichas de material

  Como usuario 
  para encontrar fichas de materiales necesarios para un proyecto
  para encontrar material sobrante de proyectos finalizados, 
  quiero ver una lista de enlaces a detalles de materiales 

  Antecedentes:
    Dado tabla de fichas:
     | nombre                                         |     codigo |
     | Captador solar plano QRD CR10ALDP8 1900x1090mm | 0000000531 |
     | Panel fotovoltaico 24V 240Wp                   | 0000000523 |
     | Tornillo abrazadera M10                        | 0000000350 |
    Dado tabla de ubicaciones:
     | codigo | nombre                                   | ciudad |
     |      1 | FSCU - 613147 - 6                        | LAD    |
     |     18 | NOWU - 550709 - 2    (Cor: Verde) de 40P | LAD    |
    Dado tabla de materiales:
     | nombre                  | contenedor | cantidad |
     | Tornillo abrazadera M10 |          1 |       25 |
     | Tornillo abrazadera M10 |         18 |       15 |


  Escenario: Mostrar detalles de una ficha
    Cuando hago click en el enlace "Lista de materiales" de la pagina inicial
    Entonces aparece lista de "fichas" que contiene enlace "Tornillo abrazadera M10"
    Cuando hago click  en "Tornillo abrazadera M10"
    Entonces aparece la ficha de material con titulo "Tornillo abrazadera M10" 

  Escenario: Mostrar lista de materiales en distintas ubicaciones
    Cuando entro la pagina de la ficha "Tornillo abrazadera M10"
    Entonces aparece lista "Stock" de "materiales" que contiene enlace "Tornillo abrazadera M10"
    Y la cantidad total de "40"

  @dudosa
  Escenario: Material en contenedor que no tiene numero
    Dado tabla de ubicaciones:
     | codigo | nombre        | ciudad |
     |        | NERE-123456-1 |        |
    Dado material "Tornillo abrazadera M10" en contenedor con nombre "NERE-123456-1"
    Cuando entro la pagina de la ficha "Tornillo abrazadera M10"
    Entonces en la lista "Stock" aparezca una entrada cuyo almacen no tiene codigo

  Escenario: Búsqueda por nombre
    Cuando en el campo de búsqueda escribimos "tor" 
    Entonces aparece lista de "fichas" que contiene enlace "Tornillo abrazadera M10"
    Y la lista de "fichas" no continene enlace "Panel fotovoltaico 24V 240Wp"

  Escenario: No se encontró ningún resultado
    Cuando en el campo de búsqueda escribimos "tornilo" 
    Entonces aparece mensaje "No se encontró ningún resultado"
    
