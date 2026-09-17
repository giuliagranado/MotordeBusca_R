<h3>TF-IDF</h3>
<p>Para o corpus dessa entrega, decidiu-se utilizar todas as cidades da baixada santista e um artigo extra usado apenas para listar stopwords. Isso foi feito por que todos os 
  artigos reais do corpus contém a palavra "Santos", tornando o idf dela Log(1/1) = 0, como se fosse uma stopword. 
  
<p>Foram feitas as operações da entraga anterior, mostrando as 10 palavras mais comuns e 10 palavras exatamente no meio da tabela, assim como um modelo de busca binário, que foi realizada com 'Santos'
por aparecer em todos documentos da baixada, 'Poética' por aparecer só em um, paralelepipedo por aparecer em nenhum e também uma busca inserida através de input</p>
<p>Logo depois foi feito o processo de tf-id, aonde se toma a frequencia de cada palavra no corpus e atribui á tabela idf o logaritmo do número colunas dividida dessa frequencia, nota-se que era nessa razão
  que se encontrava  problema que trouxe a adição de um documento a mais</p>
  <p>finalmente se faz pesquisa por 'porto de sentos', esperando-se que retorne santos, 'forte militar', esperando que se retorne algumas das cidades com história de fortes, e uma última busca por input</p>
