# Roteiro de Apresentação — Tema 3: Cobertura da Consulta
**Projeto Integrador III — Grupo GGYeah (Baixada Santista)**
**Duração alvo:** 10 minutos · **3 apresentadores** · ~1.200 palavras faladas

---

## Divisão de falas

| Pessoa | Tema | Slides | Tempo |
|---|---|---|---|
| **Pessoa A** | Introdução e fundamentação | 1 e 2 | ~2m30 |
| **Pessoa B** | Exemplo manual e reordenação no corpus de 8 documentos | 3 e 4 | ~3m30 |
| **Pessoa C** | Limites, experimento real e conclusão | 5, 6 e 7 | ~4m00 |

---

## Pessoa A — Introdução e fundamentação (~2m30)

**[Slide 1 — Título]**

"Boa tarde. Nosso tema é a cobertura da consulta em reordenação em dois estágios, o esquema *retrieve & rerank*. A ideia é simples: o BM25 recupera e ordena os documentos, e depois um segundo critério reordena só o topo da lista."

"A pergunta que investigamos é: a fração do peso informacional da consulta que está presente em cada documento serve para melhorar o topo do ranking?"

**[Slide 2 — O que é a cobertura]**

"Pense numa consulta como um conjunto de termos. A cobertura de um documento é a soma dos pesos IDF dos termos da consulta que ele contém, dividida pela soma dos pesos de todos os termos da consulta."

"O peso IDF mede raridade: um termo que aparece em poucos documentos vale mais. Assim, a cobertura vai de zero, quando o documento não tem nenhum termo, até um, quando tem todos."

"A hipótese é esta: documentos que cobrem mais termos, principalmente os raros, deveriam subir no ranking. Mas é preciso testar, e é o que a Pessoa B e a Pessoa C vão mostrar."

*(Passagem: "Para mostrar como isso funciona na prática, a Pessoa B vai fazer a conta passo a passo num corpus pequeno.")*

---

## Pessoa B — Exemplo manual e reordenação (~3m30)

**[Slide 3 — Cálculo manual]**

"Usamos um corpus de oito documentos e a consulta *modelo de recuperação*. Primeiro, o peso de cada termo, pelo número de documentos em que ele aparece."

"O termo *modelo* aparece em dois documentos, e seu peso IDF é 1,281. *Recuperação* aparece em três, com peso 0,944. E *de* aparece em quatro, com peso 0,693. A soma dos três é 2,918."

"Agora a cobertura. O documento três contém os três termos, então cobre 100%. O documento um contém *recuperação* e *de*, e cobre 56%. O documento dois contém *modelo* e *de*, e cobre 68%. O documento seis tem só *recuperação*, com 32%. E os documentos quatro, cinco e oito não têm nenhum termo da consulta, com cobertura zero."

"Esse exemplo mostra algo importante: contar palavras engana. Se a consulta é *modelo de texto* e o documento dois tem *modelo* e *de*, a contagem simples daria dois terços. Ponderando pelo IDF, dá cerca de 52%, porque o termo que falta, *texto*, é raro e pesa mais."

**[Slide 4 — Reordenação nos 8 documentos]**

"Agora, a parte de engenharia. Em dois estágios: o BM25 gera a lista, e a cobertura reordena os primeiros colocados. Na consulta *modelo de recuperação*, o BM25 já coloca o documento três em primeiro, depois o um e o dois. Reordenando pelo topo, a ordem não muda."

"Por que não muda? Porque o BM25 já soma pesos IDF, ajustados pela frequência e pelo tamanho do documento. A cobertura usa o mesmo sinal de raridade. Então os dois critérios concordam, e a cobertura não traz informação nova."

"Há um contraste: em um modelo vetorial com cosseno, que não soma IDFs diretamente, a cobertura pode mudar a ordem. Essa comparação, porém, não está no notebook que testamos, então apresentamos como hipótese."

*(Passagem: "A Pessoa C vai mostrar o que acontece com um corpus real e quais são os limites da técnica.")*

---

## Pessoa C — Limites, experimento real e conclusão (~4m00)

