######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando o R como calculadora#####

#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores

# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo

34 - 72.3 #subtrae os valores

# use pontos como separador de decimal. O que acontece se você usar virgula?
34 - 72,3 #erro no separador ","


78 / 3 #divide
2 ^ 3 #potência de 2 elevado à 3
3 * 2 #multiplica 3 por 2
sqrt(2) #raiz quadrado de 2
pi #recupera o pi
log(x = 3,base = 10) #log de 3 na base 10
exp(x = 1) #exponencial de 1

#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui? 
# os valores dentro dos parenteses sao argumentos de uma funcao
# o simbolo igual eh um atribuidor

#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 #cria o "objeto1"
objeto1 #mostra quem é o "objeto1"
objeto = 42 #cria o "objeto2"
objeto #mostra quem é o "objeto2"
objeto.2 <- 42 #cria o "objeto.2"
objeto.2 #mostra quem é o "objeto.2"

# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa?
# os símbolos são atribuidores

objeto.cubico <- objeto^3 #cria o "objeto.cubico" igual a objeto elevado ao cubo
resultado.1 <- (objeto.cubico / 3) + 7 #cria "resultado.1" igual ao "objeto.cubico" dividido por 3 somado a 7
objeto.texto <- "texto sempre vem entre aspas" #cria o objeto do tipo texto
objeto.texto
objeto.texto.2 <- "42" #cria o objeto.texto.2 igual ao texto "42"

objeto.vetor.1 = 1:34 #cria o vetor1 igual a sequência de 1 a 34
objeto.vetor.1
objeto.vetor2 = c(1, 74.5, 48) #cria o vetor1 com os valores 1, 74.5, 48 
objeto.vetor2

?seq #buca ajuda sobre a funcao seq
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) #cria o objeto vetor3 que é uma sequência de
#20 a 30 de 0.5 em 0.5

#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media
var(objeto.vetor3) #variancia
median(objeto.vetor3) #mediana
min(objeto.vetor3) #mínimo
max(objeto.vetor3) #máximo
diff(objeto.vetor3) #calcula a diferença entre os elementos sucessivos do vetor

# R também faz comparações entre objetos
42 > 7 #confere se 42 é maior do que 7
objeto == objeto.2 #verifica se os objetos são exatamente iguais
objeto == objeto.texto.2 #verifica se os objetos são exatamente iguais
# o que aconteceu acima? gerou um vetor lógico para dizer se os objetos são exatamente iguais
7.1 <= 7.001 #verifica se o 7.1 é menor ou igual a 7.001
?"<" #pesquisa sobre o operador ">"

#pedindo ajuda
?pi #constante
?log #logaritimo é uma função
??lm #pesquisa todas os códigos que possuem "lm"
help(log) #pesquisa dobre o log
help.search("anova") #pesquisa todos os códigos relacionados a anova

#####Arquivos e diretórios#####
# Como você descobre o diretório de trabalho?
getwd()

# Como você lista o conteúdo do diretório de trabalho?

# Como você define o diretório de trabalho?
setwd()

# Como você carrega um arquivo de script?
source() #essa funcao executa um script

# Como você salva os objetos que criou?
save.image() #is just a short-cut for ‘save my current workspace’
(q()) #Somente quando voce da o comando de sair (q()) eh que o R lhe pergunta se voce deseja gravar o seu workspace
#Se você responde 'y', o R grava um arquivo chamado .RData4) em seu diretório de trabalho. Na próxima vez que o R for chamado desse diretório, 
#o conteúdo do arquivo .RData será carregado para o “workspace”

# Como você carrega os objetos que criou?
load()  #Reload datasets written with the function save
#or
attach() #The database is attached to the R search path

# Como ver que objetos estão na sua área de trabalho?
ls()

# Como remover objetos da área de trabalho?
rm()

##### Lidando com erros#####
# O que acontece quando você digita os comandos abaixo? Como consertar cada erro?
objetol #objeto n?o encontrado
objeto .texto  #erro por causa do espa?o
Objeto #objeto n?o encontrado
source("chuchu.R") 
source(chuchu.R)
setwd("C:/CavernaDoDragão")
getwd
Getwd()
#dica: quando o R der erro, copie e cole a mensagem de erro no google
#Site: http://ecologia.ib.usp.br/bie5782/doku.php?id=bie5782:03_apostila:02-entrada