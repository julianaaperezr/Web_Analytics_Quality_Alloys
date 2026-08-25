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
  ggtitle("Lbs. Sold over Time")
