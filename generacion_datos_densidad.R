library(dplyr)
library(ggplot2)
library(scales)
library(readxl)

feb11 <- read_excel("densidad_edlin.xls", sheet = "febrero11")
abr11 <- read_excel("densidad_edlin.xls", sheet = "abril11")
jun11 <- read_excel("densidad_edlin.xls", sheet = "junio11")
ago11 <- read_excel("densidad_edlin.xls", sheet = "agosto11")
oct11 <- read_excel("densidad_edlin.xls", sheet = "octubre11")
dic11 <- read_excel("densidad_edlin.xls", sheet = "diciembre11")
feb12 <- read_excel("densidad_edlin.xls", sheet = "febrero12")
abr12 <- read_excel("densidad_edlin.xls", sheet = "abril12")
jun12 <- read_excel("densidad_edlin.xls", sheet = "junio12")
ago12 <- read_excel("densidad_edlin.xls", sheet = "agosto2012")
oct12 <- read_excel("densidad_edlin.xls", sheet = "octubre12")
dic12 <- read_excel("densidad_edlin.xls", sheet = "diciembre 2012")

datos<-bind_rows(abr11, abr12, ago11, ago12, dic11, dic12, feb11, feb12, jun11, jun12, oct11, oct12, dic12)

write.csv(datos, file = "densidad.csv")

