#...............................................................................................
#................................. LECTURA DE FICHEROS .....................................
#......................................................................................

# https://datahub.io/core/airport-codes#python Descripción de la base de datos JSON
# https://datahub.io/core/world-cities Descripción de la base de datos CSV

### JSON ################################################

# Nos ubicamos en el directorio de trabajo
setwd('CurosCienciasDatos/01 - Mineria de datos/01 - Ficheros/BasesDatos/')


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
