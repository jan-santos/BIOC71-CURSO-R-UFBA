
######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#quando possível, sua resposta deve ser um código do R

#####Trabalhando com dados#####
# o que é um dataframe? Qual a diferneça entre um dataframe e um list?
#data.frame é uma tabela (coluna e linhas), matriz para valores de classes diferentes, e lista é um conjunto de objetos

10*3


#o que queremos dizer quando dizemos uma função "retorna" alguma coisa?
#O que gera como resposta no console apos cumprir uma ordem dada

#o que a função summary() faz?
#Funcao que retorna info sobre o objeto (estatistica sumaria). P.ex. variaveis, classe dos objetos, numero de celulas, min, mean, max, 1st qu, 3rd qu, 

#Três áreas foram submetidas aplicação de três adubos diferentes, e uma foi
#mantida como controle. A biomassa seca (kg) por parcela foi medida para
#verificar se houve efeito do adubo. Os dados obtidos foram:

#(Controle)	A	37	34	36	42	31  33
#B	62	54	57	64	60
#C	63	58	60	62	61 44
#D	41	37	38	49	35 49
#Crie um dataframe com estes dados

A = c (37,	34,	36,	42,	31,  33)
B = c (62,	54,	57,	64,	60)
C = c (63,	58,	60,	62,	61, 44)
D = c (41,	37,	38,	49,	35, 49)

tratamento = c(rep("A_controle",6), rep("B",5), rep("C",6), rep ("D",6))

biomassa = data.frame (x= tratamento, y= c (A, B, C, D))


#Calcule a média de cada tipo de adubo, sem usar summary(), usando o dataframe

meanA = mean(biomassa[1:6,2])
meanB = mean(biomassa[7:11,2])
meanC = mean(biomassa[12:17,2])
meanD = mean(biomassa[18:23,2])

#ou

meanA = mean(biomassa$y[biomassa$x == "A_controle"])
meanB = mean(biomassa$y[biomassa$x == "B"])
meanC = mean(biomassa$y[biomassa$x == "C"])
meanD = mean(biomassa$y[biomassa$x == "D"])

#que você criou acima
#calculei a media para cada tratamento diretamente da tabela.

#que problemas você teve ao fazer o exercício acima?
#problemas em como colocar os argumentos de modo correto para calcular a media diretamente do data.frame

# O que a função unique() faz?
#conta quantos nomes diferentes aparecem, ignorando as repeticoes

#Usando o conjunto de dados caixeta.csv, disponivel em
#http://ecologia.ib.usp.br/bie5782/doku.php?id=dados:dados-caixeta, calcule
#quantas espécies estão presentes na coluna especie. Para ler o arquivo, execute
#o código abaixo
caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
# o arquivo deve estar no seu diretório de trabalho
str(caixeta) #o que este comando faz? info de estrutura do data.frame
summary(caixeta) #sumariza info principais (estatistica descritiva)

#podemos criar uma coluna a mais no nosso dataframe apenas dizendo ao R o que
#colocar lá. Por exemplo, criamos uma coluna com o nome do coletor do dado
caixeta$coletor= "Darwin" #regra da reciclagem
str(caixeta)

#agora adicione no objeto caixeta uma coluna chamada "desvio" com o quanto a
#altura de cada árvore difere da média de todas as árvores
mean.h = mean(caixeta$h)
mean.h
desvio = caixeta$h - mean.h
desvio
caixeta$desvio = desvio

#or 

caixeta$desvio = caixeta$h - mean(caixeta$h)

#Em matrix n?o pode usar $ por isso tem que usar as funcoes:
cbind() #cbind(x,y) sendo x o objeto que vai receber e o y objeto que vai ser inserido, insere uma coluna de um vetor na matrix ou data.frame
rbind() #rbind(x,y) sendo x o objeto que vai receber e o y objeto que vai ser inserido, insere uma linha de um vetor na matrix ou data.frame

