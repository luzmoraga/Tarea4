################TAREA NUMERO CUATRO DEGUNDA PARTE ##############


#De la pagina de Preunic se pretende extraer tabla de datos del producto, precios e información

#pagina a investigar 
Preunic<- "https://preunic.cl/"

PreunicRead<- read_html(Preunic)

PreunicProducto<-html_nodes(PreunicRead,".mbfix")

PreunicProducto <- html_text(PreunicProducto)

PreunicProducto <- gsub("Añadir al carro", " ", PreunicProducto)

#deglozar texto para su comprencion 


 <- gsub("Vista Previa", " ", PreunicProducto)

PreunicProducto


preunicP<- tolower(PreunicProducto)
unlistPreunic<- unlist(preunicP)

#eXtraer Tabla de Productos 

tablaProducto <-(unlistPreunic)
tablaProducto<- table(tablaProducto)
tablaProducto

#pasando la informacion a un data frame

dfPreunic <- as.data.frame(tablaProducto)

##Almacenando la informacion en CSV

write.csv(dfPreunic, file="ProductoPreunic.csv")