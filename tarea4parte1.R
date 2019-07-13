rm (list = ls())

install.packages("rvest")
library(rvest)
pagina<- read_html("tarea4.html")

html_nodes(pagina,".verde")

nodesDelHTML <- html_nodes(pagina,".verde")

textoo<-html_text(nodesDelHTML)

textoo<-gsub("\n","",textoo)
textoo<-gsub("\r","",textoo)
textoo<-gsub("\t","",textoo)
textoo


#espacios 

Splitespacionoticia <- strsplit(textoo[2]," ")[[1]]
Splitespacionoticia <- tolower(Splitespacionoticia)
lNoticias<- ulist(Splitespacionoticia)

#tabla 
tablapalabra <-(lNoticias)
tablapalabra<- table(tablapalabra)
tablapalabra

#pasando la informacion a un data frame
palabrasN <- as.data.frame(tablapalabra)
##Almacenando la informacion en CSV
write.csv(palabrasN, file="Noticias.csv")

#extrayendo los emlementos que contiene las tablas
tablaProductos <- html_nodes(pagina, ".tabla")
tablaProductos




#Extraccion  en el contenido de la tablas usndo el tag table
Contenedordetabla <- html_nodes(tablaProductos, "table")
print(Contenedordetabla)

#extraccion tabla 1
tabla<- html_table(Contenedordetabla[[1]])
  print(tabla[1,2])
write.table(tabla, file="TAblaPag.csv",sep = ";")

