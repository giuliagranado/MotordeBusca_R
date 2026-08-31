# exemplo 03 - motor Pré-processamento e Índice Invertido

#o texto chega sujo
brutos <- c(
d1 = "Recuperacao de Informacao: ORDENA documentos, por relevancia!",
d2 = "O modelo de espaco-vetorial representa documentos (como vetores).",
d3 = "BM25 e um modelo probabilistico de ranqueamento de texto.",
d4 = "Aprendizado estatistico fundamenta a recuperacao moderna.",
d5 = "O indice invertido acelera a busca em muitos documentos.",
d6 = "Embeddings capturam a semantica de palavras e documentos.",
d7 = "A avaliacao mede a relevancia dos resultados da busca.",
d8 = "Ciencia de dados combina estatistica e programacao."
)

#limpando
limpar <- function(x) {
x <- tolower(x) # 1) tudo minusculo
x <- gsub("[^a-z0-9 ]", " ", x) # 2) troca por espaco tudo que NAO for letra, digito ou espaco
x <- gsub("\\s+", " ", x) # 3) colapsa 2+ espacos em um so
trimws(x) # 4) remove espacos das pontas
}
print(limpar(brutos[["d1"]]))
cat("\n")

#executando função
limpos <-limpar(brutos) #os 8 documentos,de uma vez so
print(head(limpos,3))
cat("\n")

# removendo stopwords
stopwords <-c("de","o","a","e","um","por","como","que","da","do")
tok <-function(x) unlist(strsplit(limpar(x)," "))
sem_stop <-function(x) {
t <-tok(x)
t[!t %in% stopwords]
}
print(sem_stop(brutos[["d2"]]))
cat("\n")

#reduzir ao radical
# versao ILUSTRATIVA: corta sufixos comuns do portugues
stem<-function(t)sub("(cao|mento|dade|ais|s)$","",t) # o regex apaga as palavras que tiverem esse final
sapply(c("documentacao","ranqueamento","relevancia","modelos"),stem)

# construido um indice em R 
prep <- function(x) sem_stop(x) # limpa + tokeniza + tira stopwords
postings <- list()  # comeca vazio
for (d in names(brutos)) {  # 1) para cada documento...
for (termo in unique(prep(brutos[[d]]))) { # 2) cada termo DISTINTO
postings[[termo]] <- c(postings[[termo]], d) # 3) anexa o doc
  }
}
print( postings[["documentos"]])
print(postings[["modelo"]] )
cat("\n")

#busca pelo indice - "E"
busca_AND<-function(consulta){
termos<-prep(consulta) #mesma limpeza usada na indexacao!
Reduce(intersect,postings[termos]) #intersecta as listas, 2 a 2
}
print(busca_AND("modelo documentos"))
print(busca_AND("busca documentos"))
cat("\n")

# Estatísticas do índice
print(length(postings)) #termosindexados
print(sort(lengths(postings),decreasing=TRUE)[1:4])
