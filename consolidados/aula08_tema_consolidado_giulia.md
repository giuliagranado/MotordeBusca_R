# Consolidado — PI III — Aula 08 — Tema 3 (cobertura) — 2026-11-24
*guia de tema versão 1 · tutora: Gemini Notebook · grupo: GGYeah · presentes: Giulia, Gabriela, Júlia*

## 1. O que foi passado
- M1 — cobertura à mão: calculada como a fração do peso IDF da consulta presente no documento; nos 8 documentos para "modelo de recuperacao", `d1`, `d2` e `d3` empatam com $\text{cob} = 0{,}581$, `d4` atinge $0{,}419$, `d6` e `d8` ficam com $0{,}161$, e `d5` e `d7` com $0{,}000$.
- M2 — BM25 reordenado: nos 8 documentos canônicos, reordenar o BM25 com cobertura no top-$k$ manteve o $\text{AP} = 0{,}833$ inalterado para qualquer $k \in \{3, 8\}$; já usando cosseno no estágio 1 ($k = 4$), a cobertura promoveu `d2` à frente de `d4`, elevando o $\text{AP}$ de $0{,}500$ para $0{,}583$.
- M3 — empates ($2^n$ valores possíveis), comportamento em consultas de palavra única (onde a cobertura se reduz a uma flag binária de presença) e a assimetria na prioridade de desempate (cobertura primeiro com BM25 desempatando vs. BM25 primeiro onde a cobertura raramente age).
- M4 — corpus do grupo (166 documentos da Baixada Santista):
  - No desenvolvimento (`q01` a `q07`): $\text{MAP}$ de $0{,}3157$ ($k = 0$ / BM25 puro), $0{,}3157$ ($k = 5$), $0{,}3167$ ($k = 10$) e $0{,}3130$ ($k = 20$). A configuração vencedora no desenvolvimento foi $k = 10$.
  - No teste (`q08` a `q10`): avaliado uma única vez com $k = 10$, obtendo $\text{MAP} = 0{,}4018$ contra $\text{MAP} = 0{,}3919$ do BM25 puro ($k = 0$).

## 2. Como foi o aprendizado — opinião da tutora
O grupo dominou a formulação matemática da cobertura ponderada pelo IDF e resolveu as deduções à mão com exatidão, contrastando corretamente a cobertura ponderada com a simples contagem de termos. Demonstraram clareza conceitual ao diagnosticar por que a cobertura reordena o espaço vetorial (cosseno), mas raramente desempata o BM25: ambos os modelos são orientados pelo mesmo sinal subjacente de raridade e presença lexical. No experimento com os 166 documentos da Baixada Santista, o grupo executou rigorosamente a separação metodológica entre desenvolvimento e teste, escolhendo $k = 10$ no desenvolvimento e aplicando apenas uma vez ao teste.
**Teste final:** acertou M1, M2, M3 e M4 — domínio completo dos conceitos e do protocolo empírico.

## 3. Observações para a frente
Para a apresentação e o relatório final, o grupo deve destacar o resultado do teste com $k = 10$ ($\text{MAP}$ subindo de $0{,}3919$ para $0{,}4018$) acompanhado da reflexão crítica: a cobertura atua como um reforço de precisão para consultas multi-termo, mas é inócua em consultas de termo único e dependente do amortecimento do estágio 1 para evitar empates massivos. Fica como ponte para as próximas aulas (Aula 09 em diante) a exploração de modelos de combinação linear com pesos aprendidos (*Learning to Rank*) para integrar múltiplos sinais (BM25, proximidade e cobertura) de forma ótima.
