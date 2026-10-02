# Consolidado — PI III — Aula 00 — 02/10/2026
*guia versão 3 · tutora: Gemini Notebook · sessão individual (teoria) · sem motor*
**Aluno:** Aluno(a)

## 1. O que foi passado
- M1 — Colab em R, `<-`, o corpus `docs` como vetor de 8; `[1]`; R começa em 1; vetorização
- M2 — nomes; `[ ]` preserva o nome, `[[ ]]` não; `==`
- M3 — `nchar` versus `length`; `toupper`/`tolower`; `substr`; `paste`/`paste0`/`collapse`
- M4 — `strsplit` (lista), `unlist`
- M5 — funções; a última expressão é devolvida; escreveu `tokenizar` e `maiuscula`
- M6 — `lapply` (lista) e `sapply` (simplifica); `sum`, `list`; `tokens`
- M7 — `table`; `factor(levels = …)` fixa categorias e zeros; `sort`; `%in%`, `!` e o filtro
- M8 — matriz por coluna; reciclagem em `m * peso`
- M9 — regex I: `grep`/`grepl`, `^ $ | [ ] +`; pedaço não é palavra (`grep("de", docs)`)
- M10 — regex II: `sub`/`gsub`, `. * {n} {n,} [^ ]`, `trimws`, o pipeline de limpeza; `tokenizar` com `\\s+`
- M11 — o mapa da Aula 01

## 2. Como foi o aprendizado — opinião da tutora
O aluno apresentou excelente raciocínio e rápida assimilação da sintaxe do R, demonstrando facilidade em associar e diferenciar os conceitos em relação ao Python. Compreendeu perfeitamente a indexação baseada em 1, a diferença entre vetor e lista, o comportamento dos colchetes simples e duplos, o uso de fatores com níveis fixos para incluir contagens zero e a reciclagem de vetores em matrizes. Acertou com precisão todas as previsões ao longo dos 11 módulos, demonstrando total autonomia com funções vetorizadas, manipulação de texto e expressões regulares.

**Teste final:** Módulos 1 a 11 concluídos e validados nos checkpoints interativos durante a sessão.

