#...............................................................................................
#................................. LECTURA DE FICHEROS .....................................
#......................................................................................

# https://datahub.io/core/airport-codes#python Descripción de la base de datos JSON
# https://datahub.io/core/world-cities Descripción de la base de datos CSV

### JSON ################################################

# Nos ubicamos en el directorio de trabajo
setwd('CurosCienciasDatos/01 - Mineria de datos/BasesDatos/')


#Instalamos el paquete necesario
#install.packages("jsonlite")

#Cargamos el paquete necesario
library(jsonlite)

#la base de datos ó la dirección de la pagina web en un string llamado url
url <- "aeropuertos.json" 

#Leemos la base de datos
db.aeropuerto <- fromJSON(url)


### CSV ###################################################

# read.csv() ó read.csv2() si el archivo es separado con ;

db.mayor.cities <- read.csv("majorCities.csv", header = TRUE, sep = ",",
                            stringsAsFactors = TRUE, na.strings=T, encoding = 'UTF-8', dec = '.')

### EXCEL ###################################################

# read.csv() ó read.csv2() si el archivo es separado con ;

library(readxl)
db.ventas <- read_excel('ventas.xlsx')





### SQL #########################################################

#Cargamos el paquete necesario
library(DBI)

# Creamos la coneccion a la base de datos
con <- dbConnect(odbc::odbc(), "MySQL Connection", timeout = 10)

# Listar las tablas
dbListTables(con)

# Realizar la consulta
res <- dbSendQuery(con, "SELECT * FROM personas")

#Traer todos los registro de la consulta
df.personas <- dbFetch(res)

# Escribir datos
dbWriteTable(con, "mtcars", mtcars)

### Leer docuemntos #########################################################

# Abrimos la conexión y leemos el archivo
con <- file("monthly.csv", open="r") 

# leemos el contenido del archivo
documento <- readLines(con) 

# Cerrar conección
close(con)


## Rdata y RDS #########################################################

clientes <- c("Juan","Pedro","Lucas")
fechas <- as.Date(c("2017-12-27","12-11-1","2018-1-1"))
pago <- c(315,192.55,40.15)
pedido <- data.frame(clientes,fechas,pago)

#Aguardando data frame tipo Rdata
save(pedido,file="Objeto1.Rdata") # Permite guardar mas de un archivo. 

#Guardando dataframe tipo rds
saveRDS(pedido,file="Objeto2.rds")

#Cargar objeto Rdata
load("Objeto1.Rdata")

#Cargar objeto RDS
readRDS("Objeto2.rds")

# Borrar un objeto de memoria
pedido <- data.frame(clientes,fechas,pago)
remove(pedido)
