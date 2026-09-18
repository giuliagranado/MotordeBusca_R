# 04_IndiceInvertido_Snowball.md - consolidado
 o arquivo [04_IndiceInvertido_Snowball.r](https://github.com/giuliagranado/MotordeBusca_R/blob/main/codigos/04_IndiceInvertido_Snowball.r), em que:
* Importamos os arquivos das cidades utilizando a API da wikipedia
* Importamos as bibliotecas *SnowballC* e *httr2*
* Foi atribuído a uma variável vetor o nome e conteúdo de cada uma das três cidades
<p> Depois todo o conteúdo passou por uma limpeza: passar tudo para minúsculo, remover os acentos, transformar 'ç' em 'c', transformar todo caractere que
não-for-letra em espaço, remover os espaços múltiplos e por último, retirados os espaços das pontas do texto
</p>

<p> Após a limpeza, foi criado uma lista com as stopwords mais frequentes da amostra, aplicando a lista e removendo as stopwords. Sendo aplicado em todos os docs em conjunto 
ao Snowball, que reduz a palavra a seu radical, removendo a conjugação, vogal temática, feminino/masculino, etc.  
posteriormente, criado um Índice Invertido, em que pesquisamos o termo e recebemos em resposta em qual arquivo ele existe. Como exemplo foram pesquisadas 'port', 'turism' e
'cidad', 
</p>

<p> Foram criadas as buscas pelo índice 'AND' e 'OR', retornando respectivbamente: se há as duas palavras/termos pesquisados na amostra,
  e se há uma das duas palavras/termos pesquisados em um dos artigos das cidades da amostra. 
</p>

<p> Por último foi criado as Estatísticas, retornando o número de termos presentes nos artigos e quanta vezes cada um desses termos apareceu. 
  (Sendo retornado o trecho da lista solicitado, no caso do exemplo do código foram os 100 prmeiros).
</p>


> *obs: a biblioteca SnowballC deve ser instalada apenas uma única vez.*
> 
> *Dica: Pesquise o termo utillizando apenas o radical da palavra, assim há uma chance maior de um retorno correspondente*
