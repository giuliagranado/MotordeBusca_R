
Consolidado — PI III — Aula 07 — 2026-10-23

guia versão 2 · tutora: GPT-5.6 Luna · sessão individual (teoria) · motor07
Aluno: Gabrielle Lara
1. O que foi passado

    M1 — descasamento de vocabulário: "busca", "ranqueamento", "buscar"
    M2 — esparso × denso; d1 com 7 de 45; hipótese distribucional
    M3 — LSA: $W = U,\Sigma,V^{\top}$; energia $0{,}323$ com $k = 2$
    M4 — consulta dobrada $(-0{,}370;\ 0{,}445)$; AP $1$; $k$ como hiperparâmetro
    M5 — limites do LSA: d4 em "busca"; d3 × d8 ($0{,}058 \to 1$); $k$ entre ganho e ruído
    M6 — RRF; d3 = $0{,}0325$ à mão; híbrido nDCG graduado $0{,}990$

2. Como foi o aprendizado — opinião da tutora

Eu avancei pela Aula 07 entendendo melhor a diferença entre uma busca lexical e uma representação densa. Consegui resolver a conta do RRF de d6 sozinho e reconheci que o RRF trabalha com posições, evitando combinar diretamente escalas incompatíveis. No teste final, acertei as questões sobre representação esparsa/densa e sobre a consulta dobrada. Precisei corrigir dois pontos: a energia da SVD usa os quadrados das singular values, e a compressão do LSA pode criar proximidades artificiais, em vez de deixar a representação simplesmente mais próxima da original. Também identifiquei o descasamento de vocabulário em "aprendizagem"; a justificativa precisava enfatizar que a palavra não aparece lexicalmente no corpus, que usa "aprendizado".

Teste final: acertei Q1, Q2, Q4 e Q6; revisei Q3 (energia por quadrados das singular values) e Q5 (efeitos da compressão no LSA).
3. Observações para a frente

    Revisar antes da Aula 08: energia da SVD e efeito de $k$ no LSA, porque são os dois pontos em que precisei corrigir o raciocínio.
    Para a próxima tutora: posso manter o ritmo de perguntas curtas; tenho conforto suficiente para fazer contas simples de matrizes/ranking, mas vale conferir os detalhes matemáticos antes de concluir.
    Perguntas guardadas: nenhuma.
    Produzido: lsa, ranking_lsa, rrf; LSA $k = 2$ d2 d3 d8 d6 d5 d1 d4 d7; híbrido d3 d2 d1 d8 d6 d4 d5 d7
    Parte D (sessão de grupo): a marcar — com a ficha do projeto
