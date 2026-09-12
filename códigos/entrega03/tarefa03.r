# TAREFA
# descrição da tarefa: 
# 1 - Montar um índice invertido do corpus de 8 documentos.
# 2 - Adicionar stemming com SnowballC::wordStem(..., "portuguese").
# 3 - Implementar busca_AND e busca_OR e comparar os resultados.

# tema: descrição de livros
# por apenas 8 em um cenário de exemplo, serão coletados manualmente

library(SnowballC)

livros <- c(  #o texto ainda sujo
l1 = "Harry Potter é inesperadamente escolhido para participar do Torneio Tribruxo, uma competição magica reservada a bruxos mais experientes. Ao longo das três tarefas, ele enfrenta dragões, criaturas aquáticas e um labirinto repleto de feitiços perigosos. Além dos desafios físicos e mágicos, Harry precisa lidar com a desconfiança da comunidade bruxa, que acredita que sua entrada foi fruto de fraude. O torneio, porém, revela-se muito mais do que uma simples competição: torna-se palco para o retorno de Lord Voldemort, que recupera seu corpo e poder com a ajuda de seguidores fiéis. Esse acontecimento marca uma virada decisiva na saga, pois o mundo bruxo deixa de viver apenas sob a ameaça e passa a enfrentar a realidade concreta da volta do maior bruxo das trevas. O livro combina ação intensa, amizade e coragem, preparando o terreno para conflitos ainda maiores que virão.",
l2 = "Jude Duarte, uma jovem humana, vive no traiçoeiro mundo das fadas após a morte de seus pais. Criada em um reino mágico cheio de intrigas, ela enfrenta constantemente o desprezo e a crueldade dos seres feéricos, especialmente do príncipe Cardan, arrogante e implacável. Apesar disso, Jude deseja conquistar poder e respeito, recusando-se a ser apenas uma mortal insignificante. Para sobreviver, ela precisa aprender a manipular, enganar e lutar em um ambiente onde cada gesto pode significar vida ou morte. Entre alianças frágeis, traições e jogos políticos, Jude descobre que o poder no reino das fadas é conquistado com astúcia e coragem. O livro mistura fantasia sombria com drama político, explorando temas de ambição, identidade e resistência. “O Príncipe Cruel” abre a trilogia com intensidade, mostrando que até os mais frágeis podem se tornar peças centrais em um jogo de poder perigoso.",
l3 = "Katniss Everdeen vive em Panem, uma nação dividida em distritos controlados pela Capital, que mantém seu poder através da opressão e do medo. Todos os anos, jovens são escolhidos para participar dos Jogos Vorazes, uma competição televisionada em que apenas um pode sobreviver. Quando sua irmã mais nova é sorteada, Katniss se voluntaria para protegê-la, entrando em uma arena mortal ao lado de Peeta Mellark, seu companheiro de distrito. Lá, ela enfrenta não apenas inimigos armados, mas também dilemas éticos e emocionais, já que precisa equilibrar instinto de sobrevivência com compaixão e lealdade. Ao desafiar as regras e mostrar humanidade em meio à violência, Katniss se torna símbolo de resistência contra a tirania da Capital. O livro combina ação intensa, crítica social e emoção, explorando temas como desigualdade, manipulação midiática e coragem diante da injustiça.",
l4 = "Em uma Chicago futurista, a sociedade é organizada em facções que representam virtudes específicas: Abnegação, Erudição, Audácia, Franqueza e Amizade. Beatrice “Tris” Prior, criada na Abnegação, descobre ser divergente, alguém que não se encaixa em apenas uma facção — condição considerada perigosa pelo sistema. Ao escolher a Audácia, ela mergulha em um treinamento brutal que testa seus limites físicos e psicológicos, enquanto tenta esconder sua verdadeira identidade. Durante esse processo, Tris descobre conspirações que ameaçam destruir o equilíbrio da sociedade e percebe que sua divergência pode ser a chave para enfrentar a manipulação e o controle impostos pelas lideranças. Entre desafios, alianças e um romance nascente com Quatro, ela aprende a lidar com medo, coragem e escolhas que definirão seu futuro. O livro explora identidade, liberdade e resistência, mostrando que ser diferente pode significar força em um mundo que exige conformidade.",
l5 = "Thomas desperta em um lugar estranho chamado Clareira, sem memória de sua vida anterior. Ali, outros jovens vivem confinados, cercados por muros gigantescos que se abrem para um labirinto mortal. O labirinto muda constantemente e é habitado por criaturas perigosas chamadas Verdugos, tornando cada exploração uma luta pela sobrevivência. Thomas sente que sua chegada não foi por acaso e que ele pode ser a chave para desvendar os segredos daquele lugar. Conforme busca respostas, ele enfrenta desafios que testam coragem, inteligência e lealdade, enquanto descobre que todos ali são parte de um experimento controlado por forças misteriosas. O livro mistura ação intensa com suspense e mistério, explorando temas de confiança, manipulação e a luta pela liberdade.",
l6 = "Ambientado na Alemanha nazista, o livro acompanha Liesel Meminger, uma jovem que encontra consolo nos livros em meio ao horror da guerra. Narrada pela própria Morte, a história mostra como Liesel aprende a ler e passa a roubar livros, compartilhando-os com vizinhos e com Max, um judeu escondido em sua casa. Entre bombardeios, perseguições e perdas, a leitura se torna um ato de resistência e esperança. A obra é profundamente emocional, explorando amizade, amor e a força das palavras diante da brutalidade.",
l7 = "Em um futuro distópico, a sociedade é dividida em castas, e a Seleção é um concurso em que jovens competem pelo coração do príncipe Maxon. America Singer, de uma casta baixa, entra contra sua vontade, mas logo se vê dividida entre sentimentos por Maxon e seu amor proibido por Aspen. Entre intrigas palacianas, rivalidades e pressões sociais, America precisa decidir quem realmente é e o que deseja para seu futuro. O livro combina romance, drama e crítica social, mostrando escolhas difíceis em meio ao glamour e à desigualdade. É o início de uma saga que mistura conto de fadas com distopia, explorando poder, amor e identidade.",
l8 = "“Daisy Jones and The Six” acompanha a ascensão e queda de uma banda fictícia dos anos 1970, narrada como se fosse um documentário em formato de entrevistas. Daisy Jones é uma jovem carismática e rebelde, com talento natural para compor e cantar, mas também marcada por excessos e vulnerabilidades. Sua trajetória se cruza com a de Billy Dunne, líder da banda The Six, que luta para equilibrar ambição, família e vícios. A união entre Daisy e o grupo resulta em uma química explosiva, tanto criativa quanto pessoal, que transforma a banda em um fenômeno musical."
)

