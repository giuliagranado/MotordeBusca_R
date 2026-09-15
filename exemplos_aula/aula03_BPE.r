# BPE: outra forma de tokenizar - Começa com os caracteres; Conta todos os pares vizinhos; 
# Funde o par mais frequente num símbolo novo e Repete até atingir o tamanho de vocabulário desejado 
#resultado: "descobre" radicais e sufixos sozinho

# BPE passo 1: começar pelos caracteres
freq<-c(praias=5, ilhas=4,ruas=3,praia=2)
# quebra cada palavra em caracteres: "praias"->"p""r""a""i""a""s"
simbolos<-lapply(names(freq),function(p)strsplit(p,"")[[1]])
names(simbolos)<-names(freq) #devolveosnomesdaspalavras
print(simbolos[["praias"]])
cat("\n")

# BPE passo 2: contar os pares vizinhos
contar_pares <- function(simb, freq) {
pares <- integer(0) # placar vazio
for (p in names(simb)) { # para cada palavra...
s <- simb[[p]]   # ...pegue seus simbolos
for (i in seq_len(length(s)- 1)) {  # ...e cada par vizinho
k <- paste0(s[i], s[i + 1])   # nome do par: "pr", "ra"...
pares[k] <- ifelse(is.na(pares[k]), 0, pares[k]) + freq[[p]]
}                              # soma a FREQUENCIA da palavra
}
sort(pares, decreasing = TRUE) # do mais comum ao mais raro
}
print(head(contar_pares(simbolos, freq), 4))

# BPE passo 3: fundir par vencedor
palavras<-c(praias="praias",ilhas="ilhas",
ruas ="ruas", praia="p raia")
gsub("a s","as",palavras) #"as"(dois simbolos)->"as"(um so)