#Usando a função table(), conte quantos indivíduos de cada espécie existem
table(caixeta$especie)

#A função table() também pode contar por espécie em cada local, depois por local
#em cada espécie). Como?
table(caixeta$especie, caixeta$local)
table(caixeta$local, caixeta$especie)

#crie um objeto chamado pequenas que contenha todas as árvores com altura (h)
#menor que um metro.(Os dados no arquivo estão em centímetros)
pequenas = caixeta[caixeta$h < 100,]

#crie um objeto chamado grandes que contenha todas as árvores acima de 3 metros
grandes = caixeta[caixeta$h > 300,]
  
#crie um objeto chamado medias que todas as árvores com alturas entre um metro e
#tres metros
medias = caixeta[caixeta$h >= 100 & caixeta$h < 300,]

#agora em uma linha de comando, crie um objeto que contenha a quantidade de
#árvores pequenas, médias e grandes, separadamente

quantidade = c(length(pequenas$local), length (medias$local), length (grandes$local))

dim(pequenas) #mostra o numero de objetos em data.frame com x dimens?es (linhas por coluna)

#Crie um objeto chamado obj somente com os individuos de "Alchornea
#triplinervia" Em quantas localidades esta espécie ocorre? Qual comando para
#encontrar essa informação?

obj = caixeta[caixeta$especie == "Alchornea triplinervia",]

table(caixeta$especie == "Alchornea triplinervia", caixeta$local)

#or 

table(obj$local)

#podemos remover dados de um dataframe, usando o sinal de menos

caixeta.sem.tabebuia = caixeta[ - which(caixeta$especie=="Tabebuia cassinoides"),]

unique(caixeta.sem.tabebuia$especie)

#agora crie um objeto removendo todas as "Tabebuia cassinoides" do local retiro
#(somente do local retiro)

caixeta.sem.retiro = caixeta [!(caixeta$local == "retiro" & caixeta$especie == "Tabebuia cassinoides"),] #exclamacao (!) eh nao, nao pega o que cumprir a condicao

#crie os objetos abaixo, junte eles num dataframe de duas colunas chamado comNA,
#depois crie um novo objeto chamado semNA, removendo todas as linhas que
#contenham NA, usando a notação acima (dica: só se usa "" para valores do tipo
#character)
id = 1:80
a = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998,
      NA, 111.07215, 113.74047, 103.16081, 80.87149, 98.66692,
      65.09549, 155.74965, 88.30168, 147.43610, 114.60806, 109.87433,
      149.54772, 83.54137
)
b = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058,
      79.98952, 79.18127, 840.1635, 74.86860, 82.01886, 78.26936,
      77.94691, 78.75372, 77.64901, NA, 77.19803, 72.48175,
      83.45336, 78.99681
)
c = c(127.9366, 201.7158, NA, 136.5880, 131.7213, 118.1486,
      125.7534, 139.6544, 163.5890, 139.7455, NA, 141.4450, 110.7311,
      157.5921, 176.8437, 102.8659, 121.8286, 134.7097, 157.1392, 166.7133
)
d = c(191.3721, 216.1671, 165.4380, 196.2730, 172.6565, 178.2955,
      193.6687, NA, 160.2968, 208.4400, 204.0934, 208.1798,
      186.6380, 193.9446, NA, 198.6853, 213.8838, 210.1881,
      209.9109, 210.9228
)

comNA = data.frame(x= id, y= c(a,b,c,d))

semNA = comNA[!is.na(comNA$y),]
#or
semNA2 = na.omit(comNA)

#Abaixo temos dados de tamanho de mandíbula de chacal dourado. Crie um dataframe
#com esses dados. Qual a média por sexo? E para a espécie? Guarde estes valores
#em tres objetos diferentes.
#machos: 120 107 110 116 114 111 113 117 114 112
#femeas: 110 111 107 108 110 105 107 106 111 111 Quantos machos têm a mandíbula
#maior do que a média das fêmeas?

