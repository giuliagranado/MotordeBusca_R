# Consolidado — PI III — Aula 5,5 — 29/09/2026
*guia versão 1 · tutora: Gemini Notebook · sessão única*
**Aluno:** Aluno(a)

## 1. O que foi passado
- M1 — `rel`: gabarito na ordem do ranking
- M2 — precisão e recall; a tabela de contingência ignora a ordem
- M3 — o @$k$ como corte
- M4 — P@$k$ e R@$k$; dente de serra; `cumsum`
- M5 — AP passo a passo; a pegadinha do divisor; MAP
- M6 — MRR: só o primeiro
- M7 — nDCG: por que $\log_2(i+1)$; binário à mão = 0,920
- M8 — nDCG graduado = 0,951; as cinco lado a lado
- M9 — qual métrica; três armadilhas

## 2. Como foi o aprendizado — opinião da tutora
O aluno apresentou excelente raciocínio quantitativo e realizou todos os cálculos à mão com precisão matemática impecável (P@k, AP, RR, DCG, IDCG e nDCG binário/graduado). Compreendeu perfeitamente a dinâmica do dente de serra, o comportamento de reordenação do vetor `rel`, o papel do MRR e a lógica de ponderação dos graus no nDCG graduado. No teste final, demonstrou ótimo domínio conceitual da maioria dos módulos, necessitando apenas reforçar o motivo teórico da divisão por $R$ no AP (incorporação do recall pelas omissões) e a justificativa da curva logarítmica em comparação com $1/i$ no DCG.

**Teste final:** acertou M1, M2, M3, M4, M6, M8 e M9; a revisar M5 e M7.
- **M5:** Definiu a fórmula do AP, mas omitiu que a divisão por $R$ penaliza os relevantes não recuperados com nota zero (embutindo o recall).
- **M7:** Descreveu o desconto da fórmula, mas faltou explicar que o logaritmo fornece um desconto mais suave do que $1/i$ e que o $+1$ previne a divisão por zero.

## 3. Observações para a frente
- **Revisar antes da Aula 06:** O papel do divisor $R$ no AP e a fundamentação teórica da curva de desconto por $\log_2(i+1)$ no DCG.
- **Para a próxima tutora:** Raciocínio rápido, excelente autonomia nos cálculos manuais e assimilação imediata dos conceitos centrais das métricas.
- **Perguntas guardadas:** "Como saber se 0,84 é estatisticamente superior a 0,83?" — encaminhada para a Aula 16 (Testes de Hipótese).
- **Produzido:** Todas as cinco métricas calculadas e conferidas à mão — $\text{P@}3 = 0{,}667$, $\text{AP} = 0{,}833$, $\text{MRR} = 1{,}000$, $\text{nDCG bin} = 0{,}920$ e $\text{nDCG grad} = 0{,}951$.
- **Parte D (gabarito próprio):** Não iniciada nesta sessão.
