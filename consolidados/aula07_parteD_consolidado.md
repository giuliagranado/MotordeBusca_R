# Relatório Consolidado — Aula 07 (Parte D): Análise Semântica Latente (LSA) e Busca Híbrida

## 1. Contexto e Ficha Técnica do Projeto

O presente relatório documenta as atividades práticas, experimentos e decisões de arquitetura desenvolvidos na **Aula 07 — Parte D** do Projeto Integrador 3 pelo grupo **GGYeah**. O objetivo principal desta etapa foi introduzir a **Indexação por Semântica Latente (LSA — Latent Semantic Analysis)** via **Decomposição em Valores Singulares (SVD)** na matriz de ponderação TF-IDF do motor de busca, avaliando o impacto da representação vetorial densa em comparação e combinação com o modelo lexical clássico BM25.

### Identificação do Motor de Busca
* **Grupo:** GGYeah
* **Tema do Corpus:** Informações gerais sobre municípios da Baixada Santista (Santos, São Vicente e Cubatão), abrangendo história, geografia, economia, turismo e infraestrutura.
* **Tamanho do Corpus:** 166 documentos (parágrafos extraídos das páginas oficiais da Wikipédia).
* **Dimensão do Vocabulário:** 4.462 termos únicos pós-processamento.
* **Legado de Configuração (Aula 06):** Remoção de pontuações, conversão para minúsculas, $limiar = 2$, desativação de expansão pseudo-relevante ($prf\_k = 0$) e pesos de Rocchio $a = 1.0, b = 0.75, \gamma = 0.15$.

---

## 2. Decomposição LSA e Retenção de Energia

A técnica de LSA aplica a Decomposição em Valores Singulares (SVD) sobre a matriz de pesos termo-documento $W_{m \times n}$, fatorando-a em três matrizes:

$$W = U \Sigma V^T$$

Ao truncar a decomposição nas $k$ primeiras dimensões latentes mais significativas, obtém-se uma aproximação de posto reduzido $W_k = U_k \Sigma_k V_k^T$, projetando termos e documentos em um espaço semântico denso de dimensão $k$.

### Experimento com $k = 20$
Nos testes iniciais com $k = 20$, a energia conservada (variância acumulada dos valores singulares retida pela decomposição) foi calculada através da razão entre a soma dos quadrados dos $k$ primeiros valores singulares e a soma total:

$$\text{Energia Conservada} = \frac{\sum_{i=1}^{k} \sigma_i^2}{\sum_{j=1}^{r} \sigma_j^2} = 0,329 \quad (32,9\%)$$

Esse valor indica que 20 dimensões latentes conseguem capturar aproximadamente um terço de toda a variabilidade informacional do corpus de 166 documentos da Baixada Santista.

---

## 3. Estudo de Caso Qualitativo — Consulta `q01`

Para compreender o comportamento do LSA na prática, analisou-se a consulta `q01`: *"museus turismo cultura centro historico"*.

### Comparação do Top-5 (BM25 vs. LSA $k=20$)

| Posição | Ranking BM25 | Ranking LSA ($k=20$) | Sobreposição |
| :---: | :---: | :---: | :---: |
| 1º | Doc 2 | Doc 163 | Diferente |
| 2º | Doc 99 | Doc 24 | Diferente |
| 3º | Doc 101 | Doc 54 | Diferente |
| 4º | Doc 102 | Doc 99 | **Em comum (Doc 99)** |
| 5º | Doc 103 | Doc 108 | Diferente |

Dos 5 documentos principais retornados por cada abordagem, apenas **1 documento (Doc 99)** esteve presente em ambos os Top-5.

### Análise dos Documentos Exclusivos do LSA

1. **Ganhos por Proximidade Semântica (Acertos):**
   * **Documento 24 ("Centro Histórico e Teatro Coliseu"):** Possui apenas 1 termo coincidente com o texto da consulta, porém aborda a revitalização do centro antigo e a infraestrutura cultural. O LSA capturou a relação semântica entre "centro histórico" e a atividade teatral/cultural.
   * **Documento 54 ("Pontos Turísticos e Museologia"):** Apresenta apenas 1 termo coincidente, descrevendo equipamentos turísticos e acervos museológicos. O modelo denso associou corretamente o conceito de museus e turismo sem depender da repetição exata das palavras.

