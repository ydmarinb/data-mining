# Nos ubicamos en el directorio de trabajo
setwd('CurosCienciasDatos/01 - Mineria de datos//')

# Abrimos la conexión y leemos el archivo
con <- file("Base_dificil_leer.txt", open="r") 

# leemos el contenido del archivo
documento <- readLines(con)# open()

# Cerrar conección
close(con)

library(stringr)



mes <- vector() 
anio <- vector()
contador.tablas <- 0
df <- data.frame(matrix(ncol = 3, nrow = 0))

for (linea in 1:length(documento)) {
  
  if (str_detect(pattern = "[a-zA-Z]+.[[:digit:]]+", documento[linea])) {
    mes <- append(mes, unlist(str_extract_all(documento[linea], "[[:alpha:]]+")))
    anio <- append(anio, unlist(str_extract_all(documento[linea], "[[:digit:]]+")))
    contador.tablas = contador.tablas + 1
  }
  if (str_detect(pattern = "[a-zA-Z]+,", documento[linea])) {
    titulos <- strsplit(x = documento[linea], split = ",")
  }
  if (str_detect(pattern = "[[:digit:]]+,", documento[linea])) {
    data <- strsplit(x = documento[linea], split = ",")
    data <- data[[1]]
    data[2] <- paste(anio[contador.tablas], mes[contador.tablas], data[2])
    colnames(df) <- titulos[[1]]
    df <- rbind(df, data)  
  }
  
}

df$dia <- as.Date(df$dia , format = "%Y %B %d")
