# language: es
Característica: Crear un nuevo material asociado a una ficha ya existente

  Como administrador
  para tener en el el base materiales comprados documentado
  quiero añadir un material necesario para un proyecto

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
     |     66 | Test                                     | LAD    |

    Dado tabla de materiales:
     | nombre                  | contenedor | cantidad |
     | Tornillo abrazadera M10 |          1 |       25 |
     | Tornillo abrazadera M10 |         18 |       15 |

  Escenario: Añadir otro Tornillo abrazadera M10
    Cuando entro la pagina de la ficha "Tornillo abrazadera M10"
    Y hago click en "Nuevo material"
    Entonces se abre un formulario
    Cuando elijo opción "66: Test" en el campo "Ubicacion"
    Y relleno el campo "Cantidad" con "10"
    Y presiono "Guardar" 
    Entonces vuelvo a la pagina de la ficha "Tornillo abrazadera M10"
    Entonces aparece lista de "Materiales" que contiene enlace "66: Test"
