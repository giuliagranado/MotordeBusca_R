# Consolidado — PI III — Aula 00 — Parte D — 02/10/2026
*guia versão 3 · tutora: Gemini Notebook · sessão individual (prática) · sem motor*
**Aluno:** Aluno(a)

## 1. O que foi passado
- **M12 — Três frases próprias: sujar, limpar, contar:** Criação do vetor nomeado `f` com três frases sujas (`f1 = "hOra de AvEntUra passa na HoRa do aLMoçO! "`, `f2 = "EU jogo de taRDE e JoGO de nOiTE"`, `f3 = "Morango é de todas AS fRuTas, a MELhor das FRuTas"`). Aplicação do pipeline de limpeza (`trimws`, `tolower`, `gsub("[^a-z ]", "", x)`, `gsub("\\s+", " ", x)`), resultando na frase limpa `'hora de aventura passa na hora do almoo'`. Tokenização e contagem de frequência, identificando `'de'` como o termo mais frequente.
- **M13 — Regex nas suas frases:** Testes de expressões regulares sobre as frases sujas e limpas. Verificação de frases que começam com maiúscula (`FALSE TRUE TRUE`), contêm números (`FALSE FALSE FALSE`), terminam em pontuação (`TRUE TRUE FALSE`), extração da primeira palavra e substituição de espaços por underline. Teste do código `grepl("^\\s*[A-Z]$", trimws(f))` com retorno `FALSE FALSE TRUE`.
- **M14 — O fluxo do curso: Colab e GitHub:** Execução de scripts remotos com `source()`, envio e inspeção de arquivos no Colab com `list.files()`, anexação do estado do R ao consolidado com `anexar_estado()` (gerando 301 linhas de objetos no estado), criação de repositório de treino no GitHub (`pi3-treino`), e leitura de arquivos brutos via URL `Raw`. Resolução do Checkpoint 14 sobre sessões efêmeras do Colab e URLs no formato Raw.

## 2. Como foi o aprendizado — opinião da tutora
O aluno executou a Parte D com pleno domínio prático dos conceitos introduzidos na sessão teórica. Demonstrou autonomia ao construir suas próprias frases com diferentes tipos de "sujeira" (caixa mista, espaços extras e pontuação), prevendo corretamente os resultados de cada etapa do pipeline de limpeza e compreendendo por que termos vazios como `'de'` frequentemente lideram as tabelas de frequência inicial. Na etapa de regex e no fluxo do Colab/GitHub, aplicou com precisão os comandos de inspeção, manipulação remota e versionamento, assimilando com clareza a dinâmica de persistência em nuvem e o papel do formato Raw para integração com o R.

## 3. Observações para a frente
- **Para a próxima tutora:** Aluno pronto para a Aula 01. Compreende perfeitamente o pipeline de limpeza, tokenização, regex e o fluxo de trabalho com Colab e GitHub.
- **Perguntas guardadas:** Nenhuma pergunta pendente.
- **Produzido:** Vetor `f` com 3 frases próprias (temas: TV/desenhos, hábitos/jogos, frutas); termo mais frequente: `'de'`; expressões regulares validadas; repositório `pi3-treino` criado no GitHub; estado do R anexado (301 objetos registrados) e lido de volta via link `Raw`.
- **Parte D (frases próprias + Colab e GitHub):** concluída com sucesso.
