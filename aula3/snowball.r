#  SnowballC - um pacote que precisa ser instalado uma vez.
install.packages("SnowballC") #so na primeira vez
library(SnowballC)
wordStem(c("documentos","documento","documentacao"),
language="portuguese")
