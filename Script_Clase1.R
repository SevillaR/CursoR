
## Curso de Introducción a R (I Edición)
## Organiza: SevillaR
## Scripts de clase

### Clase 1

#### R como calculadora

3+4
log(10)
abs(-2) == abs(2)
6<5
x <- 3+4  
x  
y = 2+6
y
x+y
z <- c(x,y)
z
mean(z)
w <- mean(z)
w
round(w, digits=0)


##### Vectores

v1 <- 1:5
v2 <- c(2,3,4,5,6,5,5,5,4,3,2,2)
length(v1)
length(v2)
# Acceder a elementos del vector
v1[1];v1[length(v1)]
v2[1];v2[length(v2)]
# min, max, range, mean...
v3 <- c(2,3,4,5,6,5,5,5,4,3,2,2)
max(v3)
which.max(v3)
min(v3)
which.min(v3)
which(v1<3)
summary(v3)


##### Tipos de elementos

x <- c(1,2,3,4)    
class(x)   
y <- c(1L,2L,3L)   
class(y)
z <- c("a","b")
class(z)
w <- c(TRUE, F) 
class(w) 
# Existen otros
t <- c(1+2i, 1+3i)
class(t)
# Cuidado, si combinamos R lo convierte todo a la clase más general
o <- c(1,"a",T)
o
class(o) 

##### Factores

v1 <- c(2,3,4,5,6,5,5,5,4,3,2,2)
f1 <- factor(v1);f1
f2 <- factor(c(rep("T",5),rep("F",7),rep("NS/NC",3))); f2
f2 <- factor(c(rep("T",5),rep("F",7),rep("NS/NC",3)), 
             levels = c("Si","No","A lo mejor")); f2 
f2 <- factor(c(rep("T",5),rep("F",7),rep("NS/NC",3)), 
             labels = c("Si","No","A lo mejor")); f2
f2 <- factor(c(rep("T",5),rep("F",7),rep("NS/NC",3)), 
             levels = c("T","F", "NS/NC"),
             labels = c("Si","No","A lo mejor")); f2
table(f2)

num <- c(10, 0, 4, 8, 5, 22)
interv <- cut(num, breaks = c(0, 5, 10, 30), right=F); interv
interv <- cut(num, breaks = 4); interv
interv <- cut(num, breaks = 4, include.lowest = TRUE); interv
interv <- cut(num, breaks = c(0, 5, 10, 30), order=T,
              labels = c("Poco","Bastante","Mucho")) ; interv
interv <- cut(num, breaks = c(0, 5, 10, 30), order=T,
              labels = c("Poco","Bastante","Mucho"), 
              include.lowest = TRUE) ; interv
which("Poco" < interv )

v1 <- factor( c(2,3,4,5,6,5,5,5,4,3,2,2) )
v2 <- factor( c(1:6,1:6) )
table(v1,v2)

fc <- factor(c("Muchos", "Pocos", "Pocos", "Bastantes"),
             levels = c("Pocos", "Bastantes", "Muchos"),
             ordered = TRUE) ; fc
ordered(c("Muchos", "Pocos", "Pocos", "Bastantes"),
        levels = c("Pocos", "Bastantes", "Muchos"))
sum(fc < "Muchos")


#### Listas
  
familia <- list(hombre = "Pedro",
                mujer = "María",
                casados = TRUE,
                número.hijos = 3,
                edad.hijos = c(4, 7, 9))
familia
length(familia)
# Un elemento específico de la lista: el operador $
familia$hombre; familia$mujer; familia$casados
# Una sublista de la lista: el operador [.
familia[c("hombre", "mujer", "casados")]
# Diferencia entre los dos operadores anteriores:
familia$edad.hijos
familia["edad.hijos"]
### Modificación de los elementos de una lista
familia$edad.hijos <- c(5, 8, 10)
familia
familia["edad.hijos"] <- list(c(6, 9, 11))
familia

#### Matrices
  
M1 <- matrix(data = NA,3,3)
M1
M1[2,3]
M1[3,2]
M1[3,2] <- 3; M1[1,1] <- 0
M1 %>% is.na()
M1[is.na(M1)] <- 1
M1
M2 <- 1:12
dim(M2) <- c(4,3)
M2
M3 <- matrix(c(2,3,4,5,6,5), 3,2)
M3
M4 <- matrix(c(2,3,4,5,6,5,5,5,4,3,2,2), 3,4, byrow = T)
M4
### M[filas,columnas]
M4[,2]
M4[1,]
M4[2:3,1:2];M4
M4[c(T,T,F),c(F,T)];M4

  
#### Matrices
### Operaciones
M1  *  M1 #componente a componente
dim(M2)
dim(M3)
# M3 %*% M2 #producto matricial
M2 %*% M3
# +,-,...
M1
diag(M1)
t(M1)
det(M1)
mean(M1)
M1
rowMeans(M1); apply(M1, 1, mean)
colMeans(M1); apply(M1, 2, mean)
rowSums(M1); apply(M1, 1, sum)
colSums(M1); apply(M1, 2, sum)
M1<1

#### Bucles
# if (CONDICIÓN) {CONSECUENCIA} else {ALTERNATIVA}
if (TRUE) {
  mean(rnorm(x))
} else {
  mean(rnorm(1000, 10, 1)) }
valores <- rbinom(10, 1, 0.5); valores
ifelse(valores, "uno", "cero")
## for (var in vector){ expr }
for(n in c(2,5,10,20,50)) {
  x <- stats::rnorm(n)
  cat(n, ": ", sum(x^2), "\n", sep = "")
}
## while (condición) expr
i <- 1
while (i < 6) {
  print(i)
  i = i+1
}
### functions
sumaimp <- function (n) {sum(seq(1, n, by = 2))}
sumaimp(5)
sumaimp <- function (n) {
  if (identical(n %% 2, 0)) {
    warning("Cuidado, ", n, " es par");
    return(0) };
  sum(seq(1, n, by = 2)) }
sumaimp(5)
sumaimp(6)


