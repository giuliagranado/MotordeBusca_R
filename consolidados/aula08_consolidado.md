# Consolidado — PI III — Aula 08 — 24/11/2026

*guia versão 2 · tutora: Claude Sonnet 5.5 · sessão individual (teoria) · motor08*
**Aluno:** Yuri

## 1\. O que foi passado

* M1 — dois estágios; $\\text{R@}3 = 0{,}75$ com limiar 1; para entregar os 4 relevantes ao estágio 2, $k = 6$
* M2 — pontuar cada lado separado (BM25, LSA) × ler o par; custo em leituras do par: $50 \\times 20 = 1,000$ com estágio 1 contra $50 \\times 2,000 = 100,000$ sem; o LSA calcula os vetores uma vez, antes da consulta
* M3 — proximidade ordenada: `d2` 1, `d3` 0,5 à mão para "modelo de recuperacao"; "modelo de texto": `d3` 1,5 e `d2` 1
* M4 — `reordenar`: $k = 2$ não muda; $k = 3$ AP $0{,}833 \\to 1$; desempate pela ordem do estágio 1; Checkpoint 4: `d1 d6 d2 d5 d3 d8 d4 d7`
* M5 — limites ("documentos busca" dá 0 a todos); cross-encoders neurais como conceito; "ordenar documentos relevancia" em `d1` = 0,5
* M6 — latência × qualidade; $k$ é hiperparâmetro, escolhido no desenvolvimento com várias consultas

## 2\. Como foi o aprendizado — opinião da tutora

Acompanhei o Yuri pelos seis módulos. Nas contas à mão ele costumava errar no primeiro chute e acertar quando eu decompunha o problema em passos curtos: no M1 usou o resultado do limiar 2 para o limiar 1; no M2 trocou o número de leituras por consulta pelo do corpus todo e achou que o LSA calcula os vetores depois da consulta; no M3 confundiu a janela $w$ com o valor do par, deu a distância em vez do valor, e somou $\\frac{1}{5}$ para uma distância fora da janela. Entendeu bem a ordem do par (no M4, pelo `d2` invertido) e o desempate pelo `seq\_along`, e no M5 viu sozinho que `ordenar` e `ordena` são palavras diferentes para a proximidade, embora tenha errado a distância entre `documentos` e `relevancia` (disse 1, é 2). No M6 deu as duas objeções corretas ao $k = 8$ (latência e promoção de erro) e não citou que a saída é de uma consulta só.



3\. Observações para a frente

* **Revisar antes da Aula 09:** M3 (a janela $w$ só deixa entrar distâncias de 1 a $w$; fora dela o par soma 0; o valor do par é $\\frac{1}{\\text{menor distância válida}}$) e M2 (custo em leituras do par; o LSA prepara os vetores antes da consulta)
* **Produzido:** `proximidade`, `reordenar`; BM25 reordenado com $k = 3$ em "modelo de recuperacao": `d2 d3 d1 d4 d8 d6 d5 d7`

