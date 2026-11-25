# Consolidado — PI III — Aula 08 — Tema 3 (cobertura) — 2026-11-24
*guia de tema versão 1 · tutora: Gemini Notebook · grupo: Grupo PI III · presentes: Integrantes do grupo*

## 1. O que foi passado
- M1 — cobertura à mão: `d1`, `d2`, `d3` $0{,}581$; `d4` $0{,}419$; `d6`, `d8` $0{,}161$; `d5`, `d7` $0{,}000$
- M2 — BM25 reordenado: AP $0{,}833$ em todo $k$; cosseno, $k = 4$: $0{,}5 \to 0{,}583$
- M3 — empates ($2^n$ valores), uma palavra, quem desempata quem
- M4 — corpus do grupo: seleção de $k$ no `dev` (com recomendação de $k = 0$ caso persista empate); teste final uma única vez

## 2. Como foi o aprendizado — opinião da tutora
A tutora acompanhou a evolução do grupo ao longo dos quatro módulos e registrou excelente nível de compreensão teórica e prática. A conta à mão no Módulo 1 foi realizada rapidamente, destacando-se o entendimento da ponderação do IDF do BM25 frente à simples contagem de termos. No Módulo 2, o grupo compreendeu por que o BM25 mantém o ranking inalterado sob reordenamento por cobertura e identificou a razão do ganho de precisão (AP de $0{,}500$ para $0{,}583$) quando aplicado sobre o ranking por cosseno em $k = 4$. No Módulo 3, a análise dos limites discretos ($2^n$) e da precedência das regras de desempate ficou clara.
**Teste final:** acertou M1, M2, M3, M4 — todas as questões e cenários conceituais foram respondidos com precisão.

## 3. Observações para a frente
Para a apresentação do projeto integrador, destaca-se a comparação empírica entre os modelos de estágio 1 (BM25 vs. Cosseno) ao utilizar a cobertura como reordenador de estágio 2. Em casos onde as consultas sejam predominantemente de um termo ou ocorram empates generalizados no conjunto `dev`, recomenda-se registrar formalmente a decisão por $k = 0$.
