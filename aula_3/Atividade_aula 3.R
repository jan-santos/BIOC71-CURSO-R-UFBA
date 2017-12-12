######################################################
# Introdução Linguagem R                          ####
# Vitor Passos Rios                               ####
# Universidade Federal da Bahia                   ####
# https://github.com/vrios/Intro-Linguagem-R/wiki#####
######################################################

#diferencie a função source() da função load()
source () #Executa -> roda os comandos dentro do arquivo
load() #Carrega -> coloca o conteúdo do arquivo para dentro de um objeto

#baixe para seu diretório de trabalho o arquivo toroidal.distance.R, disponível
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv, disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv
distancias = read.csv("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv")

  
#Abra toroidal.distances.R no R
# O que você precisa fazer para que as funções contidas nesse arquivo estejam disponíveis para uso no R?


# Faça o procedimento que você descreveu acima
source("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R") 


# Dentro do script toroidal.distance.R, altere o nome da função toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo


# Carregue o arquivo distancias.csv para dentro do objeto distancias
#chame a função distance.matrix() com o objeto distancias, e o argumento tam = 100
distancias

distances.matrix = toroidal.distances

distances.matrix (distancias,100)


# O que aconteceu? calculou a função

# O que você precisa fazer para que você possa usar a função distance.matrix? carregar a função no R

# Salve o resultado do comando acima com o nome de matriz.distancias.csv
 write.csv(distances.matrix (distancias,100), #objeto a ser gravado
            file = "matriz.distancias.csv", #nome do arquivo que vai ser gerado
                        row.names = F #ignora nomes/numeros das linhas
  )

# Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD
#https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx (não abra o excel nem salve em .csv)
 library(writexl)
 library(readxl)
 
DnD = read_xlsx("dragoes.xlsx")

# Confira a estrutura do arquivo

str (DnD)
head (DnD)

# Há algum NA? houve algum problema com o cabeçalho?
#sim. Existe espaço, acento, parenteses, nomes compridos. 


# Refaça o script da aula 2, salvando o objeto caixeta, adicionando a coluna coletor e desvio, em um arquivo chamado caixeta_com_desvio.csv

caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)

mean.h = mean(caixeta$h)
mean.h
desvio = caixeta$h - mean.h
desvio
caixeta$desvio = desvio

write.csv(caixeta, file = "caixeta_com_desvio.csv")
