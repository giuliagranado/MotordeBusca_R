# Consolidado — PI III — Aula 06 — 2026-10-09
*guia versão 1 · tutora: Gemini Notebook · sessão individual (teoria) · motor06*
**Aluno:** Aluno

## 1. O que foi passado
- M1 — o ciclo de realimentação; $D_r$ e $D_{nr}$ no ranking do cosseno
- M2 — a consulta como vetor; centroide; `rowMeans`, `drop = FALSE`
- M3 — a fórmula de Rocchio; `modelo` = 2,426 à mão; expansão: 3 → 21 termos
- M4 — o novo ranking; cosseno negativo; AP $0{,}5 \to 1$
- M5 — coleção residual: `NA` com limiar 2, empate com limiar 1
- M6 — pseudo-realimentação; $k = 2$ (AP $0{,}833$) × $k = 3$ (AP $0{,}750$): *drift*

## 2. Como foi o aprendizado — opinião da tutora
O aluno demonstrou excelente compreensão conceitual e matemática ao longo de toda a sessão. Realizou os cálculos de centroide e a aplicação de Rocchio à mão com precisão, interpretou corretamente o comportamento das métricas binárias e graduadas na coleção residual e identificou com clareza a ocorrência de *query drift* no Módulo 6. Acertou todas as perguntas do teste final referentes aos Módulos 1, 2 e 3 antes de optar pela transição direta à Parte D.

**Teste final:** acertou os Módulos 1, 2 e 3; Módulos 4, 5 e 6 não finalizados a pedido do aluno para transição direta à Parte D.

## 3. Observações para a frente
- **Revisar antes da Aula 07:** Revisar a interpretação do cosseno negativo na coleção residual.
- **Para a próxima tutora:** Aluno muito ágil, seguro com vetores, operações matriciais e métricas do R.
- **Perguntas guardadas:** Nenhuma.
- **Produzido:** `rocchio`, `ranking_vetor`; ranking Rocchio `d3 d2 d1 d6 d8 d5 d7 d4`; residual: empate; PRF $k = 2$ e $k = 3$.
- **Parte D (sessão de grupo):** A iniciar a seguir.
