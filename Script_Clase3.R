
## Curso de Introducción a R (I Edición)
## Organiza: SevillaR
## Scripts de clase

### Clase 3
library(tidyverse)

#### Datos sobre la relación entre la temperatura en grados Celsius y 
#### la presión de vapor de mercurio en milímetros (de mercurio).
pressure %>% summary()

#### plot(x,y)
plot(pressure$temperature, pressure$pressure)
plot(pressure$pressure, pressure$temperature)
pairs(pressure)
plot(pressure, pch=21, col="blue", bg="lightblue")
plot(pressure, type = "b",
     ylim=c(-50,600), xlim=c(0,500),
     main = "Presión de vapor del Mercurio",
     xlab = "Temperatura (Cº)",
     ylab = "Presión (mm)",
     bty  = "n")
grid()
abline(h= 247, v=300, col="red", lty=2)
text(pressure, labels=1:nrow(pressure), cex=0.6, pos=1, col="blue")
# y más

#### ggplot()
#### https://r-graph-gallery.com/
pressure %>% 
  ggplot(aes(x=temperature, y=pressure)) +
  geom_point() + geom_line() + 
  theme_light()

#### Personalización
# install.packages("hrbrthemes")
library(hrbrthemes)
pressure %>% 
  ggplot(aes(x=temperature, y=pressure)) +
  geom_line(color="grey") +
  geom_point(shape=21, color="black", fill="#69b3a2", size=2) +
  theme_ipsum() +
  labs(title = "Presión del vapor de Mercurio",
       x = "Temperatura (Cº)",
       y = "Presión (mm)") 


#### Visualización encuesta ciudades
library(readr)
library(janitor)

ciudades <- read_csv("ciudades.csv")
ciudades %>% head()
preferencia_ciudades <- ciudades %>%
  select(-Timestamp) %>% 
  mutate(ID = 1:nrow(ciudades)) %>% 
  clean_names() %>% 
  pivot_longer(starts_with("ciudad")) %>% 
  mutate(puntos = rep(12:1, nrow(ciudades))) %>% 
  group_by(value) %>% 
  summarise(total = sum(puntos)) %>% 
  arrange(desc(total))

color_barra_in  <- "orange"
color_barra_out <- "red"
preferencia_ciudades %>%
  ggplot() +
  geom_col(aes(total, value), 
           fill  = color_barra_in, 
           color = color_barra_out,
           width = 0.5)
#### Filtrar ciudades y ordenación de las barras 
library(forcats)
preferencia_ciudades %>%
  filter(total>10) %>% 
  ggplot() +
  geom_col(
    aes(total, fct_reorder(value, total, .desc = FALSE)), 
          fill  = color_barra_in, 
          color = color_barra_out,
          width = 0.5) +
  labs(title = "Preferencias de ciudades por puntuación",
       subtitle = "1 a 12 puntos",
       x = "Puntos",
       y = "Ciudad") +
  theme_minimal()







