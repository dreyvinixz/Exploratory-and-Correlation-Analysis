# Bibliotecas necessárias
library(e1071)
library(lmtest)                    

# Configurar o diretório de trabalho
setwd("C:/rstudio/data")

# Ler os dados
dados <- read.csv("price_data_107.csv", header = TRUE, sep = ",", dec = ".")

# Verificar a estrutura e existência de valores ausentes
str(dados)
head(dados)
if (any(is.na(dados))) {
  stop("O dataset contém valores ausentes!")
}

# Definir variáveis
average <- dados$average
volume <- dados$volume

# Teste de correlação
cor_test <- cor.test(average, volume)
print(cor_test)

# Ajustar o modelo de regressão linear
modelo <- lm(volume ~ average)
print(summary(modelo))

# Diagrama de dispersão com linha de regressão
plot(average, volume,
     main = "Diagrama de Dispersão: Average vs Volume",
     xlab = "Average",
     ylab = "Volume",
     pch = 1)
abline(modelo, col = "blue", lwd = 2)

# Teste da significância dos coeficientes do modelo
summary_coef <- summary(modelo)$coefficients
print(summary_coef)

# Análise de Variância (ANOVA) do modelo
anova_modelo <- anova(modelo)
print(anova_modelo)

#Coeficiente de Determinação (R²)
r_squared <- summary(modelo)$r.squared
adj_r_squared <- summary(modelo)$adj.r.squared
cat("R²:", r_squared, "\n")
cat("R² Ajustado:", adj_r_squared, "\n")

# Análise dos resíduos
residuos <- residuals(modelo)
plot(residuos, main = "Resíduos do Modelo", ylab = "Resíduos", xlab = "Índice")
hist(residuos, main = "Histograma dos Resíduos", xlab = "Resíduos")
qqnorm(residuos)
qqline(residuos, col = "red")

# Estatísticas dos resíduos
resumo_residuos <- list(
  Min = min(residuos),
  Q1 = quantile(residuos, 0.25),
  Mediana = median(residuos),
  Q3 = quantile(residuos, 0.75),
  Max = max(residuos),
  Média = mean(residuos),
  DP = sd(residuos),
  Assimetria = skewness(residuos),
  Curtose = kurtosis(residuos)
)
print(resumo_residuos)

# Testes de diagnóstico
print(Box.test(residuos, lag = 2, type = "Ljung-Box"))
print(shapiro.test(residuos))
print(bptest(modelo))
