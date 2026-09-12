# exemplo do slide  - para casa pt.1 -> explicar cada linha do exemplo

# criando coleção
docs <- c(   #  cria um vetor
d1 = "recuperacao de informacao ordena documentos por relevancia",
d2 = "o modelo de espaco vetorial representa documentos como vetores",
d3 = "bm25 e um modelo probabilistico de ranqueamento de texto",
d4 = "aprendizado estatistico fundamenta a recuperacao moderna",
d5 = "o indice invertido acelera a busca em muitos documentos",
d6 = "embeddings capturam a semantica de palavras e documentos",
d7 = "a avaliacao mede a relevancia dos resultados da busca",
d8 = "ciencia de dados combina estatistica e programacao"
)
print(length(docs)) # conta a quantidade de itens na variavel
print(docs["d5"]) # imprimi o item solicitado da variavel; chamamos pelo nome não pelo indice

# tokenizar
tokenizar <- function(texto) {  #declaramos uma função e qual parametro recebe
texto <- tolower(texto)   # recebe tudo em minusculo
unlist(strsplit(texto, "\\s+")) #divide o texto usando (um ou +) espaço como separador, dps tranforma em vetor
}
tokens <- lapply(docs, tokenizar) # aplica a função a cada elemento
print(tokens[["d1"]])

# vocabulario
vocab <- sort(unique(unlist(tokens))) #pega apenas uma vez a palavra, coloca em ordem alfabetica em um vetor
print(length(vocab))

# frequencia total de cada termo no corpus
freq <- table(unlist(tokens)) #  mostra quantas vezes cada token aparece
print(sort(freq, decreasing = TRUE)[1:6]) #ordena a freq e seleciona os 6 primeiros


#matriz termo-documento -TDM
tdm <- sapply(tokens, function(tk) {
#cd elemento de tokens é um vetor de palavras
#a função recebe esse vetor e transforma em uma contagem
as.integer(table(factor(tk, levels = vocab)))
}) #cria tab com mesmo numero de colunas para todos os docs
rownames(tdm) <- vocab #define os nomes das linhas como as palavras do vocab
print(tdm[1:6, ]) # um recorte: 6 primeiros termos x 8 documentos


#busca booleana simples
busca_booleana <- function(termo, tdm) { #cria funçaõ que recebe a palavra buscada e a matriz termo-doc
termo <- tolower(termo) #converte pminusculas
if(!termo %in% rownames(tdm)) return(character(0)) # verifica se existe, se nao - retorna vazio
colnames(tdm)[tdm[termo, ] > 0] # se sim, retorna os nomes das colunas onde aparece
}
print(busca_booleana("documentos", tdm))
print(busca_booleana("busca", tdm)) # pesquisa qual doc tem a palavra

#  implementação do cálculo TF-IDF
N <- ncol(tdm) # retorna num de colunas/ docs
df <- rowSums(tdm > 0)  # em quantos docs cada termo aparece
idf <- log(N / df)  # inverse document frequency - dá mais peso a termos raro
tfidf <- tdm * idf  # recicla idf por linha

print(round(tfidf[c("documentos","recuperacao","busca","de"), ], 2))
#seleciona as linhas da matriz citadas e arredonda valores
