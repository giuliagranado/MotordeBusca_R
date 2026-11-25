# Consolidado — PI III — Aula 08 — Tema 3 (cobertura) — 2026-11-24
*guia de tema versão 1 · tutora: Gemini Notebook · grupo: Projeto Integrador 3*

## 1. O que foi passado
- M1 — cobertura à mão: calculamos $\text{cob}(q, d) = \frac{\sum \text{idf}(t_{\text{presentes}})}{\sum \text{idf}(t_{\text{consulta}})}$. No exemplo, $d_1, d_2, d_3$ empatam em $0{,}581$ e $d_4$ fica com $0{,}419$.
- M2 — BM25 reordenado: a cobertura como Estágio 2 não altera o BM25 ($\text{AP} = 0{,}833$ em todo $k$), pois ambos usam o IDF; no Cosseno ($k = 4$), promoveu $d_2$ e elevou o $\text{AP}$ de $0{,}500$ para $0{,}583$.
- M3 — empates e limites: uma consulta de $n$ termos gera no máximo $2^n$ valores. Em consultas de 1 termo dá apenas $0$ ou $1$. A cobertura atua como 1º critério no topo, desempata pelo Estágio 1.
- M4 — corpus do grupo: vimos a metodologia de validação da grade de $k \in \{0, 3, 5, 10\}$ no dev, escolhendo $k = 0$ caso não haja ganho sobre o Estágio 1.

## 2. Como foi o aprendizado — opinião da tutora
O grupo demonstrou excelente domínio nos cálculos numéricos e na intuição teórica da sobreposição de informações entre BM25 e cobertura. Compreenderam rapidamente como a cobertura corrige distorções de modelos mais simples (como o Cosseno), promovendo documentos que cobrem termos mais raros.
**Teste final:** acertou M1, M2 e M3; a revisar M4 — lembrar que a escolha de $k$ ocorre no `dev` para preservar o conjunto `teste` como avaliação isenta.

## 3. Observações para a frente
- Para a apresentação do projeto: destaque que a cobertura é um filtro de presença ponderada por raridade, atuando melhor em modelos do Estágio 1 que não consideram IDF por termo.
- Na ficha do projeto: caso a cobertura empate com o BM25 no seu corpus, relate $k = 0$ sustentando que o desempate manteve o ranking original.

nota: a sessão não pediu que eu registrasse nenhum resultado no corpus, me fez uma pergunta teórica invés disto?
