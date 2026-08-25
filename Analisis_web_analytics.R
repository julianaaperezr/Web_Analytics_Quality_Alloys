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