#limpando
limpar <- function(x) {
x <- tolower(x) # 1) tudo minusculo
x <- stringi::stri_trans_general(x, "Latin-ASCII")   # 2) remover acentos e transformar ç em c
x <- gsub("ç", "c", x) # por garantia
x <- gsub("[^a-z0-9 ]", " ", x) # 3) troca por espaco tudo que NAO for letra, digito ou espaco
x <- gsub("\\s+", " ", x) # 4) colapsa 2+ espacos em um so
trimws(x) # 5) remove espacos das pontas
}
#print(limpar(livros[["l1"]]))
cat("\n")

#executando função
limpos <-limpar(livros) #os 8 documentos,de uma vez so
print("---  titulos limpos (3 primeiros) --- ")
print(head(limpos,3))
cat("\n")

# removendo stopwords + stemming snowball
stopwords <-c("de","dos","das","o","a","as", "os","e","um","uma", "com", "se","por","como","que","deles","da","do","para", "ao","em", "entre", "sua", "seu", "apenas")
tok <-function(x) unlist(strsplit(limpar(x)," "))
sem_stop <- function(x) {
  t <- tok(x)
  t <- t[!t %in% stopwords]   # remove stopwords
  wordStem(t, language = "portuguese") # aplica stemming
}

# para aplicar a todos doc de uma vez
sem_stop_all <- lapply(livros, sem_stop)
#print("---  TOKENS POR LIVRO --- ")
# print(sem_stop_all) -------------------------------------------------------------
cat("\n")

# construido um indice invertido em R 
prep <- function(x) sem_stop(x) # limpa + tokeniza + tira stopwords
postings <- list()  # comeca vazio
for (l in names(livros)) {  # 1) para cada documento...
  for (termo in unique(prep(livros[[l]]))) { # 2) cada termo DISTINTO
    postings[[termo]] <- c(postings[[termo]], l) # 3) anexa o doc
  }
}
print("---  INDICE INVERTIDO --- ")
print( postings[["jov"]])
print(postings[["pais"]] )
cat("\n")

#busca pelo indice - "E"
busca_AND<-function(consulta){
  termos <-prep(consulta) #mesma limpeza usada na indexacao
  Reduce(intersect,postings[termos]) #intersecta as listas, 2 a 2
}
print("---  BUSCA CONSULTA 'E' --- ")
print(busca_AND("jov fad"))
print(busca_AND("livr magic"))
cat("\n")

#busca pelo indice - "OU"
busca_OR<-function(consulta){
  termos <-prep(consulta) #mesma limpeza usada na indexacao
  Reduce(union,postings[termos]) # une as listas de documentos
}
print("---  BUSCA CONSULTA 'OU' --- ")
print(busca_OR("jov fad"))
print(busca_OR("livr magic"))
cat("\n")

# Estatísticas do índice
print("---  ESTATISTICAS --- ")
print(length(postings)) #termos indexados
print(sort(lengths(postings),decreasing=TRUE)[1:100])
