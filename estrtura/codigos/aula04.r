# TAREFA
# descrição da tarefa: 
# 1 - Montar um índice invertido do corpus de X documentos.
# 2 - Adicionar stemming com SnowballC::wordStem(..., "portuguese").
# 3 - Implementar busca_AND e busca_OR e comparar os resultados.

# tema: cidades da baxada santista


#  SnowballC - um pacote que precisa ser instalado uma vez.
#install.packages("SnowballC") #so na primeira vez
library(SnowballC)
#wordStem(c("documentos","documento","documentacao"),
#language="portuguese")

library(httr2)

baixar_wiki <- function(titulo) {
request("https://pt.wikipedia.org/w/api.php") |>
req_url_query(action = "query", prop = "extracts", explaintext = 1,
format = "json", redirects = 1, titles = titulo) |>
req_perform() |> resp_body_json() |>
(\(r) r$query$pages[[1]]$extract)()
}

# criando coleção
cidades <- c("Santos", "São Vicente (São Paulo)","Cubatão")
docs <- lapply(cidades,baixar_wiki) # aplica a função baixar_wiki em cada cidade
names(docs) <- cidades # nomeia a lista com os nomes das cidades
sapply(docs, function(t) substr(t, 1, 100))  # inspeciona cada texto


#limpando
limpar <- function(x) {
x <- tolower(x) # 1) tudo minusculo
x <- stringi::stri_trans_general(x, "Latin-ASCII")   # 2) remover acentos e transformar ç em c
x <- gsub("ç", "c", x) # por garantia
x <- gsub("[^a-z0-9 ]", " ", x) # 3) troca por espaco tudo que NAO for letra, digito ou espaco
x <- gsub("\\s+", " ", x) # 4) colapsa 2+ espacos em um so
trimws(x) # 5) remove espacos das pontas
}
print(limpar(cidades[]))
cat("\n")

#executando função
limpos <-limpar(cidades) #TODOS documentos,de uma vez so
print("---  titulos limpos (3 primeiros) --- ")
print(head(limpos,3))
cat("\n")

# removendo stopwords + stemming snowball
stopwords <-c("de","dos","das","o","a","as", "os","e","um","uma", "com", "se","por","como","que","deles","da","do","para", "ao","em", "entre", "sua", "seu", "apenas", "no","na")
tok <-function(x) unlist(strsplit(limpar(x)," "))
sem_stop <- function(x) {
  t <- tok(x)
  t <- t[!t %in% stopwords]   # remove stopwords
  wordStem(t, language = "portuguese") # aplica stemming
}

# para aplicar a todos doc de uma vez
sem_stop_all <- lapply(docs, sem_stop)
#print("---  TOKENS POR CIDADE --- ")
#print(sem_stop_all) 
cat("\n")

# construido um indice invertido em R 
prep <- function(x) sem_stop(x) # limpa + tokeniza + tira stopwords
postings <- list()  # comeca vazio
for (l in names(docs)) {                # nomes reais dos documentos
  for (termo in unique(prep(docs[[l]]))) {       # processa o TEXTO do documento l
    postings[[termo]] <- c(postings[[termo]], l)
  }
}

print("---  INDICE INVERTIDO --- ")
print(postings[["port"]])
print(postings[["turism"]] )
print(postings[["cidad"]])
cat("\n")

#busca pelo indice - "E"
busca_AND<-function(consulta){
  termos <-prep(consulta) #mesma limpeza usada na indexacao
  Reduce(intersect,postings[termos]) #intersecta as listas, 2 a 2
}
print("---  BUSCA CONSULTA 'E' --- ")
print(busca_AND("port praia"))
print(busca_AND("cidad histor"))
cat("\n")

#busca pelo indice - "OU"
busca_OR<-function(consulta){
  termos <-prep(consulta) #mesma limpeza usada na indexacao
  Reduce(union,postings[termos]) # une as listas de documentos
}
print("---  BUSCA CONSULTA 'OU' --- ")
print(busca_OR("port praia"))
print(busca_OR("cidad histor"))
cat("\n")

# Estatísticas do índice
print("---  ESTATISTICAS --- ")
print(length(postings)) #termos indexados
print(sort(lengths(postings),decreasing=TRUE)[1:100])
