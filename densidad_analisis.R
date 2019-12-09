library(dplyr)
library(ggplot2)
library(scales)
library(readxl)
library(readr)

densidad <- read_csv("densidad.csv")
datos<-densidad[,2:7]

#Agrupación tomando como replica las tres áreas
datos_g<-group_by(datos, date, distance, Species, condition)

#promedio de densidad según condicion
densidad_promedio<-summarise(datos_g, burrows = mean(burrows, na.rm = TRUE))

#Total de agujeros (abiertos y cerrados) por cuadrante
densidad_total<-summarise(densidad_promedio, Total_burrows = sum(burrows, na.rm = TRUE))

#escala de tiempo
db<-seq.Date(min(densidad_total$date), max(densidad_total$date), by = "month")

db<-as.Date(c("2011-02-16", "2011-04-16", "2011-06-16", "2011-08-16", "2011-10-16", "2011-12-16",
       "2012-02-16", "2012-04-16", "2012-06-16", "2012-08-16", "2012-10-16","2012-12-16"))

#Densidad de agujeros totales
plot1<-ggplot(densidad_total, aes(x = date, y = Total_burrows))+
  geom_line()+
  scale_x_date(breaks=db, labels=date_format("%b %y"))+
  facet_grid(distance~Species, scales="free_y")+
  theme_bw()+
  xlab ("Timeline")+
  ylab (paste("Mean density of burrows by 10", expression(m^2)))+
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank())

plot1

### Gráfico global
#Agrupación tomando como replica las tres áreas
datos_g2<-group_by(datos, date, Species)

#promedio de densidad según condicion
densidad_promedio2<-summarise(datos_g2, burrows = mean(burrows, na.rm = TRUE), vari = sd(burrows, na.rm = TRUE))

plot1.1<-ggplot(densidad_promedio2, aes(x = date, y = burrows))+
  geom_line()+
  geom_point()+
  geom_errorbar(aes(ymin = burrows - b.sd, ymax = burrows + b.sd))+
  scale_x_date(breaks=db, labels=date_format("%b %y"))+
  facet_grid(.~Species, scales="free_y")+
  theme_bw()+
  xlab ("Timeline")+
  ylab (paste("Mean density of burrows by 10", expression(m^2)))+
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank())+
  geom_smooth(method = "lm")

plot1.1


plot1.2<-ggplot(densidad_promedio2, aes(x = date, y = burrows))+
  geom_line()+
  geom_point()+
  geom_errorbar(aes(ymin = burrows - b.sd, ymax = burrows + b.sd))+
  scale_x_date(breaks=db, labels=date_format("%b %y"))+
  facet_grid(.~Species, scales="free_y")+
  theme_bw()+
  xlab ("Timeline")+
  ylab (paste("Mean density of burrows by 10", expression(m^2)))+
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank())
plot1.2
#

plot1.3<-ggplot(densidad_total, aes(x = date, y = Total_burrows))+
  geom_point()+
  scale_x_date(breaks=db, labels=date_format("%b %y"))+
  facet_grid(.~Species)+
  theme_bw()+
  xlab ("Timeline")+
  ylab (paste("Density of burrows by 10", expression(m^2)))+
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank())+
  geom_smooth(method = "lm")

plot1.3


##
#Agrupación tomando como replica las tres áreas
datos_g2<-group_by(datos, date, Species, condition)

#promedio de densidad según condicion
densidad_promedio2<-summarise(datos_g2, burrows = mean(burrows, na.rm = TRUE))

plot2<-ggplot(densidad_promedio2, aes(x = date, y = burrows, colour = condition))+
  geom_line()+
  scale_x_date(breaks=db, labels=date_format("%b %y"))+
  facet_grid(.~Species, scales="free_y")+
  theme_bw()+
  xlab ("Timeline")+
  ylab (paste("Mean density of burrows by 10", expression(m^2)))+
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank())+
  geom_smooth(method = "lm")

plot2



