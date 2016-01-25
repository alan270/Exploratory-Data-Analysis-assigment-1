getwd() #Hay que tener mucho cuidado con el directorio en donde se encuentra R, ya que gracias a que lo puse en la misma raiz lo puedo llamar a R
#de la siguiente manera.
archivo <- "household_power_consumption.txt"
datos <- read.table(archivo, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")# esta sintaxis te permite leer el archivo, recordemos 
#que su sintaxis tiene muchas etiquetas pero utilizamos header, que nos permite decirle que el archivo contiene en la primera linea las variales
pedazodatos <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]#particionamos solamente los datos que utilizaremos para hacer el analisis, en este caso
#la grafica, lo que hacemos es que el vector de la fecha DATE, le guardamos el vector con los valores que estamos poniendo dentro del vector.
#str(subSetData)
podermundial <- as.numeric(pedazodatos$Global_active_power)#as.numeric es una funcion que solamente nos arroja valores numericos, en dado caso que tenga una letra
#nos imprimira un NA por default
png("plot1.png", width=480, height=480) #con esta sintaxis solamente estamos generando un archivo que contendra a la grafica, cabe mencionar que la sintaxis involucra
#solamente el nombre que tendra la grafica, asi como la altura y la anchura.
hist(podermundial, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") #especificaciones del histograma.
dev.off()#esta es para que se ejecute exitosamente el guardar tu archivo generado en la misma carpeta en donde se encuentra R.

#Anotaciones importantes, es que la funcion png te genera el archivo de inmediato que lo ejecutas, pero el necesario correr posteriormente la sintaxis
#ya sea del histograma o del plot que vas a haver, una vez que lo hayas corrido, tampoco lo podras ver, sino hasta que corras la funcion dev.off, con esta ya podras
#ver el archivo generado.