machos = c(120, 107, 110, 116, 114, 111, 113, 117, 114, 112)
femeas = c(110, 111, 107, 108, 110, 105, 107, 106, 111, 111)
chacais = data.frame (x= machos, y= femeas)
mean.m = mean(chacais$x)
mean.f = mean(chacais$y)
mean.sp = mean(c(chacais$x, chacais$y))

machos.grandes = machos [chacais$x > mean.f]
#or
machos.grandes2 = chacais$x [chacais$x > mean.f]


#escreva **uma** linha de código que testa se um número é par, e caso seja,
#manda uma mensagem dizendo "par". dica: use a função %% (resto da divisão, ou
#remainder em inglês) e a função message() #funcao serve para q o R grite algum texto 

if(8 %% 2 == 0){message("par")} #se o resto de oito dividido por 2 for igual a zero (8 %% 2 == 0), grite para message("par")

#other examples
if(x > 4* mean(dados)){dados[-x]} # se x for maior do que 4 vezes as medias do dados, retire o valor x dos dados

#agora crie um código  como acima, mas que diga "par" se for par e "impar" se
#for impar. Dica: leia sobre as funcoes else e ifelse
if(8 %% 2 == 0){message("par")} else {message("impar")}
if(7 %% 2 == 0){message("par")} else {message("impar")}

#crie um ciclo (for) que mostre o console todos os inteiros de 1 ate 10, um por um:
for (i in 10:1){
  message(i)
}

#exemplo:
for (i in 5:10){
  a = i^2 
  message(a)
  }    #5^2 = 25, 6^2= 36... 10^2= 100
#i ? chamado de ?ndice (contador). Pode ser qualquer letra ou express?o, ? utilizado para contar quantas vezes o la?o foi executado
#1:10 1 ? o valor inicial de i, 10 ? o valor final.
#(i in 1:10) significa comece com i = 1, e v? aumentando de um em um at?  1 = 10
#O bloco entre {} ser? executado enquanto a condi??o for verdadeira

#exemplo:
arquivos = list.files()  #l? os nomes dos arquivos no diret?rio de trabalho)
for (i in 1:length(arquivos)) {
  # resultados[i] = read.csv(arquivos[i])
  message(arquivos[i])
}
#exemplo:
for(i in 1:length(dragoes$y)){
  a= dragoes$y[i]
message (a)
}

#for() para plotar em serie
cx = caixeta[,-1]
cx = cx [,-6]
for(i in 1:length(cx)) {
  x11 
  plot(cx[i,1])}

#exemplo
niveis = levels(dragoes$x)
i = 1
for (i in 1:length(niveis)) {
  nome = paste("figuras/", niveis[i], ".png")  #prepara o nome do arquivo
  png(filename = nome)  #prepara para gravar arquivo tipo png
  plot(dragoes[dragoes$x == niveis[i], ]$y)  #escreve o arquivo
  dev.off()  #salva o arquivo
}

#crie um ciclo (for) que some todos os inteiros de 25 ate 43, guardando esses
#valores num objeto soma (dica: crie o objeto soma com valor zero antes do
#codigo do ciclo)
soma = 0

for(i in 25:43){
  soma = soma + i
  message(soma)
}

#####Desafio level Hard#####
#Escreva um codigo que escreva os numeros de um a 100, com as seguintes
#condicoees:
#Se o numero for multiplo de 3, ao inves do digito, escreva "Fu". 
#Se o numero for multiplo de 5, ao inves do digito, escreva "ba". 
#Para numeros que forem multiplos tanto de 3 quanto de 5, escreva "Fuba".
#A melhor solução ganha um chocolate

for(i in 1:100){
  if (i %% 5 == 0 | i %% 3 ==0) {message("fuba")
  } else if (i %% 5 == 0) {message("ba")
  } else if (i %% 3 == 0){message("fu")
  } else message(i)
}


