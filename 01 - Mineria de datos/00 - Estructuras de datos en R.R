# Nos ubicamos en el directorio de trabajo
setwd('CurosCienciasDatos/01 - Mineria de datos/BasesDatos/')

## Tipos de datos ##########################################
entero <- 8
real <- 7.8
booleano <- TRUE # FALSE(T, F)
caracter <- "Hola mundo"
factor <- factor("hola")
vacio <- NA

## Convertir a entre tipos de datos ##################################

# Entero a real
real1 <- as.numeric(entero)
class(real1)

# Real a entero
entero1 <- as.integer(real)
class(entero1)

# caracter a factor
factor1 <- as.factor(caracter)
class(factor1)

## Operaciones #####################################################

# Suma
6+5

# Resta
6-5

# Multiplicación
6*5

# División
6/5.1

# Exponente
6^5

## Variables #####################################################

x <- 8
x = 4

## Vectores #####################################
vector <- c(1, 5, 84, 9, 0)
vector

vector.1 <- c("a", "b", "c")
vector.1

# Predomina el string
vector.3 <- c(2, 3, "c")
vector.3

vector.4 <- 1:5
vector.4

# seq(inicio, fin, salto)
vector.5 <- seq(1,5,0.4)
vector.5

vector.6 <- rep(2,6)
vector.6

# gl(k,n) donde k es el número de niveles o clases
# y n el número de repeticiones para cada nivel.
v1 <- gl(2,4, labels = c("Hombre", "Mujer"))
v1

# Extracción de elementos de un vector
vector.1[2]

# Eliminar elementos de un vector
vector.4[-5]

### Matrices y arrays #######################################################

#matrix(data  , nrow   , ncol , byrow )
# array(data, dim )

matriz <- matrix(c(1,2,36,9,5,2),ncol = 3, byrow = T)
matriz

arreglo <- array(c(rep(1,5),rep(3,5),2,6), c(2,3,2))
arreglo

# Conocer el número de elementos en la matriz
m <- matrix(data=5, nr=2, nc=2)
length(m)

# Conocer la dimensión de la matriz
dim(m)

# Asignar nombres a las columnas y a las filas.
rownames(m) = c("x1","x2")
colnames(m) = c("x1","x2")
m

# Extraer elementos de una matriz y un array
matriz[2,1]

arreglo[2,1,1]

# Reasignando los valores para los elementos de una matriz
m[1,1] = 1
m[2,2] = 4
m


## Data frame #####################################################
vec_1 <- 1:5
vec_2 <- c("a", "e", "i", "o", "u")
marco.datos <- data.frame(Numeros = vec_1, Letras = vec_2)
marco.datos

# Extraer elementos de una data frame
marco.datos[,1] # Se extrae solo la columna 1

# Se extrae elemento de la fila 2 columna 2 
marco.datos[2,2]

x <- 1:20
y <- rep(c("a", "b", "c", "d"),5)

df <- data.frame(x,y)

# Extracción de elementos de la columna y
df$y
df[,"y"]


## Listas(diccionario) ##############################################################

ec_1 <- 1:5
vec_2 <- c("a", "e", "i", "o", "u")
marco.datos <- data.frame(Numeros = vec_1, Letras = vec_2)
matriz <- matrix(c(1,2,36,9,5,2),ncol = 3, byrow = T)
arreglo <- array(c(rep(1,5),rep(3,5),2,6), c(2,3,2))

lista <- list(marco.datos, matriz, arreglo)

#Extraer el primer elementos de una lista
lista[1]
