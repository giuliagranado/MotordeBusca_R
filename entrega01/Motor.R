# atividade para entrega

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
#sapply(docs, function(t) substr(t, 1, 100))  # inspeciona cada texto

print(length(docs)) # conta a quantidade de itens na variavel
print(docs)
#print(docs["Santos"]) # imprimi o item solicitado da variavel; chamamos pelo nome não pelo indice


# tokenizar
tokenizar <- function(texto) {
  texto <- tolower(texto)
  texto <- gsub("[[:punct:]]", " ", texto)   # remove pontuação
  texto <- gsub("[[:digit:]]", " ", texto)   # remove números (opcional)
  texto <- gsub("\\s+", " ", texto)          # normaliza espaços
  tokens <- unlist(strsplit(texto, " "))
  tokens[tokens != ""]                       # remove tokens vazios
}
tokens <- lapply(docs, tokenizar) # aplica a função a cada elemento
length(tokens[["São Vicente (São Paulo)"]]) # conta quantos tokens existem
head(tokens[["São Vicente (São Paulo)"]], 20) # mostra apenas os 20 primeiros tokens
cat("\n")


# vocabulario
vocab <- sort(unique(unlist(tokens))) #pega cada palavra apenas uma vez , coloca em ordem alfabetica em um vetor
length(vocab)

# frequencia total de cada termo no corpus
freq <- table(unlist(tokens)) #  mostra quantas vezes cada token aparece
print(sort(freq, decreasing = TRUE)[1:6]) #ordena a freq e seleciona os 6 primeiros
cat("\n")

#matriz termo-documento -TDM
tdm <- sapply(tokens, function(tk) { #a função recebe esses vetores e transforma em contagem
as.integer(table(factor(tk, levels = vocab)))
}) #cria tab com mesmo numero de colunas para todos os docs
rownames(tdm) <- vocab #define os nomes das linhas como as palavras do vocab
#print(tdm[1:20, ]) # um recorte: 20 primeiros termos x 3 documentos
print(tdm[2500:2540, ])
cat("\n")

#busca booleana simples
busca_booleana <- function(termo, tdm) { #cria funçaõ que recebe a palavra buscada e a matriz termo-doc
termo <- tolower(termo) #converte pminusculas
if(!termo %in% rownames(tdm)) return(character(0)) # verifica se existe, se nao - retorna vazio
colnames(tdm)[tdm[termo, ] > 0] # se sim, retorna os nomes das colunas onde aparece
}
print(busca_booleana("litoral", tdm))
print(busca_booleana("porto", tdm)) # pesquisa qual doc tem a palavra
cat("\n")

#  implementação do cálculo TF-IDF
N <- ncol(tdm) # retorna num de colunas/ docs
df <- rowSums(tdm > 0)  # em quantos docs cada termo aparece
idf <- log(N / df)  # inverse document frequency - dá mais peso a termos raro
tfidf <- tdm * idf  # recicla idf por linha

print(round(tfidf[c("praia","casa","bonde", "barra"), ], 2))
#seleciona as linhas da matriz citadas e arredonda valores
