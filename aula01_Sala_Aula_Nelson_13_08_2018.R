### Analytics
## Aula 1
## Prof. Neylson Crepalde
## Aluno: Nelson de Campos Nolasco
##########################

# Se as bibliotecas necessárias não estiveram instaladas, instale
if (!"readr" %in% installed.packages()) install.packages("readr")
if (!"dplyr" %in% installed.packages()) install.packages("dplyr")
if (!"ggplot2" %in% installed.packages()) install.packages("ggplot2")
if (!"haven" %in% installed.packages()) install.packages("haven")
if (!"descr" %in% installed.packages()) install.packages("descr")

# Carregando as bibliotecas necessárias
library(readr)   # leitura de Banco de Dados
library(dplyr)   # Manipulação de Dados
library(ggplot2) # Gráficos
library(haven)   # Leitura de Banco de Dados de outros softwares
library(descr)   # Análises Descritivas

# Carrega uma amostra da PNAD 2014

bd = read_sav("https://github.com/neylsoncrepalde/MODUS/blob/master/PNAD2014_30a50_novo4.sav?raw=true")#Sav pois é banco de dados do SPSS
dim(bd)
names(bd) # nomes das variáveis
head(bd) # cabeças das variáveis
tail(bd) # Últimos valores das variáveis

### INVESTIGANDO ANOSESCO E ESCPAI
###
class(bd$anosesco) # variaveis numéricas com casas decimais (Contínuas: 'renda, peso, altura') + (Intervalar: intervalos) /// integer não decimais
summary(bd$anosesco) # Média, Mediana, Min, Max, 1º e 3º quartis DO INDIVIDUO

class(bd$escpai) # variaveis numéricas com casas decimais da varíavel escolaridade do pai
summary(bd$escpai) # Média, Mediana, Min, Max, 1º e 3º quartis DO PAI

cor(bd$anosesco, bd$escpai) #Correlação escolaridade indivíduo e pai

### Gráfico de Dispersão de Anosesco e Escpai
plot(bd$escpai, bd$anosesco)

ggplot(bd, aes(x = escpai, y = anosesco)) + geom_point() +
  labs(x = "escolaridade do pai", y = "Anos de Escolaridade", title = "Dispersão") # banco de dados, estética, tipo de gráfico

##########
## Visualizar a distribuição de anosesc e escpai usando o R base (Histograma)

hist(bd$anosesco)
hist(bd$escpai)

ggplot(bd, aes(anosesco)) + geom_histogram()
ggplot(bd, aes(escpai)) + geom_histogram()

ggplot(bd, aes(anosesco)) + geom_histogram(bins =10) # (bins) Com 10 colunas
ggplot(bd, aes(escpai)) + geom_histogram(bins = 5) # (bins) com 5 colunas

