#Buscar documentación sobre las funciones case() del paquete gdata y
#la función paste(). La forma de hacer esto es : ?paste y ?case

library(gdata)

TomaDatos<- function(NumeroPersonas = 5){
  Genero <- vector()
  Edad <- vector()
  Trabaja <- vector()
  Lenguaje <- vector()
  Interes <- vector()
  for (i in 1:NumeroPersonas) {
    Genero[i] <- readline("Por favor ingrese su genero (M/F) : ")
    Edad[i] <- as.integer(readline("Por favor ingrese su edad : "))
    Trabaja[i] <- readline("Se encuentra trabajando o a trabajado (s/n) : ")
    Lenguaje[i] <- readline("Cual es su lenguaje de programacion favorito: \na)Python\nb)R")
    Interes[i] <- readline("Cual es su mayor interes al estar en el semillero: \na) Programación \nb)Analítica de datos\nc)Inteligencia Artificial \nd)La comunidad ")
    revisa <- readline("Quiere revisar la información ingresada? (s/n): ")
    if (revisa == "s" || revisa == "S") {
      x <- paste("Genero: ", Genero[i]," " ,"Edad: ",Edad[i],"  ", "Trabaja",
                 Trabaja[i], "Lenguaje: ", case(Lenguaje[i], "Python"= "a","R"= "b"),
                 "  ", "Interes: ", case(Interes[i],"Programación"="a", "Analítica de datos"="b",
                                         "Inteligencia Artificial"="c", "La comunidad" = "d"))
      print(x)
      cat("Llame a el siguiente interesado")
    }
    else{
      cat("Llame a el siguiente interesado\n\n")
    }}
  Quiere <- readline("Que le gustaria hacer ahora: \na) Ver el data frame de la informaciòn\nb)Ver un resumen de la informaciòn ")
  if (Quiere == "a") {
    base <- data.frame(Genero,Edad,Trabaja,Lenguaje, Interes)
    base
  }
  else{
    H <- ifelse(Genero == "M" | Genero == "m" , 1, 0)
    f <- ifelse(Genero == "F" | Genero == "f", 1, 0)
    ho <- 0
    for (i in 1:length(H)) {
      ho <- ho + H[i]
    }
    
    fe <- 0
    for (i in 1:length(f)) {
      fe <- fe + f[i]
    }
    Edad1 <- 0
    for (j in 1:length(Edad)) {
      Edad1 = Edad[j] + Edad1 
      Edad1 = Edad1/length(Edad)
    }
    resumen <- list(EdadPromedio = Edad1, FrecuenciaGenero = data.frame(Hombres = ho, Mujeres = fe))
    resumen
  }
}
TomaDatos(2)
