# Corpus - Baixada Santista (Santos, São Vicente, Cubatão)
# Coleta de texto via API da Wikipédia e divisão em parágrafos


library(httr2)

# 1. Baixa o texto puro (extract) de um artigo da Wikipédia
baixar_wiki <- function(titulo) {
  resp <- request("https://pt.wikipedia.org/w/api.php") |>
    req_url_query(
      action      = "query",
      prop        = "extracts",
      explaintext = 1,
      format      = "json",
      redirects   = 1,
      titles      = titulo
    ) |>
    req_perform() |>
    resp_body_json()

  pagina <- resp$query$pages[[1]]

  if (is.null(pagina$extract) || is.null(pagina$title)) {
    warning(sprintf("Não foi possível obter o artigo: %s", titulo))
    return(NULL)
  }

  list(titulo = pagina$title, texto = pagina$extract)
}


# 2. Divide o texto do artigo em parágrafos
dividir_em_paragrafos <- function(texto, titulo) {
  # a API retorna os parágrafos separados por quebras de linha
  paragrafos <- strsplit(texto, "\n+")[[1]]
  paragrafos <- trimws(paragrafos)

  # remove linhas vazias, cabeçalhos de seção (== Título ==) e trechos muito curtos
  paragrafos <- paragrafos[nchar(paragrafos) > 30]
  paragrafos <- paragrafos[!grepl("^==+.*==+$", paragrafos)]

  if (length(paragrafos) == 0) return(NULL)

  data.frame(
    cidade        = titulo,
    paragrafo_num = seq_along(paragrafos),
    texto         = paragrafos,
    stringsAsFactors = FALSE
  )
}


# 3. Coleta as cidades e monta o corpus completo (data frame)
montar_corpus <- function(cidades) {
  lista_docs <- lapply(cidades, function(c) {
    cat(sprintf("Baixando: %s...\n", c))
    art <- baixar_wiki(c)
    if (is.null(art)) return(NULL)
    dividir_em_paragrafos(art$texto, art$titulo)
  })

  lista_docs <- lista_docs[!sapply(lista_docs, is.null)]

  if (length(lista_docs) == 0) {
    stop("Nenhum artigo foi coletado com sucesso.")
  }

  df <- do.call(rbind, lista_docs)
  df <- cbind(id = seq_len(nrow(df)), df)
  rownames(df) <- NULL
  df
}

# 4. Salva o corpus em CSV
salvar_corpus_csv <- function(df, output_dir = "estrutura/bancoDeDados",
                               filename = "wikipedia_cidades.csv") {
  if (!dir.exists(output_dir)) dir.create(output_dir, recursive = TRUE)
  caminho <- file.path(output_dir, filename)
  write.csv(df, caminho, row.names = FALSE, fileEncoding = "UTF-8")
  cat(sprintf("\nCSV salvo em: %s\n", caminho))
  caminho
}


# 5. Salva o corpus em TXT
#    por_cidade = FALSE -> gera 1 arquivo único com todas as cidades
#    por_cidade = TRUE  -> gera 1 arquivo .txt para cada cidade

salvar_corpus_txt <- function(df, output_dir = "/dataset",
                               filename = "wikipedia_cidades.txt",
                               por_cidade = FALSE) {
  if (!dir.exists(output_dir)) dir.create(output_dir, recursive = TRUE)

  if (!por_cidade) {
    # um único arquivo, com cabeçalho por cidade e parágrafos em sequência
    linhas <- unlist(lapply(split(df, df$cidade), function(bloco) {
      c(
        paste0("===== ", bloco$cidade[1], " ====="),
        "",
        bloco$texto,
        "",
        ""
      )
    }), use.names = FALSE)

    caminho <- file.path(output_dir, filename)
    writeLines(linhas, caminho, useBytes = TRUE)
    cat(sprintf("\nTXT salvo em: %s\n", caminho))
    return(caminho)
  }

  # um arquivo .txt por cidade
  caminhos <- sapply(split(df, df$cidade), function(bloco) {
    nome_arquivo <- paste0(gsub("[^A-Za-zÀ-ÿ0-9]+", "_", bloco$cidade[1]), ".txt")
    caminho <- file.path(output_dir, nome_arquivo)
    writeLines(bloco$texto, caminho, useBytes = TRUE)
    cat(sprintf("TXT salvo em: %s\n", caminho))
    caminho
  })

  unname(caminhos)
}


# EXECUÇÃO
cidades <- c("Santos", "São Vicente (São Paulo)", "Cubatão")
corpus <- montar_corpus(cidades)

# inspeciona quantos parágrafos foram coletados por cidade
print(table(corpus$cidade))

# mostra os 10 primeiros registros
#print(head(corpus, 10))

# descomente para visualizar em janela (RStudio)
 #View(corpus)

#source("corpus_cidades.R")

# descomente para salvar em CSV
salvar_corpus_csv(corpus, output_dir = "/dataset")

# descomente para salvar em TXT (um único arquivo com todas as cidades)
 salvar_corpus_txt(corpus, output_dir = "/dataset")

# descomente para salvar em TXT (um arquivo .txt por cidade)
# salvar_corpus_txt(corpus, output_dir = "/dataset", por_cidade = TRUE)
