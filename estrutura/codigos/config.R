# ==============================================================================
# config.R - Configurações do Motor de Busca
# Grupo: GGYeah - Projeto Integrador III
# Atualizado na Aula 06 (Rocchio e Pseudo-Realimentação)
# ==============================================================================

cfg <- list(
  # --- Configurações Básicas ---
  limiar     = 2,       # Grau de relevância mínimo (escala 0, 1, 2)
  minusculas = TRUE,    # Normalização de caixa baixa

  # --- Aula 06: Realimentação de Relevância e PRF ---
  # 0 = sem pseudo-realimentação (decisão do grupo após teste de drift)
  prf_k   = 0,
  
  # Pesos de referência da fórmula de Rocchio testados:
  # alpha (peso da consulta original) = 1.00
  # beta  (peso do centroide dos relevantes Dr) = 0.75
  # gamma (peso do centroide dos não-relevantes Dnr) = 0.15
  rocchio = c(a = 1, b = 0.75, g = 0.15)
)
