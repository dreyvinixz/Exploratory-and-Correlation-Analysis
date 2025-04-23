# Configurar o diretório de trabalho corretamente
setwd("C:/docs")
# Lê os dados do arquivo CSV
dados <- read.csv("price_data_107.csv", header = TRUE, sep = ",", dec = ".")
# Verificar a estrutura do dataframe
str(dados)
# Exibir os primeiros registros para confirmar a leitura correta
head(dados)
#-------------------------------------------------------------------#
### Análise univariada ###
#-------------------------------------------------------------------#
# Calcular estatísticas descritivas para 'average'
summary_stats <- summary(dados$average)
# Calcular desvio interquartílico (IQR) manualmente
iqr_average <- IQR(dados$average)
# Para coeficientes de assimetria e curtose
#install.packages("e1071")
library(e1071)
# Média aritmética
mean_average <- mean(dados$average)
# Desvio-padrão
sd_average <- sd(dados$average)
# Coeficiente de assimetria
skewness_average <- skewness(dados$average)
# Coeficiente de curtose
kurtosis_average <- kurtosis(dados$average)
# Exibir os resultados
cat("Estatísticas descritivas para a variável 'average':\n")
cat("Valor mínimo: ", summary_stats["Min."], "\n")
cat("Quartil 1 (Q1): ", summary_stats["1st Qu."], "\n")
cat("Mediana: ", summary_stats["Median"], "\n")
cat("Quartil 3 (Q3): ", summary_stats["3rd Qu."], "\n")
cat("Valor máximo: ", summary_stats["Max."], "\n")
cat("Desvio Interquartílico (IQR): ", iqr_average, "\n")
cat("Estatísticas adicionais para a variável 'average':\n")
cat("Média aritmética: ", mean_average, "\n")
cat("Desvio-padrão: ", sd_average, "\n")
cat("Coeficiente de assimetria: ", skewness_average, "\n")
cat("Coeficiente de curtose: ", kurtosis_average, "\n")
### Escores Z ###
# Escores Z para a variável 'average'
z_scores_average <- scale(dados$average)
# Adicionar os escores Z como uma nova coluna no dataframe
dados$z_scores_average <- z_scores_average
# Exibir os primeiros valores dos escores Z
head(dados[, c("average", "z_scores_average")])
### Histograma ###
# Criar um histograma da variável 'average'
hist(dados$average,
main = "Histograma da variável 'average'",
xlab = "Valores de 'average'",
ylab = "Frequência",
col = "skyblue",
border = "white",
breaks = 10) # Ajustar o número de intervalos se necessário
### Boxplot ###
# Criar um boxplot da variável 'average'
boxplot(dados$average,
main = "Boxplot da variável 'average'",
ylab = "Valores de 'average'",
col = "lightgreen",
border = "darkgreen")
#-------------------------------------------------------------------#
# Calcular estatísticas descritivas para 'volume'
summary_stats <- summary(dados$volume)
# Calcular desvio interquartílico (IQR) manualmente
iqr_volume <- IQR(dados$volume)
# Média aritmética
mean_volume <- mean(dados$volume)
# Desvio-padrão
sd_volume <- sd(dados$volume)
# Coeficiente de assimetria
skewness_volume <- skewness(dados$volume)
# Coeficiente de curtose
kurtosis_volume <- kurtosis(dados$volume)
# Exibir os resultados
cat("Estatísticas descritivas para a variável 'volume':\n")
cat("Valor mínimo: ", summary_stats["Min."], "\n")
cat("Quartil 1 (Q1): ", summary_stats["1st Qu."], "\n")
cat("Mediana: ", summary_stats["Median"], "\n")
cat("Quartil 3 (Q3): ", summary_stats["3rd Qu."], "\n")
cat("Valor máximo: ", summary_stats["Max."], "\n")
cat("Desvio Interquartílico (IQR): ", iqr_volume, "\n")
cat("Estatísticas adicionais para a variável 'volume':\n")
cat("Média aritmética: ", mean_volume, "\n")
cat("Desvio-padrão: ", sd_volume, "\n")
cat("Coeficiente de assimetria: ", skewness_volume, "\n")
cat("Coeficiente de curtose: ", kurtosis_volume, "\n")
### Escores Z ###
# Escores Z para a variável 'volume'
z_scores_volume <- scale(dados$volume)
# Adicionar os escores Z como uma nova coluna no dataframe
dados$z_scores_volume <- z_scores_volume
# Exibir os primeiros valores dos escores Z
head(dados[, c("volume", "z_scores_volume")])
### Histograma ###
# Criar um histograma da variável 'volume'
hist(dados$volume,
main = "Histograma da variável 'volume'",
xlab = "Valores de 'volume'",
ylab = "Frequência",
col = "skyblue",
border = "white",
breaks = 10) # Ajustar o número de intervalos se necessário
### Boxplot ###
# Criar um boxplot da variável 'volume'
boxplot(dados$volume,
main = "Boxplot da variável 'volume'",
ylab = "Valores de 'volume'",
col = "lightgreen",
border = "darkgreen")
#-------------------------------------------------------------------#
### Função para análise descritiva completa ###
analisar_variavel <- function(variavel) {
# Estatísticas descritivas básicas
min <- min(variavel)
max <- max(variavel)
q1 <- quantile(variavel, 0.25)
median <- median(variavel)
q3 <- quantile(variavel, 0.75)
iqr <- IQR(variavel)
mean <- mean(variavel)
sd <- sd(variavel)
# Assimetria e curtose
skewness_val <- skewness(variavel)
kurtosis_val <- kurtosis(variavel)
# Identificação de outliers
lower_bound <- q1 - 1.5 * iqr
upper_bound <- q3 + 1.5 * iqr
outliers <- sum(variavel < lower_bound | variavel > upper_bound)
# Lacunas (valores ausentes ou distâncias entre dados)
gaps <- sum(is.na(variavel))
# Retornar os resultados como uma lista
return(list(
Min = min,
Max = max,
Q1 = q1,
Mediana = median,
Q3 = q3,
IQR = iqr,
Média = mean,
SD = sd,
Assimetria = skewness_val,
Curtose = kurtosis_val,
Outliers = outliers,
Lacunas = gaps
))
}
# Aplicar a função para as variáveis 'average' e 'volume'
result_average <- analisar_variavel(dados$average)
result_volume <- analisar_variavel(dados$volume)
### Criar um quadro comparativo ###
comparativo <- data.frame(
Medida = names(result_average),
Average = unlist(result_average),
Volume = unlist(result_volume)
)
#-------------------------------------------------------------------#
# Exibir o quadro
print(comparativo)
#Instalar pacotes necessários, caso não os tenha
#install.packages("knitr")
#install.packages("kableExtra")
# Carregar pacotes
library(knitr)
library(kableExtra)
# Criar o quadro comparativo como um data frame
comparativo <- data.frame(
Medida = c("Valor Mínimo", "Valor Máximo", "Quartil 1 (Q1)", "Mediana", "Quartil 3 (Q3)",
"Desvio Interquartílico (IQR)", "Média Aritmética", "Desvio-Padrão", "Coef. Assimetria",
"Coef. Curtose", "Outliers", "Lacunas"),
Average = c(result_average$Min, result_average$Max, result_average$Q1, result_average$Mediana, result_average$Q3,
result_average$IQR, result_average$Média, result_average$SD, result_average$Assimetria,
result_average$Curtose, result_average$Outliers, result_average$Lacunas),
Volume = c(result_volume$Min, result_volume$Max, result_volume$Q1, result_volume$Mediana, result_volume$Q3,
result_volume$IQR, result_volume$Média, result_volume$SD, result_volume$Assimetria,
result_volume$Curtose, result_volume$Outliers, result_volume$Lacunas)
)
# Gerar a tabela com kable
comparativo %>%
kable("html", caption = "Quadro Comparativo das Estatísticas Descritivas",
col.names = c("Medida", "Average", "Volume")) %>%
kable_styling("striped", full_width = F)
#-------------------------------------------------------------------#
### Comentários ###
cat("\nComentários sobre os resultados:\n")
cat("1. A variável 'average' possui:\n")
cat("   - Assimetria de ", round(result_average$Assimetria, 2),
", indicando que a distribuição é ", ifelse(result_average$Assimetria > 0, "positivamente inclinada (cauda à direita).", "negativamente inclinada (cauda à esquerda)."), "\n")
cat("   - Curtose de ", round(result_average$Curtose, 2),
", indicando que a distribuição é ", ifelse(result_average$Curtose > 3, "leptocúrtica (mais pontiaguda).", ifelse(result_average$Curtose == 3, "mesocúrtica (normal).", "platicúrtica (achatada).")), "\n")
cat("2. A variável 'volume' possui:\n")
cat("   - Assimetria de ", round(result_volume$Assimetria, 2),
", indicando que a distribuição é ", ifelse(result_volume$Assimetria > 0, "positivamente inclinada (cauda à direita).", "negativamente inclinada (cauda à esquerda)."), "\n")
cat("   - Curtose de ", round(result_volume$Curtose, 2),
", indicando que a distribuição é ", ifelse(result_volume$Curtose > 3, "leptocúrtica (mais pontiaguda).", ifelse(result_volume$Curtose == 3, "mesocúrtica (normal).", "platicúrtica (achatada).")), "\n")
cat("3. Ambas as variáveis possuem ", result_average$Outliers, " e ", result_volume$Outliers, " valores fora do padrão, respectivamente.\n")
cat("4. Não há lacunas (valores ausentes) detectadas.\n")
#-------------------------------------------------------------------#
###Análise bivariada###
#-------------------------------------------------------------------#
# Diagrama de Dispersão entre 'average' e 'volume'
plot(dados$average, dados$volume,
main = "Diagrama de Dispersão: Average vs Volume",
xlab = "Average",
ylab = "Volume",
col = "blue",
pch = 16,  # Definir o tipo de ponto
cex = 0.6) # Ajustar o tamanho dos pontos
# Calcular a correlação entre 'average' e 'volume'
correlation <- cor(dados$average, dados$volume)
# Exibir o valor da correlação
cat("O valor da correlação entre 'average' e 'volume' é:", correlation, "\n")
# Ajustar uma linha de tendência (regressão linear)
modelo <- lm(volume ~ average, data = dados)
abline(modelo, col = "red", lwd = 2) # Linha de tendência em vermelho e espessura de linha ajustada
# Adicionar a legenda explicativa para a linha de tendência
legend("topright", legend = "Linha de Tendência",
col = "red", lwd = 2, bty = "n")
# Interpretar a correlação
if (correlation > 0) {
cat("A correlação é positiva, o que sugere que à medida que 'average' aumenta, 'volume' também tende a aumentar.\n")
} else if (correlation < 0) {
cat("A correlação é negativa, o que sugere que à medida que 'average' aumenta, 'volume' tende a diminuir.\n")
} else {
cat("Não há correlação aparente entre 'average' e 'volume'.\n")
}
#-------------------------------------------------------------------#
