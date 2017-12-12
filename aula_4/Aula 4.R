#### Aula 4 - Visualização de dados ####
### Prof. Vitor Rios ##


#Visualizar seus dados pode ser a parte mais importante da sua análise #####
#Fazer gráficos no R pode dar (muito) trabalho, mas os resultados valem a pena

#Gráficos no R são baseados em dispositivos. O dipositivo padrão é a tela, mas podem ser arquivos, cada tipo de arquivo gráfico sendo um dispositivo diferente

#No RStudio, gráficos são plotados na aba plots, mas podem ser abertos em janelas separadas, usando a função x11() (Linux e Windows),  windows() (Windows somente) ou quartz() (Macintosh)

#Os tipos padrão de gráficos disponíveis são postscript() para arquivo postscript, extensão .ps ou .eps
pdf() # salva o gráfico num arquivo .pdf
pictex() # salva o gráfico no formato LaTeX/PicTeX
xfig() # salva o gráfico no formato .XFIG
bmp() # salva um arquivo .bitmap (precisa de GhostScript instalado).
bitmap() # salva um arquivo .bitmap (precisa de GhostScript instalado).
X11() # plota numa janela via sistema gráfico X11
png() # salva o gráfico no formato .PNG tiff() salva o gráfico no formato .tiff jpeg() salva o gráfico no formato .jpg svg() salva o gráfico no formato .svg


#Gravando o gráfico num arquivo ####
# Chame o tipo de arquivo desejado, passando informações de tamanho, resolução, tipo de fonte, e nome de arquivo
png("SocialNetworkExample.png",width = 900,height = 900)

#plote seu gráfico normalmente, ele será escrito no arquivo e não irá aparecer na tela
plot(graph.subset,
     layout= layout_nicely(graph=graph.subset),
     vertex.label=NA,
     vertex.color=colors[membership(graph.subset.modulos)],
     vertex.size = 5,
)

#feche o dispositivo, usando dev.off(), senão o arquivo ficará corrompido
dev.off()


plot(x= iris$Sepal.Length, y=iris$Petal.Length,col=iris$Species)

#col=iris$Species #separa fatores por cores no gráfico
#col=c(7,2,18) # muda as cores 

colors() #mostra quantas cores o R aceita

#Função básica e poderosa (e feia): plot() ####
#feche o dispositivo, usando dev.off(), senão o arquivo ficará corrompido
dev.off()
x11()
plot(x= iris$Sepal.Length, y=iris$Petal.Length,col=iris$Species)
#or
plot(iris$Petal.Length ~ iris$Sepal.Length, col=iris$Species) # ~ significa y em funcao de x

library(ggplot2) #pacote especial para fazer graficos, com interface mais amigavel###
qplot(x= iris$Sepal.Length, y=iris$Petal.Length,col=iris$Species)

#A função plot() tem dezenas de opções para controlar cada detalhe mínimo do gráfico ####

#x	##valores a serem plotados em x	
#y	##valores a serem plotados em x	
#type	## tipo de gráfico (ponto, linhas, etc)	“p”,“l”,“b”…
#lty	##tipo de linha (pontilhada, tracejada, etc)	“blank”, “solid”, “dashed”, “dotted”, “dotdash”, “longdash”, ou “twodash”
#pch	##tipo de ponto (bola, triangulo, quadrado, etc)	“p”,“l”,“b”…
#col	##cor dos símbolos	“red”, “black”, “1”, RGB
#col.axis, col.lab, col.main	cor dos textos	“red”, “black”, “1”, RGB
#main	título do gráfico	“texto entre aspas”
#xlab	rótulos do eixo x	“texto entre aspas”
#ylab	rótulos do eixo y	“texto entre aspas”
#cex	tamanho das letras, em proporção	cex = 1 -> 100%, cex = 0.5 ->50%, etc
#cex.axis, cex.lab, cex.main	eixos, rotulos dos eixos, título	cex.axis = 1 -> 100%, cex.axis = 0.5 ->50%, etc
#bty	linhas de contorno do gráfico	“o”, “l”, “7”, “c”, “u”, “]”, “n”
#ylab	rótulos do eixo y	“texto entre aspas”
#ylab	rótulos do eixo y	“texto entre aspas”

plot(x= iris$Sepal.Length, y=iris$Petal.Length,col=iris$Species, col.axis= "pink")

legend(4.5,6,legend=c(unique(iris$Species))) #para adicionar legenda no gráfico
text (4.5,6,"teste") #adiciona texto dentro do gráfico

plot(x= iris$Sepal.Length, y=iris$Petal.Length,col=iris$Species, type="l") # type define pontos como linhas

plot(x= iris$Sepal.Length #valores de x
     ,y=iris$Petal.Length #valores de y
     ,col=iris$Species #colores os fatores com cores diferentes cores
     ,col.axis= "blue" #colore o nome dos eixos
     ,xlab= "eixo x" #nomeia o eixo x
     ,ylab="eixo y" #nomeia o eixo y
     ,main= "título do gráfico" #coloca um título para o gráfico
     ,cex=2 #define o tamanho do ponto no gráfico
     #,lwd= 2 #define a espessura da linha
     #,lty = "dotdash" #define o tipo de linha
     ,xlim=c(0,8) #limite do eixo x
     ,ylim= c(0,7) #limite de y
     #,xlim= range(iris$Sepal.Length) #pega a amplitude do tamanho dos dados (min e max)
     #,ylim= range(iris$Petal.Length) #pega a amplitude do tamanho dos dados (min e max)
     ,las= 1 #altera a posição do número do eixo (vertical, horizontal)
     ,bty= "l" #define o formato da caixinha do gráfico
     )

