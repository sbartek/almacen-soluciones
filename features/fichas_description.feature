# language: es
Característica: Descripción de fichas de material

  Como usuario 
  para encontrar fichas de materiales necesarios para un proyecto
  para encontrar material sobrante de proyectos finalizados, 
  quiero ver una lista de enlaces a detalles de materiales 

  Antecedentes:
    Dado tabla de fichas:
     | Nombre                                         |     Codigo |
     | Captador solar plano QRD CR10ALDP8 1900x1090mm | 0000000531 |
     | Panel fotovoltaico 24V 240Wp                   | 0000000523 |
     | Tornillo abrazadera M10                        | 0000000350 |

  @wip 
  Escenario: Mostrar detalles de una ficha
    Cuando hago click en el enlace "Lista de materiales" de la pagina inicial
    Entonces aparece lista de fichas que contiene enlace "Tornillo abrazadera M10"
    Cuando hago click  en "Tornillo abrazadera M10"
    Entonces aparece la ficha de material con titulo "Tornillo abrazadera M10" 

  Escenario: Mostrar lista de materiales en distintas ubicaciones
    Dado materiales:
     | nombre                  | contenedor | cantidad |
     | Tornillo abrazadera M10 |          1 |       25 |
     | Tornillo abrazadera M10 |         41 |       15 |
    Cuando entro la pagina de "Tornillo abrazadera M10"
    Entonces la pagina contiene la lista "Stock" de contenedores con cantidades
    Y la cantidad total de "40"

  Escenario: Material en contenedor que no tiene numero
    Dado almacen:
     | numero | nombre        | ciudad |
     |        | NERE-123456-1 |        |
    Dado material "Tornillo abrazadera M10" en este contenedor 
    Cuando entro pagina de ficha "Tornillo abrazadera M10"
    Entonces en la lista "Stock" aparezca una entrada cuyo almacen no tiene numero pero tiene nombre "NERE-123456-1"

  Escenario: Búsqueda por nombre
    Cuando en el campo de búsqueda escribimos "tor" en la pagina principal
    Entonces en la lista de resultados aparecerá "Tornillo abrazadera M10"  
