library(httr2)
baixar_wiki <- function(titulo) {
request("https://pt.wikipedia.org/w/api.php") |>
req_url_query(action = "query", prop = "extracts", explaintext = 1,
format = "json", redirects = 1, titles = titulo) |>
req_perform() |> resp_body_json() |>
(\(r) r$query$pages[[1]]$extract)()
}

articulos <- c("Santos","São Vicente (São Paulo)","Cubatão","Praia Grande (São Paulo)","Bertioga","Conjunção")
textos <- lapply(articulos,baixar_wiki)

Quebra <- function(string){
  string <- tolower(string)
  string <- gsub("[[:punct:]]", " ", string)
  unlist(strsplit(string,"\\s+"))
}

strings <- lapply(textos,Quebra)
dict <- sort(unique(unlist(strings)))
freq <- table(unlist(strings))

cat("10 palavras mais comuns: \n")
print(sort(freq, decreasing = TRUE)[1:10])

tabelafreq <- sapply(strings, function(tk) {
  as.integer(table(factor(tk, levels = dict)))
  })
rownames(tabelafreq) <- dict
colnames(tabelafreq) <- articulos

meio <- nrow(tabelafreq)%/%2
cat("\n TABELA FREQUÊNCIA INTERVALO ",meio," até ",meio+10,"\n")
print(tabelafreq[meio:(meio+10),])

DetectPresença <- function(tabela,busca){
  busca <- tolower(busca)
  if(!busca %in% rownames(tabela)) return("error 404")
  colnames(tabela)[tabela[busca, ] > 0]
  }

cat("\nBusca por 'Santos': ", DetectPresença(tabelafreq,"santos"))
cat("\nBusca por 'Poética': ", DetectPresença(tabelafreq,"Poética"))
cat("\nBusca por 'Paralelepípedo': ", DetectPresença(tabelafreq,"Paralelepípedo"))

tentativa <- readline(prompt = "Busca customizada : ")
cat("Busca por '",tentativa,"':", DetectPresença(tabelafreq,tentativa))

colunas <- ncol(tabelafreq)
freqinst <- rowSums(tabelafreq > 0)
idf <- log(colunas / freqinst) ##SANTOS OCORRE EM TODAS AS WIKIS DE CIDADES DA BAIXADA, POR TANTO 3/3 = 1, LOG(1) = 0. PROBLEMA. WIKI DE 'CONJUÇÃO' ADICIONADA PARA REMEDIAR
tfidf <- tabelafreq * idf
round(tfidf[c("santos","poética","praia"),],5)

cat("\n TABELA TFIDF INTERVALO ",meio," até ",meio+10,"\n")
print(tfidf[meio:(meio+10),])

norm_cols <- function(m) sweep(m,2,sqrt(colSums(m^2)),"/")
tamvec <- norm_cols(tfidf) 
round(colSums(tamvec^2),2)
cosseno <- function(a,b) sum(a*b) / (sqrt(sum(a^2)) * sqrt(sum(b^2)))

Buscaidf <- function(busca){
  VecBusca <- as.integer(table(factor(Quebra(busca),levels= dict)))
  comp <- VecBusca*idf
  round(comp[comp > 0],2)

  scores <- apply(tfidf,2, function(dvec)cosseno(comp,dvec))
  round(sort(scores,decreasing=TRUE),3)
  melhor <- names(which.max(scores))
  cat("\nmaior simiaridade para '",busca,"':",melhor)
}

busca <- "porto de santos"
Buscaidf(busca)
busca <- "Forte militar"
Buscaidf(busca)
tentativa <- readline(prompt = "\nBusca customizada : ")
Buscaidf(tentativa)