line() #altera o tipo de linha ou cor por fator no gráfico (eg. espécie analisada)

## Função par() e função axis() ####

par() #estabelece os parâmetros para todos os gráficos que se seguem a ela exceto parâmetros de intervalo de dados a serem plotado. Usada para definir gráficos com vários painéis, margens e área do gráfico. Usada antes de qualquer plot()

x11()
par(mfrow=c(1,2)
    #,cex= 0.5 #altera o tamamho dos pontos, letras e números no gráfico inteiro
    ) # número de linhas por número de colunas #mfrow permite fazer vários gráficos na mesma janela

plot(x=iris$Sepal.Length, y=iris$Petal.Length,        #primeiro gráfico
     col = iris$Species,                          
     main = "primeiro gráfico")     

plot(x=iris$Sepal.Length, y=iris$Sepal.Width,         #segundo gráfico
     col = iris$Species,                          
     main = "segundo gráfico")   

dev.off() #função reseta tudo alterado pelo par()

axis() #define todos os parâmetros para os eixos, usada depois de plot(dados, xaxt = "n") (para eixo x) ou  plot(dados, yaxt = "n") (para eixo y)
#yaxt= "n" #não plota o eixo no gráfico, deve ser escrito na função plot()
#xaxt="n"

axis(1,pos=0)

#fonte:https://www.rstudio.com/resources/cheatsheets/ #vários tutoriais

#Funções que adicionam elemento a gráficos ####
plot(x=iris$Sepal.Length, y=iris$Sepal.Width, col=iris$Species)

abline() #adiciona uma linha, definida por intercepto e inclinação, ou por valores de posição horizontal (h) e vertical (v)

#por exemplo:
abline(
  h=mean(iris$Petal.Length)
  ,col="red"
  )

abline(
  v=mean(iris$Sepal.Length)
  ,col="red"
)

abline(a=3 #add intercepto
       ,b=0.2 #add inclinação
       ,col="green"
       )

#segments((x0, y0, x1, y1) #adiciona um segmento indo de (x0,y0) até (x1,y1)
segments(x0=2, y0=2, x1=1, y1=1)
         
#arrows(x0, y0, x1 , y1 , length, angle = 30) #adiciona uma seta a um gráfico. lengthé o comprimento da seta e angle é o angulo da ponta da seta

arrows(x0=5.5, y0=3, x1=7, y1=2.5, angle=50)
         
#points(x, y, pch) #adiciona pontos nas coordenadas x e y. pch é o tipo de simbolo utilizado
points (x= 5, y= 2.5)         
         
plot(modelo) #informa 

### Para plotar médias com barras de desvio padrão ####
m1=mean(dragoes$y[dragoes$x=="aventureiros"]);m2=mean(dragoes$y[dragoes$x=="fazendeiros"]) #calcula a média
m3=mean(dragoes$y[dragoes$x=="vacas"]);m4=mean(dragoes$y[dragoes$x=="virgens"],na.rm = T) #calcula a média
s1=sd(dragoes$y[dragoes$x=="aventureiros"]);s2=sd(dragoes$y[dragoes$x=="fazendeiros"]) #calcula o desvio padrão
s3=sd(dragoes$y[dragoes$x=="vacas"]);s4=sd(dragoes$y[dragoes$x=="virgens"],na.rm = T) #calcula o desvio padrão
avg=c(m1,m2,m3,m4) #cria um objeto com as médias
sdev=c(s1,s2,s3,s4) #cria um objeto com os desvios padrão 
plot(x= 1:4, y= avg,cex=1.5,pch=16, col=1:4,ylim=range(c(avg-sdev, avg+sdev)))
arrows(x0=1:4, y0=avg-sdev, x1=1:4, y1=avg+sdev, length=0.05, angle=90, code=3)
abline(h=mean(avg), col="red")

## Bloxplot ####
boxplot(dragoes$y ~ dragoes$x, col=rainbow(length(dragoes$x)))

#A função boxplot permite comparar os intervalos de confiança 95% das medianas: se os entalhes não se sobrepuserem, há forte evidência de que as medianas são diferentes, usando notch=T
boxplot(dragoes$y ~ dragoes$x, notch=T)

## Função aggregate() ####
aggregate() #agrega os dados pelo nível de um fator

#aggregate(x, by, FUN, ...)
#x é a coluna do dataframe que ser quer agrupar
#by é a coluna que contém os níveis dos grupos que se quer usar
#FUN é a função que se quer aplicar nos grupos, sem parênteses

#example
media.por.comida = aggregate(x=dragoes$y,by = list(dragoes$x), FUN = mean, na.rm=T) #na.rm=T remove os na
media.por.comida = aggregate(x=dragoes$y,by = list(dragoes$x), FUN = sd, na.rm=T) #na.rm=T