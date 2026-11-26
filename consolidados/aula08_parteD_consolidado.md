# Consolidado — PI III — Aula 08 — Parte D — 23/11/2026
*guia versão 2 · tutora: Claude · sessão de grupo (executada pela tutora, sem interação do grupo módulo a módulo) · motor08*
**Grupo:** GGYeah · **presentes:** não registrado · **digitou:** ninguém; as células foram rodadas pela tutora

## 1. O que foi feito
- M7 — `proximidade` e `reordenar` no estágio 1 do grupo (híbrido BM25 + LSA, $k_{\text{LSA}} = 50$, $c = 60$); top-5 antes × depois em `q01`, lendo os textos: o doc 99 passou do 2º para o 1º lugar, trocando com o doc 73, ambos de grau 2
- M8 — grade $k \in \{3, 5, 10\}$ × janela $\in \{2, 3, 5\}$ nas consultas `q01`–`q07` (dev); estágio 1 com $\text{MAP} = 0{,}680$; melhor: $k = 3$, $\text{MAP} = 0{,}732$ em qualquer janela; teste (`q08`–`q10`) rodado uma vez: $0{,}435 \to 0{,}552$
- M9 — decisão $k = 3$, janela $3$; `config.R` e ficha atualizados

## 2. Como o grupo trabalhou — opinião da tutora
Não houve sessão interativa: eu rodei os módulos sobre o repositório do grupo, a pedido de um integrante, e portanto não observei quem digitou, quem leu os textos nem se a decisão saiu do grupo. A escolha de $k$ e janela seguiu o critério do guia (maior $\text{MAP}$ no dev) e foi delegada a mim por esse integrante; o grupo ainda não a confirmou. O teste foi rodado uma única vez, depois dessa escolha. Em `q03` a reordenação perdeu: o doc 1 (grau 0), com os termos próximos, passou à frente do doc 49 (grau 2); em `q02` e `q06` ganhou. Com três consultas de teste, o ganho é indício, não prova.

## 3. Observações para a frente
- **Para a próxima sessão prática (Aula 09):** o grupo confirmar $k = 3$ e janela $3$; conferir os números da Aula 07 (o consolidado cita 4.462 termos e $\text{MAP}$ do BM25 de $0{,}156$; aqui saíram 3.618 termos e $0{,}680$ no estágio 1); decidir qual juiz vale (usei Gabi, Giulia, Yuri, nessa ordem)
- **Perguntas guardadas:** nenhuma registrada
- **Produzido:** `config.R` com `rerank_k = 3` e `janela = 3`; ficha com as decisões das Aulas 06 a 08 na linha do tempo
- **Ficha atualizada:** sim — a ficha enviada não tem seções numeradas; acrescentei só a linha do tempo
