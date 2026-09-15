# MotordeBusca_R

﻿# Projeto Integrador III — Sistema de Recuperação de Informação

- **Disciplina:** Projeto Integrador III
- **Integrantes:** Gabrielle Lara, Giulia Granado, Yuri Salgado
- **Professor:** João Paulo de Mello
- **Curso:** Tecnologia em Ciência de Dados — FATEC

> Repositório de diferentes tipos de Busca / Recuperação de Informação, implementados em R como parte da nota da disciplina Projeto Integrador da disciplina (4º semestre - Ciência de Dados). 
> O projeto usa como corpus textos da Wikipédia sobre três cidades do litoral paulista (Baixada Santista): **Santos**, **São Vicente (São Paulo)** e **Cubatão**.

 ---
 
## 📌 Objetivos
 
- Coletar textos automaticamente da Wikipédia via API.
- Limpar e normalizar o texto (minúsculas, remoção de acentos/pontuação, colapso de espaços).
- Tokenizar os documentos e remover stopwords.
- Aplicar **stemming** (radicalização) com `SnowballC`.
- Construir um **índice invertido** do corpus.
- Implementar **busca booleana** (`AND` e `OR`) sobre o índice e comparar os resultados.
- Gerar uma **Matriz Termo-Documento (TDM)** e calcular **TF-IDF** para identificar os termos mais relevantes de cada documento.
## 📂 Estrutura do repositório
 
```
MotordeBusca_R/
├── dataset/          # dados coletados: .txt e .csv gerados a partir da Wikipédia
├── codigos/          # scripts R: coleta/geração do corpus e os motores de busca
├── consolidados/     # explicação de cada código (o que faz, o que foi aprendido) — em andamento
├── exemplos_aula/    # exemplos de referência usados em aula
├── LICENSE
└── README.md
```
 
- **`dataset/`** — contém os textos das três cidades já processados, exportados tanto em `.txt` (um arquivo por cidade ou um único arquivo consolidado) quanto em `.csv` (formato tabular, um parágrafo por linha).
- **`codigos/`** — contém o script que busca as cidades na Wikipédia e monta o corpus, além dos diferentes motores de busca (índice invertido, busca booleana, TF-IDF etc.) já implementados.
- **`consolidados/`** — documentação de apoio: para cada script, uma explicação do que ele faz e do que foi aprendido no processo. Ainda está sendo preenchida.
- **`exemplos_aula/`** — material de referência/exemplos vistos em aula, não faz parte do pipeline principal.
## 🛠️ Pacotes utilizados
 
- [`httr2`](https://cran.r-project.org/web/packages/httr2/index.html) — para consultar a API da Wikípedia.
- [`SnowballC`](https://cran.r-project.org/web/packages/SnowballC/index.html) — para aplicar stemming em português (`wordStem(..., language = "portuguese")`).
- [`stringi`](https://cran.r-project.org/web/packages/stringi/index.html) — para normalização de texto (remoção de acentos).
- Funções base do R (`tolower`, `gsub`, `strsplit`, `table`, `Reduce`, etc.).
## 🔄 Pipeline
 
1. **Coleta de dados**
   Função `baixar_wiki()` consulta a API da Wikipédia (`action=query&prop=extracts`) e retorna o texto puro de cada cidade. Inclui fallback de busca (`list=search`) caso o título exato não seja encontrado.
2. **Divisão em parágrafos / exportação**
   O texto de cada artigo é dividido em parágrafos e salvo em `dataset/`, tanto em `.csv` (tabular) quanto em `.txt` (um único arquivo com todas as cidades ou um arquivo por cidade).
3. **Limpeza e normalização**
   Função `limpar()`: converte para minúsculas, remove acentos (`stringi::stri_trans_general`), remove pontuação/números e colapsa espaços.
4. **Tokenização, stopwords e stemming**
   Função `sem_stop()`: tokeniza o texto limpo, remove stopwords em português e aplica `wordStem()` para radicalizar cada termo (ex.: "praia" → "prai", "turismo" → "turism").
5. **Índice invertido**
   Para cada documento, os termos (já stemizados) são usados como chave de uma lista (`postings`), associando cada termo aos documentos em que ele aparece.
6. **Busca booleana**
   - `busca_AND(consulta)`: interseção dos documentos que contêm **todos** os termos da consulta.
   - `busca_OR(consulta)`: união dos documentos que contêm **pelo menos um** dos termos da consulta.
7. **Matriz Termo-Documento e TF-IDF**
   A partir do vocabulário único do corpus, é construída uma TDM (termos × documentos) com as contagens de ocorrência, usada em seguida para calcular o TF-IDF de cada termo em cada cidade.
## ▶️ Como executar
 
1. Instale os pacotes necessários (uma única vez):
```r
   install.packages("httr2")
   install.packages("SnowballC")
   install.packages("stringi")
```
 
2. Rode o script de coleta em `codigos/` para baixar os textos da Wikipédia e gerar os arquivos em `dataset/` (`.csv` e/ou `.txt`).
3. Rode os scripts de motor de busca em `codigos/` (índice invertido, busca AND/OR, TF-IDF), que consomem os dados salvos em `dataset/`.
4. Exemplos de consulta:
```r
   busca_AND("porto praia")
   busca_OR("cidade histórico")
```
 
---
## Resumo
Sistema de recuperação de informação desenvolvido em R, cobrindo todo o pipeline
clássico de RI: pré-processamento de texto, representações vetoriais
(BoW, TF-IDF), índice invertido, similaridade do cosseno e ranqueamento por
BM25. Aplicado a um corpus real extraído da Wikipédia em português
(artigos dos municípios da Baixada Santista).

**Todas as etapas foram implementadas em R base** — para deixar explícitas as fórmulas e a matemática
por trás de cada passo.
