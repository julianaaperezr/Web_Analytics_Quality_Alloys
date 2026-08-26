# CASO WEB ANALYTICS AT QUALITY ALLOYS, INC.
# Juliana Perez Romero, Veronica Sandoval y Camila Salamanca 

# Analisis cuantitativo

# Cargar librerias
library(tidyverse)
library(readxl)

# Importacion de las 5 hojas 
# Para leer el archivo excel, sheet le dice a R cual hoja queremos importar
weekly_visits <- read_excel("Web_Analytics.xls", 
                            sheet = "Weekly Visits",
                            skip = 4) # Para que ignore las primeras (4) filas del excel antes de empezar a leer porque estaba leyendo mal los nombres de las variables
financials <- read_excel("Web_Analytics.xls", 
                         sheet = "Financials",
                         skip = 4)
lbs_sold <- read_excel("Web_Analytics.xls", sheet = "Lbs. Sold")
daily_visits <- read_excel("Web_Analytics.xls", sheet = "Daily Visits")
demographics <- read_excel("Web_Analytics.xls", sheet = "Demographics")

# Exploracion inicial de las bases de datos

# Head permite ver las primeras observaciones 
head(weekly_visits)
head(financials)

# Muestra la estructura de la base y el tipo de cada variable 
str(weekly_visits)
str(financials)

# Identificacion de los periodos del caso
weekly_visits

# PREGUNTA 1: Graficos de las variables a traves del tiempo
# Unique Visits
ggplot(weekly_visits, aes(x = `Week (2008-2009)`, y = `Unique Visits`)) +
  geom_col() +
  ggtitle("Unique Visits over Time")

# Revenue
ggplot(financials, aes(x = `Week (2008-2009)`, y = Revenue)) +
  geom_col() +
  ggtitle("Revenue over Time")

# Profit
ggplot(financials, aes(x = `Week (2008-2009)`, y = Profit)) +
  geom_col() +
  ggtitle("Profit over Time")

# Lbs. Sold
ggplot(financials, aes(x = `Week (2008-2009)`, y = `Lbs. Sold`)) +
  geom_col() +
  ggtitle("Pounds Sold over Time")

# PREGUNTA 2: Estadisticas descriptivas por periodo
datos_analisis <- data.frame(
  Visits = weekly_visits$Visits,
  Unique_Visits = weekly_visits$`Unique Visits`,
  Revenue = financials$Revenue,
  Profit = financials$Profit,
  Lbs_Sold = financials$`Lbs. Sold`
)

datos_analisis

# Identificacion de los 4 periodos
# En la variable periodo se asigno cada grupo de filas segun los periodos indicados en el excel
# La variable Periodo, le indica a R a cual etapa pertenece cada observacion 
datos_analisis$Periodo <- NA

datos_analisis$Periodo[1:14] <- "Pre Promotion"
datos_analisis$Periodo[15:35] <- "Initial Shakedown"
datos_analisis$Periodo[36:52] <- "Promotion"
datos_analisis$Periodo[53:66] <- "Post Promotion"

datos_analisis

# Para contar cuantas observaciones hay en cada categoria 
table(datos_analisis$Periodo)

# Estadisticas descriptivas
estadisticas <- datos_analisis %>%
  group_by(Periodo) %>%
  summarize(
    # Estadisticas descriptivas de Visits
    media_visits = mean(Visits),
    mediana_visits = median(Visits),
    desviacion_visits = sd(Visits),
    minimo_visits = min(Visits),
    maximo_visits = max(Visits),
    
    # Estadisticas descriptivas de Unique Visits 
    media_unique = mean(Unique_Visits),
    mediana_unique = median(Unique_Visits),
    desviacion_unique = sd(Unique_Visits),
    minimo_unique = min(Unique_Visits),
    maximo_unique = max(Unique_Visits),
    
    # Estadisticas descriptivas de Revenue
    media_revenue = mean(Revenue),
    mediana_revenue = median(Revenue),
    desviacion_revenue = sd(Revenue),
    minimo_revenue = min(Revenue),
    maximo_revenue = max(Revenue),
    
    # Estadisticas descriptivas de Profit
    media_profit = mean(Profit),
    mediana_profit = median(Profit),
    desviacion_profit = sd(Profit),
    minimo_profit = min(Profit),
    maximo_profit = max(Profit),
    
    # Estadisticas descriptivas de Lbs. Sold
    media_lbs = mean(Lbs_Sold),
    mediana_lbs = median(Lbs_Sold),
    desviacion_lbs = sd(Lbs_Sold),
    minimo_lbs = min(Lbs_Sold),
    maximo_lbs = max(Lbs_Sold)
  )

# Para poder visualizar las variables y los periodos para hacer la comparacion 
view(estadisticas)

# PREGUNTA 3: Graficos de las medias por periodo
# Para organizar los periodos temporalmente y no alfabeticamente 
estadisticas$Periodo <- factor(
  estadisticas$Periodo,
  levels = c("Initial Shakedown",
             "Pre Promotion",
             "Promotion",
             "Post Promotion")
)

# Para Mean Visits por periodo
ggplot(estadisticas, aes(x = Periodo, y = media_visits)) +
  geom_col() +
  ggtitle("Mean Visits by Period")

# Para Mean Unique Visits por periodo
ggplot(estadisticas, aes(x = Periodo, y = media_unique)) +
  geom_col() +
  ggtitle("Mean Unique Visits by Period")

# Para Mean Revenue por periodo
ggplot(estadisticas, aes(x = Periodo, y = media_revenue)) +
  geom_col() +
  ggtitle("Mean Revenue by Period")

# Para Mean Profit por periodo
ggplot(estadisticas, aes(x = Periodo, y = media_profit)) +
  geom_col() +
  ggtitle("Mean Profit by Period")

# Para Mean Lbs. Sold por periodo
ggplot(estadisticas, aes(x = Periodo, y = media_lbs)) +
  geom_col() +
  ggtitle("Mean Lbs. Sold by Period")
