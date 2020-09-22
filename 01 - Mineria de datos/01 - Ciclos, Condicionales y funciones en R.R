# Nos ubicamos en el directorio de trabajo
setwd('CurosCienciasDatos/01 - Mineria de datos/BasesDatos/')

## Operadores################################################
# x | y <- Operador O
#x & y <- OPerador Y
#!x <- Negación
#isTRUE(x) <- X es verdad?
#== <- Comparación
#<, < =, >, > = <- Mayor, Mayor o igual, Menor y Menor o igual.
#%in% <- Permite determinar si uno o varios valores están contenidos en un vector.

## Estructuras de control ##############################

compra <- c(rep("s",4), rep("n",5))

respuesta <- "n"
if (respuesta == "s") {
  0
}else{
  1
}

# Condicional vectorizado

ifelse(compra == "s", 0, 1)


## Ciclos ##########################

vec <- vector()

##################
for (i in 1:4) {
  vec[i] <- i
  return(vec)
}
#################

contrasena <- readline("Ingrese la contraseña")
con = 0

while (contrasena != "hola") {
  print("Contraseña incorrecta")
  contrasena <- readline("Ingrese la contraseña")
  con = con + 1
  if (con ==3) {
    break
  }
  
}

############

x <- 0
repeat {
  print(x)
  x = x+1
  if (x == 3){
    break
  }
}



## Funciones ############################################

x <- 1:20

conteo <- function(vector){
  con <- length(vector)
  cat('El vector tiene', con, ' elementos')
}




conteo(x)