2. **Ruído de Compressão SVD (Falsos Positivos):**
   * **Documentos 163 ("Calçada do Lorena") e 108 ("Maremoto de 1541 em São Vicente"):** Contêm **0 palavras** coincidentes com a consulta. O LSA elevou esses documentos devido à coocorrência de vocabulário histórico/geográfico amplo no corpus, caracterizando o fenômeno de *topic drift* por super-generalização vetorial em valores baixos de $k$.

---

## 4. Grade de Experimentos no Conjunto de Desenvolvimento

Avaliou-se o desempenho da precisão média (**AP — Average Precision**) e da média global (**MAP — Mean Average Precision**) ao longo das 7 consultas de desenvolvimento (`q01` a `q07`). Foram comparados o **BM25**, o **LSA isolado** em $k \in \{10, 20, 50\}$ e o modelo de **Busca Híbrida** combinando BM25 e LSA via **Reciprocal Rank Fusion (RRF)** com $c = 60$:

$$\text{RRF}(d) = \frac{1}{c + \text{rank}_{\text{BM25}}(d)} + \frac{1}{c + \text{rank}_{\text{LSA}}(d)}$$

### Tabela de AP por Consulta e MAP (Desenvolvimento)

| Modelo / Algoritmo | `q01` | `q02` | `q03` | `q04` | `q05` | `q06` | `q07` | **MAP (Dev)** |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **BM25 Clássico** | 0,168 | 0,246 | 0,175 | 0,049 | 0,167 | 0,086 | 0,200 | **0,156** |
| **LSA ($k=10$)** | 0,053 | 0,046 | 0,009 | 0,049 | 0,010 | 0,046 | 0,020 | **0,033** |
| **LSA ($k=20$)** | 0,217 | 0,059 | 0,038 | 0,047 | 0,023 | 0,079 | 0,200 | **0,095** |
| **LSA ($k=50$)** | 0,312 | 0,101 | 0,312 | 0,048 | 0,247 | 0,067 | 0,200 | **0,184** |
| **Híbrido RRF ($k=10$)** | 0,229 | 0,220 | 0,045 | 0,051 | 0,042 | 0,064 | 0,200 | **0,122** |
| **Híbrido RRF ($k=20$)** | 0,198 | 0,302 | 0,115 | 0,049 | 0,096 | 0,091 | 0,200 | **0,150** |
| **Híbrido RRF ($k=50$)** | **0,262** | **0,304** | **0,271** | **0,049** | **0,199** | **0,064** | **0,200** | **0,193** |

### Observações Técnicas da Grade
* **Dificuldade de $k$ Baixo:** Em $k=10$ e $k=20$, a perda de informação pela projeção causa queda drástica no MAP (chegando a 0,033 em $k=10$).
* **Recuperação em $k=50$:** A expansão para 50 fatores latentes permitiu ao LSA isolado superar o BM25 (MAP 0,184 vs 0,156).
* **Sinergia Híbrida:** A combinação Híbrida RRF ($k=50$) atingiu o ápice de desempenho (**MAP = 0,193**), unindo a precisão de palavras-chave exatas do BM25 com o alcance conceitual do LSA.

---

## 5. Validação Global no Conjunto de Teste

Executou-se a validação global abrangendo o conjunto completo de consultas para homologação do motor.

### Desempenho Global (MAP)

| Abordagem | MAP Global | Ganho Relativo sobre BM25 |
| :--- | :---: | :---: |
| **BM25 Clássico** | 0,143 | — |
| **Busca Híbrida (LSA $k=50$ + BM25 via RRF)** | **0,177** | **+23,8%** |

O modelo híbrido confirmou sua superioridade, elevando a média de precisão de 0,143 para 0,177 na avaliação consolidada.

---

## 6. Decisão de Arquitetura e Código do `config.R`

Com base nos resultados experimentais, o grupo **GGYeah** definiu como padrão para a produção a **Busca Híbrida com RRF e LSA de 50 fatores latentes**.

### Código Final do `config.R`

```r
# Configuração Oficial do Motor de Busca — Grupo GGYeah (Aula 07)
cfg <- list(
  limiar     = 2,
  minusculas = TRUE,
  stopwords  = NULL,
  prf_k      = 0,
  rocchio    = c(a = 1, b = 0.75, g = 0.15),
  lsa_k      = 50,
  modelo     = 'hibrido',
  rrf_c      = 60
)
```

O arquivo `config.R` foi atualizado com sucesso no repositório da sessão e encontra-se pronto para integração nos módulos subsequentes.
