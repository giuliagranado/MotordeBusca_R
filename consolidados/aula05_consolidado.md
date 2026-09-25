<h2><strong> Relatório de Avaliação do Motor de Busca </strong> </h2>
<strong>Disciplina:</strong> Projeto Integrador III — Tecnologia em Ciência de Dados (FATEC)  </br>
<strong>Grupo:</strong> Gabrielle Lara, Giulia Granado, Yuri Salgado

---

<h3> 1. Corpus e Usuário Imaginado </h3>
<p>Como o corpus inteiro se enquadrava no range de 50-200 sugerido para amostragem, foi decidido usá-lo por inteiro. Tal corpus conta com parágrafos retirados da wikipédia para as cidades de Santos, São Vincente e Cubatão, cada qual identificado por um id único,
o nome referente ao documento que pertence e o número do parágrafo dentro do documento. Não havia lacunas de preenchimento. Segue um exemplo de linha</p>
<table>
  <tr>
    <th>1</th>	
    <th>Santos</th>
    <th>1</th>	
    <th> Santos é um município brasileiro no litoral do estado de São Paulo, Região Sudeste do país. Abriga o maior porto da América Latina, que é o principal responsável pela dinâmica econômica da cidade ao lado do turismo, da pesca e do comércio. Ocupa a 5.ª colocação entre as não capitais mais importantes para a economia brasileira e 10.ª colocada segundo a qualidade de vida. A cidade é sede do poder executivo paulista todo dia 13 de junho (capital simbólica de São Paulo) e não apenas sede de diversas instituições de ensino superior como também da mais antiga entidade geral estudantil do Brasil, o Centro dos Estudantes de Santos. </th>
  </tr>
</table>
<p>Como "perfil de usuário", ou seja, orientação quanto ao tipo das consultas, decidiu-se um turista pesquisando assuntos relevantes á sua estadia ou alguém com interesse de se mudar avaliando qualidade de vida</p>

<h3> 2. Necessidades de Informação </h3>
<p>Para orientar o julgamento dos documentos, foi decidido explorar 10 necessidades distintas, ainda que com interseção. Cada necessidade é englobada com um escopo, delimitando quais casos pouco relacionados não são de interesse, e a consulta vinda dela. Segue a tabela de consultas:</p>
<table>
  <tr>
    <th>Consulta</th>
    <th>Necessidade</th>
    <th>Escopo</th>
  </tr>
  <tr>
    <th>museus turismo cultural centro historico</th>
    <th>O usuário deseja conhecer opções de museus e equipamentos culturais para visitar na cidade.</th>
    <th>Menções genéricas a eventos sem espaço físico ou sobre entidades estudantis não contam.</th>
  </tr>
  <tr>
    <th>qualidade de vida economia ranking</th>
    <th>O usuário busca informações sobre a qualidade de vida e o nível de desenvolvimento humano e econômico para morar.</th>
    <th>Listagens apenas de produção agrícola ou industrial histórica sem indicador de qualidade de vida não contam.</th> 
  </tr>
  <tr>
    <th>porto dinamica economica turismo pesca</th>
    <th>O usuário quer entender a importância do setor portuário na economia local e sua relação com o turismo.</th>
    <th>Textos sobre outros portos do Brasil ou apenas aspectos biológicos da pesca não contam.</th> 
  </tr>
  <tr>
    <th>fundacao historia bras cubas seculo XVI</th>
    <th>O usuário busca informações históricas sobre a fundação do município e seus personagens.</th>
    <th>História recente (século XXI) sem menção às origens coloniais não conta.</th> 
  </tr>
  <tr>
    <th>populacao habitantes regiao metropolitana baixada santista</th>
    <th>O usuário busca dados de população e dinâmica regional para entender se a cidade faz parte de uma grande área metropolitana.</th>
    <th>Área territorial em km² isolada sem dados demográficos ou regionais não conta.</th> 
  </tr>
  <tr>
    <th>ciclo do cafe bolsa do cafe museu</th>
    <th>O usuário quer saber a relação da cidade com o ciclo do café e o patrimônio decorrente dessa época.</th>
    <th>Produção de café em outras regiões do estado fora da cidade não conta.</th> 
  </tr>
  <tr>
    <th>faculdades universidades ensino superior</th>
    <th>O usuário procura saber se a cidade possui tradição e instituições consolidadas de ensino superior.</th>
    <th>Escolas de ensino fundamental/médio ou cursos técnicos curtos não contam.</th> 
  </tr>
  <tr>
    <th>capital simbolica poder executivo paulista</th>
    <th>O usuário quer entender o papel político e de liderança regional do município no estado de São Paulo.</th>
    <th>Notícias cotidianas da prefeitura local sem relevância de representação estadual não contam.</th> 
  </tr>
  <tr>
    <th>bras arte benedito calixto patrimonio</th>
    <th>O usuário busca atrações turísticas associadas a obras de arte e arquitetura histórica.</th>
    <th>Exposições temporárias de arte moderna sem vínculo com a história/patrimônio da cidade não contam.</th> 
  </tr>
  <tr>
    <th>complexo metropolitano expandido grande sao paulo</th>
    <th>O usuário procura saber o papel do município no Complexo Metropolitano Expandido e sua conexão com a capital.</th>
    <th>Cidades do interior paulista sem ligação direta com a megalópole/litoral não contam.</th> 
  </tr>
