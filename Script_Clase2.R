
## Curso de Introducción a R (I Edición)
## Organiza: SevillaR
## Scripts de clase

### Clase 2

#### data.frame

altura <- c(150, 135, 210, 140)
peso <- c(65, 61, 100, 65)
sexo <- c("F", "F", "M", "F")
datos.muestra <- data.frame(altura, peso, sexo)
datos.muestra

nrow(datos.muestra)
ncol(datos.muestra)
length(datos.muestra$altura)

datos.muestra$altura
datos.muestra[,"altura"]
datos.muestra[,1]

names(datos.muestra) 
colnames(datos.muestra)

rownames(datos.muestra) <- c("Marta", "Inés", "Juan", "Carmen")
datos.muestra
datos.muestra["Juan", "altura"] <- 205
datos.muestra

df <- datos.muestra[,-3]
df


apply(df, 2, mean) # Medias
apply(df, 1, function(ind){ind["peso"]/(ind["altura"]/100)^2}) # admite cualquier función (IMC)





#### Lectura de datos
library(tidyverse)

movies <- read_csv("movies.csv")
View(movies)

#### Funciones 
# data %>%
#   select( VARS ) %>%
#   filter( CONDICIÓN) %>%
#   slice( POSICIÓN ) %>%
#   mutate( VARS NUEVAS) %>%
#   group_by( VARS ) %>%
#   summarise( NUEVAS VARS GROUP) %>%
#   arrange( VARS ) %>%
#   count( VARS )

movies_nuestro <- movies %>% 
  select(Title, Rating, Year, Runtime, Filming_location, Budget, Income)


movies_nuestro %>% head()

library(skimr)
movies_nuestro %>% skim()  

## Runtime, budget, income son caracteres  
movies_nuestro %>% 
  mutate(Runtime = as.numeric(Runtime),
         Budget  = as.numeric(Budget),
         Income  = as.numeric(Income))

movies_nuestro <- movies_nuestro %>% 
  mutate(Runtime = extract_numeric(Runtime),
         Budget  = extract_numeric(Budget),
         Income  = extract_numeric(Income))

# Películas suspensas y aprobadas
movies_nuestro %>% 
  filter( Rating >= 5) %>% 
  count()
movies_nuestro %>% 
  filter( Rating < 5) %>% 
  count()
movies_nuestro %>% 
  filter( Rating < 5) %>% 
  arrange( desc(Rating) )

# ¿Peículas con más beneficios?
movies_nuestro %>% 
  drop_na() %>% 
  mutate(Benefit = Income - Budget) %>% 
  arrange( desc(Benefit) ) %>% 
  select(Title, Rating, Benefit)

# ¿Número de pelícuas y duración media de las películas por años?
movies_nuestro %>% 
  drop_na() %>% 
  group_by(Year) %>% 
  summarise(mean_Runtime  = mean(Runtime),
            number_movies = n() )