## 3. Observações para a frente
- **Revisar antes da Aula 01:** Apenas praticar a montagem e leitura de matrizes termo-documento via `sapply`.
- **Para a próxima tutora:** Aluno muito ágil, com ótima intuição lógica e excelente acompanhamento de todos os checkpoints.
- **Perguntas guardadas:** Nenhuma pergunta pendente.
- **Produzido:** `docs` digitado; `tokenizar` e `maiuscula` escritas e testadas; 100% de acerto em todas as previsões dos checkpoints.
- **Parte D (frases próprias + Colab e GitHub):** não iniciada — fazer antes da Aula 01.

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-10-02 13:58 · R version 4.6.1 (2026-06-24) · sem motor · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `acentos` | integer | 1 | 1317 |
| `avgdl` | numeric | 1 | 81.37 |
| `b` | numeric | 1 | 0.75 |
| `bm25` | integer | 100 | 99, 73, 23, 75, 24, 2, ... |
| `bool` | integer | 100 | 99, 1, 2, 21, 23, 24, ... |
| `cheio` | integer | 1 | 166 |
| `col` | character | 1 | texto |
| `consultas` | character | 10 | q01, q02, q03, q04, q05, q06, ... |
| `corpus` | data.frame | 166 × 4 | colunas: id, cidade, paragrafo_num, texto |
| `corpus_export` | data.frame | 166 × 6 | colunas: id, titulo, texto, data, fonte, url |
| `denominador` | numeric, nomeado | 166 | 1 3.517, 2 1.561, 3 2.13, 4 3.169, 5 0.9747, 6 0.853, ... |
| `df` | numeric, nomeado | 3699 | santos 76, e 135, um 60, municipio 21, brasileiro 17, no 63, ... |
| `dict` | character | 3712 | , 0, 000, 001, 01, 013, ... |
| `digito` | numeric | 1 | 0 |
| `digitos` | integer | 1 | 542 |
| `discordantes` | data.frame | 27 × 4 | colunas: consulta, documento, grau_Yuri, grau_Giulia  |
| `doc_id` | character | 1 | 166 |
| `doc_lengths` | numeric, nomeado | 166 | 1 110, 2 114, 3 75, 4 169, 5 61, 6 50, ... |
| `docs_tokens$1` | character | 110 | santos, e, um, municipio, brasileiro, no, ... |
| `docs_tokens$2` | character | 114 | fundada, em, 1546, por, bras, cubas, ... |
| `docs_tokens$3` | character | 75 | cidade, mais, populosa, do, litoral, paulista, ... |
| `docs_tokens$4` | character | 169 | o, principal, cartao, postal, do, municipio, ... |
| `docs_tokens$5` | character | 61 | verificam, se, relatos, a, respeito, da, ... |
| `docs_tokens$6` | character | 50 | a, coroa, portuguesa, interessou, se, pouco, ... |
| `docs_tokens$7` | character | 111 | no, entanto, em, 1531, devido, a, ... |
| `docs_tokens$8` | character | 76 | martim, afonso, no, entanto, expulsou, cosme, ... |
| `docs_tokens$9` | character | 69 | a, vida, do, novo, povoado, entre, ... |
| `docs_tokens$10` | character | 182 | em, 1543, com, o, termino, da, ... |
| `docs_tokens$11` | character | 84 | dessa, forma, o, povoado, cresceu, em, ... |
| `docs_tokens$12` | character | 76 | a, segunda, metade, do, seculo, xvi, ... |
| `docs_tokens$13` | character | 152 | o, saque, do, pirata, thomas, cavendish, ... |
| `docs_tokens$14` | character | 82 | thomas, cavendish, permaneceu, por, dois, meses, ... |
| `docs_tokens$15` | character | 58 | no, seculo, xvii, seguindo, uma, tendencia, ... |
| `docs_tokens$16` | character | 59 | no, fim, do, seculo, xviii, a, ... |
| `docs_tokens$17` | character | 82 | cabe, destacar, que, varios, episodios, relacionados, ... |
| `docs_tokens$18` | character | 121 | santos, foi, elevada, a, categoria, de, ... |
| `docs_tokens$19` | character | 112 | a, economia, do, cafe, no, brasil, ... |
| `docs_tokens$20` | character | 199 | com, a, abolicao, da, escravatura, e, ... |
| `docs_tokens$21` | character | 110 | santos, se, tornou, definitivamente, uma, cidade, ... |
| `docs_tokens$22` | character | 136 | no, inicio, dos, anos, 1980, com, ... |
| `docs_tokens$23` | character | 136 | durante, a, decada, de, 1990, como, ... |
| `docs_tokens$24` | character | 66 | a, partir, do, inicio, do, seculo, ... |
| `docs_tokens$25` | character | 42 | nos, ultimos, anos, a, cidade, contou, ... |
| `docs_tokens$26` | character | 30 | no, dia, 13, de, agosto, de, ... |
| `docs_tokens$27` | character | 29 | divide, se, principalmente, em, duas, areas, ... |
| `docs_tokens$28` | character | 59 | a, area, continental, estende, se, por, ... |
| `docs_tokens$29` | character | 39 | a, area, insular, estende, se, sobre, ... |
| `docs_tokens$30` | character | 76 | a, orla, santista, e, composto, por, ... |
| `docs_tokens$31` | character | 134 | a, zona, noroeste, surgiu, apos, a, ... |
| `docs_tokens$32` | character | 55 | santos, possui, clima, tropical, litoraneo, umido, ... |
| `docs_tokens$33` | character | 54 | segundo, dados, do, instituto, nacional, de, ... |
| `docs_tokens$34` | character | 80 | fora, da, serie, do, inmet, foi, ... |
| `docs_tokens$35` | character | 62 | segundo, os, dados, do, censo, de, ... |
| `docs_tokens$36` | character | 22 | dos, moradores, com, 10, anos, ou, ... |
| `docs_tokens$37` | character | 54 | em, 2022, a, populacao, do, municipio, ... |
| `docs_tokens$38` | character | 53 | naquele, ano, segundo, dados, do, censo, ... |
| `docs_tokens$39` | character | 61 | o, intenso, processo, de, conurbacao, atualmente, ... |
| `docs_tokens$40` | character | 40 | estende, se, sobre, municipios, pertencentes, tanto, ... |
| `docs_tokens$41` | character | 83 | a, regiao, abrange, 2, 419, 930, ... |
| `docs_tokens$42` | character | 65 | tal, qual, a, variedade, cultural, verificavel, ... |
| `docs_tokens$43` | character | 104 | de, acordo, com, dados, do, censo, ... |
| `docs_tokens$44` | character | 68 | santos, esta, localizada, no, pais, mais, ... |
| `docs_tokens$45` | character | 12 | a, administracao, municipal, se, da, pelo, ... |
| `docs_tokens$46` | character | 48 | o, primeiro, prefeito, de, santos, foi, ... |
| `docs_tokens$47` | character | 86 | o, poder, legislativo, da, cidade, de, ... |
| `docs_tokens$48` | character | 68 | o, produto, interno, bruto, pib, e, ... |
| `docs_tokens$49` | character | 65 | o, montante, de, riquezas, gerado, na, ... |
| `docs_tokens$50` | character | 48 | santos, possui, o, maior, porto, da, ... |
| `docs_tokens$51` | character | 62 | o, complexo, portuario, de, santos, responde, ... |
| `docs_tokens$52` | character | 81 | a, area, de, influencia, economica, do, ... |
| `docs_tokens$53` | character | 86 | o, orcamento, municipal, gira, em, torno, ... |
| `docs_tokens$54` | character | 109 | entre, os, principais, pontos, turisticos, de, ... |
| `docs_tokens$55` | character | 38 | o, aquario, de, santos, antigo, aquario, ... |
| `docs_tokens$56` | character | 66 | outros, lugares, de, interesse, sao, o, ... |
| `docs_tokens$57` | character | 76 | santos, e, um, dos, 15, municipios, ... |
| `docs_tokens$58` | character | 161 | basicamente, a, rede, urbana, de, santos, ... |
| `docs_tokens$59` | character | 242 | no, sentido, leste, oeste, as, ligacoes, ... |
| `docs_tokens$60` | character | 160 | os, canais, de, santos, hoje, possuem, ... |
| `docs_tokens$61` | character | 209 | pelo, seu, carater, litoraneo, e, pelo, ... |
| `docs_tokens$62` | character | 131 | santos, faz, parte, da, rede, mundial, ... |
| `docs_tokens$63` | character | 167 | em, 27, de, dezembro, de, 2003, ... |
| `docs_tokens$64` | character | 97 | a, cidade, de, santos, possui, seis, ... |
| `docs_tokens$65` | character | 127 | o, municipio, de, santos, e, servido, ... |
| `docs_tokens$66` | character | 43 | o, transporte, por, meio, de, onibus, ... |
| `docs_tokens$67` | character | 135 | projetos, diversos, foram, apresentados, como, alternativas, ... |
| `docs_tokens$68` | character | 92 | o, sistema, funicular, do, monte, serrat, ... |
| `docs_tokens$69` | character | 133 | santos, foi, a, segunda, cidade, do, ... |
| `docs_tokens$70` | character | 110 | a, cidade, possui, dois, acessos, ferroviarios, ... |
| `docs_tokens$71` | character | 139 | o, outro, acesso, ferroviario, originou, se, ... |
| `docs_tokens$72` | character | 167 | o, sistema, de, telefones, automaticos, foi, ... |
| `docs_tokens$73` | character | 63 | santos, possui, varios, museus, entre, eles, ... |
| `docs_tokens$74` | character | 133 | a, cidade, de, santos, possui, 3, ... |
| `docs_tokens$75` | character | 180 | santos, tambem, foi, muito, utilizada, pela, ... |
| `docs_tokens$76` | character | 59 | a, cidade, possui, nomes, de, renome, ... |
| `docs_tokens$77` | character | 69 | a, danca, tambem, e, muito, renomada, ... |
| `docs_tokens$78` | character | 25 | desde, 1962, abriga, o, festival, musica, ... |
| `docs_tokens$79` | character | 181 | santos, e, uma, cidade, relativamente, cinematografica, ... |
| `docs_tokens$80` | character | 102 | outros, filmes, inclui, o, unico, filme, ... |
| `docs_tokens$81` | character | 83 | santos, tambem, possui, uma, tradicao, na, ... |
| `docs_tokens$82` | character | 25 | santos, tem, sido, uma, fonte, de, ... |
| `docs_tokens$83` | character | 93 | talvez, dois, dos, seus, mais, famosos, ... |
| `docs_tokens$84` | character | 92 | carvalho, apoiou, se, numa, tradicao, lirica, ... |
| `docs_tokens$85` | character | 51 | provavelmente, santos, seja, a, cidade, do, ... |
| `docs_tokens$86` | character | 238 | patricia, galvao, mais, conhecida, como, pagu, ... |
| `docs_tokens$87` | character | 138 | plinio, marcos, e, carlos, alberto, soffredini, ... |
| `docs_tokens$88` | character | 43 | muitos, outros, nomes, famosos, surgiram, do, ... |
| `docs_tokens$89` | character | 219 | o, esporte, em, santos, talvez, seja, ... |
| `docs_tokens$90` | character | 169 | no, futebol, a, cidade, foi, palco, ... |
| `docs_tokens$91` | character | 128 | outro, esporte, da, cidade, e, o, ... |
| `docs_tokens$92` | character | 6 | 26, de, janeiro, aniversario, da, cidade |
| `docs_tokens$93` | character | 11 | 8, de, setembro, padroeira, da, cidade, ... |
| `docs_tokens$94` | character | 5 | estrada, de, ferro, santos, jundiai |
| `docs_tokens$95` | character | 3 | complexo, metropolitano, expandido |
| `docs_tokens$96` | character | 78 | sao, vicente, oficialmente, estancia, balnearia, de, ... |
| `docs_tokens$97` | character | 173 | sao, vicente, marca, o, inicio, efetivo, ... |
| `docs_tokens$98` | character | 150 | com, um, pib, de, mais, de, ... |
| `docs_tokens$99` | character | 212 | sao, vicente, preserva, diversos, sitios, e, ... |
| `docs_tokens$100` | character | 32 | a, ilha, de, sao, vicente, originalmente, ... |
| `docs_tokens$101` | character | 41 | a, ilha, de, gohayo, foi, descoberta, ... |
| `docs_tokens$102` | character | 103 | nas, primeiras, decadas, do, seculo, xvi, ... |
| `docs_tokens$103` | character | 106 | entre, 1530, e, 1532, a, expedicao, ... |
| `docs_tokens$104` | character | 81 | sustentou, por, espaco, de, tres, anos, ... |
| `docs_tokens$105` | character | 45 | martim, afonso, tambem, introduziu, a, cultura, ... |
| `docs_tokens$106` | character | 47 | no, inicio, da, colonizacao, portuguesa, o, ... |
| `docs_tokens$107` | character | 155 | a, guerra, de, iguape, ocorreu, entre, ... |
| `docs_tokens$108` | character | 79 | no, final, do, ano, de, 1541, ... |
| `docs_tokens$109` | character | 54 | em, meados, do, seculo, xvi, a, ... |
| `docs_tokens$110` | character | 47 | por, volta, de, 1560, sao, vicente, ... |
| `docs_tokens$111` | character | 69 | em, dezembro, de, 1591, a, sao, ... |
| `docs_tokens$112` | character | 58 | em, 1615, outro, pirata, atacou, sao, ... |
| `docs_tokens$113` | character | 52 | em, 1624, devido, a, disputas, entre, ... |
| `docs_tokens$114` | character | 19 | a, lei, municipal, n, 31, de, ... |
| `docs_tokens$115` | character | 71 | segundo, a, enciclopedia, dos, municipios, brasileiros, ... |
| `docs_tokens$116` | character | 67 | o, morro, do, voturua, e, um, ... |
| `docs_tokens$117` | character | 66 | uma, das, caracteristicas, da, regiao, e, ... |
| `docs_tokens$118` | character | 90 | o, cristianismo, se, faz, presente, na, ... |
| `docs_tokens$119` | character | 19 | a, cidade, de, sao, vicente, tem, ... |
| `docs_tokens$120` | character | 42 | o, sistema, de, telefones, automaticos, foi, ... |
| `docs_tokens$121` | character | 30 | na, decada, de, 90, o, codigo, ... |
| `docs_tokens$122` | character | 55 | a, universidade, estadual, paulista, unesp, possui, ... |
| `docs_tokens$123` | character | 10 | lista, de, municipios, de, sao, paulo, ... |
| `docs_tokens$124` | character | 9 | lista, de, municipios, de, sao, paulo, ... |
| `docs_tokens$125` | character | 8 | lista, de, municipios, de, sao, paulo, ... |
| `docs_tokens$126` | character | 9 | lista, de, municipios, de, sao, paulo, ... |
| `docs_tokens$127` | character | 8 | lista, de, municipios, de, sao, paulo, ... |
| `docs_tokens$128` | character | 8 | lista, de, municipios, de, sao, paulo, ... |
| `docs_tokens$129` | character | 41 | cubatao, e, um, municipio, do, estado, ... |
| `docs_tokens$130` | character | 41 | faz, divisa, com, os, municipios, de, ... |
| `docs_tokens$131` | character | 64 | com, um, grande, parque, industrial, cubatao, ... |
| `docs_tokens$132` | character | 35 | a, etimologia, do, nome, cubatao, tem, ... |
| `docs_tokens$133` | character | 43 | a, outra, do, hebraico, africana, e, ... |
| `docs_tokens$134` | character | 77 | e, ponto, pacifico, entre, os, estudiosos, ... |
| `docs_tokens$135` | character | 61 | no, seculo, xix, esses, monumentos, pre, ... |
| `docs_tokens$136` | character | 119 | na, disputa, pela, ocupacao, do, espaco, ... |
| `docs_tokens$137` | character | 41 | embora, haja, provas, abundantes, da, ocupacao, ... |
| `docs_tokens$138` | character | 78 | o, primeiro, documento, oficial, que, cita, ... |
| `docs_tokens$139` | character | 134 | em, 1556, durante, o, governo, geral, ... |
| `docs_tokens$140` | character | 85 | em, 1803, em, decreto, de, 19, ... |
| `docs_tokens$141` | character | 83 | mas, somente, em, 17, de, janeiro, ... |
| `docs_tokens$142` | character | 229 | em, 12, de, agosto, de, 1833, ... |
| `docs_tokens$143` | character | 140 | a, partir, da, emancipacao, a, politica, ... |
| `docs_tokens$144` | character | 65 | com, a, morte, do, prefeito, assumiu, ... |
| `docs_tokens$145` | character | 114 | em, 2000, foi, eleito, o, medico, ... |
| `docs_tokens$146` | character | 142 | em, 2008, foi, eleita, a, professora, ... |
| `docs_tokens$147` | character | 85 | em, 1982, foi, nomeado, o, advogado, ... |
| `docs_tokens$148` | character | 57 | uma, tragedia, incontavel, pois, nem, a, ... |
| `docs_tokens$149` | character | 117 | na, sequencia, vem, o, desastre, da, ... |
| `docs_tokens$150` | character | 111 | mas, as, acoes, de, passarelli, acabam, ... |
| `docs_tokens$151` | character | 79 | desde, 1985, a, prefeitura, e, o, ... |
| `docs_tokens$152` | character | 20 | a, prefeitura, da, cidade, estima, que, ... |
| `docs_tokens$153` | character | 6 | densidade, demografica, hab, km2, 761, 13 |
| `docs_tokens$154` | character | 9 | mortalidade, infantil, ate, 1, ano, por, ... |
| `docs_tokens$155` | character | 6 | expectativa, de, vida, anos, 68, 32 |
| `docs_tokens$156` | character | 8 | taxa, de, fecundidade, filhos, por, mulher, ... |
| `docs_tokens$157` | character | 8 | indice, de, desenvolvimento, humano, idh, m, ... |
| `docs_tokens$158` | character | 44 | o, sistema, de, telefones, automaticos, foi, ... |
| `docs_tokens$159` | character | 30 | na, decada, de, 90, o, codigo, ... |
| `docs_tokens$160` | character | 96 | para, festejar, o, centenario, de, independencia, ... |
| `docs_tokens$161` | character | 62 | cruzeiro, quinhentista, cruzeiro, quinhentista, que, foi, ... |
| `docs_tokens$162` | character | 39 | rancho, da, maioridade, relembra, a, construcao, ... |
| `docs_tokens$163` | character | 49 | calcada, do, lorena, estrada, de, ligacao, ... |
| `docs_tokens$164` | character | 182 | a, escola, ary, de, oliveira, garcia, ... |
| `docs_tokens$165` | character | 10 | lista, de, municipios, do, brasil, acima, ... |
| `docs_tokens$166` | character | 31 | ferreira, lucia, da, costa, 2006, os, ... |
| `dot_prod` | numeric, nomeado | 166 | 1 16.46, 2 17.41, 3 78.1, 4 14, 5 5.774, 6 0, ... |
| `duplicados` | data.frame | 71 × 13 | colunas: chave, consulta_j1, documento_j1, grau_j1, juiz_j1, timestamp_j1, segundos_j1, consulta_j2, documento_j2, grau_j2, juiz_j2, timestamp_j2, segundos_j2 |
| `f` | character, nomeado | 3 | f1 hOra  de AvEntUra  passa na..., f2 EU  jogo de taRDE   e JoGO ..., f3 Morango   é de todas AS fRu... |
| `freq` | table, nomeado | 3 | eu  jogo de tarde   e jogo de  noite 1, hora  de aventura  passa na hora do almoo 1, morango    de todas as frutas  a melhor das frutas 1 |
| `full` | numeric | 1 | 13360 |
| `gBM` | matrix | 1 × 70 | linhas: (sem nomes) \| colunas: (sem nomes) |
| `gBO` | matrix | 1 × 67 | linhas: (sem nomes) \| colunas: (sem nomes) |
| `gTF` | matrix | 1 × 69 | linhas: (sem nomes) \| colunas: (sem nomes) |
| `i` | integer | 1 | 50 |
| `idf` | numeric, nomeado | 3699 | santos 1.774, e 1.205, um 2.007, municipio 3.027, brasileiro 3.228, no 1.959, ... |
| `idf_bm25` | numeric, nomeado | 1 | paulo 1.323 |
| `j1_nome` | character | 1 | Yuri |
| `j2_nome` | character | 1 | Giulia  |
| `j3_nome` | character | 1 | Gabi |
| `juizes` | character | 3 | Gabi, Giulia , Yuri |
| `k` | numeric | 1 | 5 |
| `k1` | numeric | 1 | 1.2 |
| `len` | integer | 1 | 31 |
| `long` | numeric | 1 | 0 |
| `m` | matrix | 2 × 2 | linhas: de, modelo \| colunas: d1, d2 |
| `matches` | list | 1 | elementos: (sem nomes) |
| `max` | integer | 1 | 241 |
| `min` | integer | 1 | 3 |
| `mrrBM` | numeric | 1 | 1 |
| `mrrBO` | numeric | 1 | 1 |
| `mrrRF` | numeric | 1 | 1 |
| `n` | numeric | 1 | 13360 |
| `N` | integer | 1 | 166 |
| `ndcgBM` | numeric | 1 | 0.7943 |
| `ndcgBO` | numeric | 1 | 0.8255 |
| `ndcgTF` | numeric | 1 | 0.8079 |
| `ndggBM` | numeric | 1 | 0.8661 |
| `ndggBO` | numeric | 1 | 0.8506 |
| `ndggTF` | numeric | 1 | 0.8665 |
| `necessidades_df` | data.frame | 10 × 4 | colunas: consulta, texto_consulta, necessidade, escopo |
| `new` | character | 21 | Ferreira,, Lúcia, (2006)., «OS, FANTASMAS, DO, ... |
| `norm_d` | numeric, nomeado | 166 | 1 39.21, 2 43.32, 3 33.64, 4 57.86, 5 30.57, 6 28.91, ... |
| `norm_q` | numeric | 1 | 8.837 |
| `numerador` | numeric, nomeado | 166 | 1 4.4, 2 0, 3 2.2, 4 2.2, 5 0, 6 0, ... |
| `obj` | character | 31 | Ferreira,, Lúcia, da, Costa, (2006)., «OS, ... |
| `ord_b` | integer | 10 | 3, 41, 19, 95, 96, 98, ... |
| `ord_m` | integer | 10 | 95, 3, 41, 96, 98, 19, ... |
| `ord_t` | integer | 10 | 95, 3, 41, 128, 127, 124, ... |
| `padrao` | character | 1 | \b\w*[.,;?!@%$&]\w*\b |
| `palavras` | integer | 166 | 108, 113, 76, 167, 59, 48, ... |
| `palavras_acentuadas` | list | 1 | elementos: (sem nomes) |
| `peso` | numeric | 2 | 1, 10 |
| `pontuação` | numeric | 1 | 0 |
| `pontuadas` | integer | 1 | 76 |
| `pool` | data.frame | 71 × 2 | colunas: consulta, documento |
| `pool_bruta` | data.frame | 150 × 2 | colunas: consulta, documento |
| `pool_final` | data.frame | 71 × 3 | colunas: consulta, documento, ordem_exibicao |
| `pool_limpa` | data.frame | 71 × 2 | colunas: consulta, documento |
| `pool_unica` | data.frame | 71 × 2 | colunas: consulta, documento |
| `presenca` | matrix | 6 × 166 | linhas: complexo, metropolitano, expandido, ... \| colunas: 1, 2, 3, 4, ... |
| `q` | character | 1 | q10 |
| `q_id` | character | 1 | q10 |
| `q_j1` | data.frame | 71 × 7 | colunas: consulta, documento, grau, juiz, timestamp, segundos, chave |
| `q_j2` | data.frame | 71 × 7 | colunas: consulta, documento, grau, juiz, timestamp, segundos, chave |
| `q_j3` | data.frame | 71 × 6 | colunas: consulta, documento, grau, juiz, timestamp, segundos |
| `q_tf` | table, nomeado | 6 | complexo 1, expandido 1, grande 1, metropolitano 1, paulo 1, sao 1 |
| `q_tokens` | character | 6 | complexo, metropolitano, expandido, grande, sao, paulo |
| `q_vec` | numeric, nomeado | 3699 | santos 0, e 0, um 0, municipio 0, brasileiro 0, no 0, ... |
| `qrels` | data.frame | 213 × 6 | colunas: consulta, documento, grau, juiz, timestamp, segundos |
| `r_bm25` | data.frame | 100 × 4 | colunas: consulta, documento, posicao, score |
| `r_booleano` | data.frame | 100 × 4 | colunas: consulta, documento, posicao, score |
| `r_tfidf` | data.frame | 100 × 4 | colunas: consulta, documento, posicao, score |
| `rank_bm25` | data.frame | 100 × 4 | colunas: consulta, documento, posicao, score |
| `rank_bool` | data.frame | 100 × 4 | colunas: consulta, documento, posicao, score |
| `rank_tfidf` | data.frame | 100 × 4 | colunas: consulta, documento, posicao, score |
| `ranking_BM` | integer | 100 | 99, 73, 23, 75, 24, 2, ... |
| `ranking_BO` | integer | 100 | 99, 1, 2, 21, 23, 24, ... |
| `ranking_TF` | integer | 100 | 99, 73, 75, 23, 2, 24, ... |
| `RBM_P3` | numeric | 1 | 0.6667 |
| `RBM_PA` | numeric | 1 | 0.7421 |
| `RBM_R3` | numeric | 1 | 0.07143 |
| `RBO_P3` | numeric | 1 | 1 |
| `RBO_PA` | numeric | 1 | 0.7991 |
| `RBO_R3` | numeric | 1 | 0.1071 |
| `relevantes` | integer | 28 | 99, 73, 53, 1, 4, 52, ... |
| `relsBM` | integer | 100 | 1, 1, 0, 0, 0, 1, ... |
| `relsBO` | integer | 100 | 1, 1, 1, 1, 0, 0, ... |
| `relsTF` | integer | 100 | 1, 1, 0, 0, 1, 0, ... |
| `res$matriz` | table | 3 × 3 | linhas: 0, 1, 2 \| colunas: 0, 1, 2 |
| `res$po` | numeric | 1 | 0.6197 |
| `res$pe` | numeric | 1 | 0.3372 |
| `res$kappa` | numeric | 1 | 0.4262 |
| `res$total` | integer | 1 | 71 |
| `RTF_P3` | numeric | 1 | 0.6667 |
| `RTF_PA` | numeric | 1 | 0.7826 |
| `RTF_R3` | numeric | 1 | 0.07143 |
| `score_bm25` | numeric, nomeado | 166 | 1 2.537, 2 2.789, 3 15.39, 4 1.818, 5 1.043, 6 0, ... |
| `score_bool` | numeric, nomeado | 166 | 1 0.3333, 2 0.1667, 3 1, 4 0.3333, 5 0.1667, 6 0, ... |
| `score_tfidf` | numeric, nomeado | 166 | 1 0.04749, 2 0.04546, 3 0.2627, 4 0.02738, 5 0.02137, 6 0, ... |
| `short` | numeric | 1 | 1 |
| `strings` | list | 13359 | elementos: (sem nomes) |
| `sub_pool` | data.frame | 8 × 3 | colunas: consulta, documento, ordem_exibicao |
| `summm` | integer | 1 | 4 |
| `t` | character | 1 | paulo |
| `tab` | table, nomeado | 29 | 0 1, 1517 1, 165 1, 188 1, 2006 1, 25 1, ... |
| `teste` | character, nomeado | 8 | d1 recuperacao de informacao o..., d2 o modelo de espaco vetorial..., d3 bm25 e um modelo probabilis..., d4 aprendizado estatistico fun..., d5 o indice invertido acelera ..., d6 embeddings capturam a seman..., ... |
| `tf_d` | numeric, nomeado | 166 | 1 2, 2 0, 3 1, 4 1, 5 0, 6 0, ... |
| `tf_matrix` | matrix | 3699 × 166 | linhas: santos, e, um, ... \| colunas: 1, 2, 3, 4, ... |
| `tfidf` | integer | 1 | 99 |
| `tfidf_matrix` | matrix | 3699 × 166 | linhas: santos, e, um, ... \| colunas: 1, 2, 3, 4, ... |
| `thingy` | matrix | 2 × 71 | linhas: (sem nomes) \| colunas: (sem nomes) |
| `TOK` | character | 1 | Santos é um município brasi... |
| `tokens$f1` | character | 1 | hora  de aventura  passa na... |
| `tokens$f2` | character | 1 | eu  jogo de tarde   e jogo ... |
| `tokens$f3` | character | 1 | morango    de todas as frut... |
| `top_bm25` | data.frame | 50 × 2 | colunas: consulta, documento |
| `top_booleano` | data.frame | 50 × 2 | colunas: consulta, documento |
| `top_tfidf` | data.frame | 50 × 2 | colunas: consulta, documento |
| `v` | character | 166 | Santos é um município brasi..., Fundada em 1546 por Brás Cu..., Cidade mais populosa do lit..., O principal cartão-postal d..., Verificam-se relatos a resp..., A coroa portuguesa interess..., ... |
| `voc` | character | 4993 | Santos, é, um, município, brasileiro, no, ... |
| `vocab` | character | 3 | de, modelo, busca |
| `x` | character, nomeado | 3 | f1 hora  de aventura  passa na..., f2 eu  jogo de tarde   e jogo ..., f3 morango    de todas as frut... |

### Funções definidas

`anexar_estado`, `calcular_kappa`, `dcg`, `estado`, `get_g`, `limpar_texto`, `maiuscula`, `ndcg`, `Quebra`, `tokenizar`
<!-- estado-R:fim -->