**[Slide 5 — Limites teóricos]**

"Primeiro, um limite de resolução. Com *n* termos distintos na consulta, a cobertura só pode assumir até 2ⁿ valores. Com dois termos de mesmo peso, só existem três notas possíveis: zero, meio e um."

"Segundo, consultas de um termo. Aí a cobertura vira binária: ou o documento tem a palavra, ou não tem. Todos os relevantes do topo empatam em um, e o reordenador não faz nada."

"Terceiro, empates. No notebook, a consulta *informação recuperação* produz empate entre dois documentos com cobertura de 0,345. Quando há empate, o desempate devolve a ordem original do BM25."

**[Slide 6 — Experimento no corpus do grupo]**

"Agora o teste real. O acervo tem 166 documentos sobre Santos, São Vicente e Cubatão. Separamos as consultas em duas partes: sete para desenvolvimento, usadas para escolher o tamanho *k* do topo a reordenar, e três para teste, que não usamos para escolher nada."

"No desenvolvimento, o melhor valor foi *k* igual a 10, com MAP de 0,3167, contra 0,3157 do BM25 puro. A diferença é de uma milésima, ou seja, praticamente zero."

"No teste cego, com *k* igual a 10, o MAP foi de 0,4018, contra 0,3919 do BM25 puro. Ganho de 0,0099. É uma melhora pequena, e com apenas três consultas ela ainda não é conclusiva. Vale ser honesto sobre isso."

**[Slide 7 — Conclusão]**

"Balanço. A cobertura é uma métrica interpretável e reforça a presença de termos raros em consultas com vários termos. Mas ela é muito redundante com o BM25, e não separa bem documentos em consultas curtas ou com empates."

"Por isso, nossa recomendação é não usar a cobertura como reordenador isolado. Para a arquitetura final, indicamos sinais complementares: proximidade ordenada dos termos, modelos densos como LSA ou embeddings, e *learning to rank*, que combina vários sinais com pesos aprendidos."

"Obrigado. Estamos à disposição para perguntas."

---

## Perguntas prováveis e respostas curtas

- **"Por que o ganho é tão pequeno?"** — A cobertura repete parte da informação do BM25, então o espaço de melhoria é pequeno. Além disso, o teste tem só três consultas.
- **"Por que escolheram k = 10?"** — Foi o melhor no desenvolvimento. O k = 20 piorou, provavelmente por trazer ruído de documentos mais abaixo na lista.
- **"O que é MAP?"** — Média, entre as consultas, da precisão média. Ela recompensa encontrar os relevantes cedo na lista.
- **"Por que o IDF tem +1 dentro do log?"** — É a variante usada pelo BM25 para manter o peso sempre positivo.

---

## Notas para o grupo (antes de apresentar)

Ao cruzar o `.md` com o notebook, encontrei divergências. O roteiro acima usa os números **corrigidos**, que batem com o notebook:

1. **Slide 3 — frequências dos termos:** no corpus de 8 documentos, *recuperação* aparece em 3 documentos (não 2) e *de* em 4 (não 5). Por isso os IDFs são 0,944 e 0,693, e não 1,281 e 0,492.
2. **Slide 3 — "empate triplo":** não existe. Os valores reais são d1 = 0,561, d2 = 0,676 e d3 = 1,000. O d4 tem cobertura zero, não 0,419.
3. **Slide 3 — "modelo de texto":** com os IDFs corrigidos, a cobertura é 0,524 (o `.md` dizia 0,497).
4. **Slide 4 — k = 8 e cosseno:** o notebook testa apenas k = 3 com BM25, e não há código para o cosseno nem para os valores de AP (0,833 e 0,500 → 0,583). Esses números precisam de fonte ou devem sair do slide.
5. **Slide 4 — o reordenador não é "só cobertura":** o código soma o BM25 normalizado com a cobertura (peso 1,0). Vale dizer isso na apresentação.
6. **Slide 6 — significância:** o ganho de +0,0099 vem de três consultas, e o ganho no desenvolvimento é de +0,001. Não é possível afirmar melhora real com esses dados.
