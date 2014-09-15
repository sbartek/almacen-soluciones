# language: es
Característica: Descripcion de ubicaciones

  Como administrador
  para hacer inventario de un contenedor 
  quiero ver una lista de materiales dentro de el

  Antecedentes:
    Dado tabla de ubicaciones:
     | codigo | nombre                                   | ciudad |
     |      1 | FSCU - 613147 - 6                        | LAD    |
     |     18 | NOWU - 550709 - 2    (Cor: Verde) de 40P | LAD    |
    Dado tabla de fichas:
     | nombre                  |     codigo |
     | Tornillo abrazadera M10 | 0000000350 |
    Dado tabla de materiales:
     | nombre                  | contenedor | cantidad |
     | Tornillo abrazadera M10 |          1 |       25 |

  @wip
  Escenario: Mostrar lista de materiales dentro de un contenedor
    Cuando hago click en el enlace "Lista de ubicaciones" de la pagina inicial
    Entonces aparece lista de "ubicaciones" que contiene enlace "18"
    Cuando hago click  en "18"
    Entonces aparece lista de "fichas" que contiene enlace "Tornillo abrazadera M10"



  