</table>

<h3> 3. Guia de Julgamento e Escala </h3>
<p>O julgamento foi deita em uma escala não binária, de três níveis distintos, a fim de dar mais flexibilidade aos julgametos, foi usada a seguinte escala:</p>
<ul>
<li><strong>Grau 2</strong> (Relevante): O parágrafo responde diretamente à necessidade em prosa.</li>
<li><strong>Grau 1</strong> (Parcialmente Relevante): Fala do assunto, mas não atende totalmente à necessidade.</li>
<li><strong>Grau 0</strong> (Irrelevante): Não possui relação útil com a necessidade em prosa.</li>
</ul>


<h3> 4. Desenho da Amostra e Viés do Pooling </h3>
*Explicação do método de pooling com top-k (k=5) unificado e embaralhado a partir dos modelos Booleano, TF-IDF e BM25. Discussão sobre o viés do pooling (superestimação do Recall real devido aos documentos não recuperados na pool).*

<h3> 5. Concordância entre Juízes </h3>
<p>Todos os três membros do grupo realizaram o julgamento, assim existem três análises kappa distintas. Em geral, todos os níveis de concordância eram acima de 50%, com os valores de pe criculando entorno de 34%</br>
O menor índice de concordância foi de 52%, com um Kappa de 0.2629, entre o juíz um e o juíz dois, gerando a seguinte matriz de confusão:</p>
<table>
  <tr>
    <th>cf</th>
    <th>0</th>
    <th>1</th>
    <th>2</th>
  </tr>
  <tr>
    <th>0</th>
    <th>8</th>
    <th>4</th>
    <th>0</th>
  </tr>
   <tr>
    <th>1</th>
    <th>10</th>
    <th>7</th>
    <th>6</th>
  </tr>
  <tr>
    <th>2</th>
    <th>3</th>
    <th>11</th>
    <th>22</th>
  </tr>
</table>
<p>Nesse caso houve alta ambiguidade, 34 dos 71 items julgados mostraram discordância</br> As demais comparações tiveram concordância observada idêntica, com apenas 0.0005 de diferença no valor Kappa. 
considerando que ambas tinham o mesmo número de discordâncias, essa pequena discrepância se deve únicamente á tabela de confusão, que são as seguintes:</p>
<h4>Juíz 1 e 3</h4>
<table>
  <tr>
    <th>cf</th>
    <th>0</th>
    <th>1</th>
    <th>2</th>
  </tr>
  <tr>
    <th>0</th>
    <th>16</th>
    <th>2</th>
    <th>3</th>
  </tr>
   <tr>
    <th>1</th>
    <th>9</th>
    <th>8</th>
    <th>5</th>
  </tr>
  <tr>
    <th>2</th>
    <th>2</th>
    <th>6</th>
    <th>20</th>
  </tr>
</table>
<h4>Juíz 2 e 3</h4>
<table>
  <tr>
    <th>cf</th>
    <th>0</th>
    <th>1</th>
    <th>2</th>
  </tr>
  <tr>
    <th>0</th>
    <th>10</th>
    <th>2</th>
    <th>0</th>
  </tr>
   <tr>
    <th>1</th>
    <th>9</th>
    <th>10</th>
    <th>4</th>
  </tr>
  <tr>
    <th>2</th>
    <th>8</th>
    <th>4</th>
    <th>24</th>
  </tr>
</table>
<h3> 6. Resultados por Métrica </h3>
*Tabela comparativa consolidada contendo os desempenhos médios dos três modelos nas métricas: P@1, P@3, P@5, P@10, R@1, R@3, R@5, R@10, MAP, MRR, nDCG binário e nDCG graduado.*

| Modelo | MAP | MRR | nDCG Binário | nDCG Graduado | P@3 | R@3 |
|---|---|---|---|---|---|---|
| **Booleano** | - | - | - | - | - | - |
| **TF-IDF** | - | - | - | - | - | - |
| **BM25** | - | - | - | - | - | - |

## 7. Análise Qualitativa por Consulta
*Análise individualizada das consultas em que o BM25 superou o TF-IDF e vice-versa. Estudo de casos onde falhas de vocabulário ou normalização de tamanho do texto causaram queda de desempenho nos modelos.*

## 8. Limitações do Experimento
<p>O corpus era inteiramente da wikipédia, assim haviam limitações quanto aos tipos de informações poderiam ser encontrada, com atrativos temporários ou relatos de vivência, por exemplo, não constando nas buscas
mesmo sendo relvantes para a necessidade. O corpus também se limita á apenas três cidade, uma das quais tem um artigo significantemente maior que as outras, assim aparecendo mais vezes. o pooling, em certas situações, também retornou parágrafos curtos
que não continham informações completas ao invés das informações em si, que estavam quebradas separadamente, por não ser capaz de entender contexto</p>

## 9. Conclusão
*Síntese dos achados experimentais, indicação do modelo de recuperação mais adequado para a aplicação e considerações finais.*

