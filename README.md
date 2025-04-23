# Exploratory and Correlation Analysis

Este repositório contém scripts, dados e gráficos utilizados em uma análise exploratória e de correlação entre variáveis financeiras, utilizando R como linguagem de programação estatística.

## 📁 Estrutura do Repositório

A organização está dividida em diretórios temáticos para facilitar a reprodutibilidade e manutenção do projeto:

```
Exploratory-and-Correlation-Analysis/
│
├── artigo/              # Artigos científicos de apoio teórico
│   ├── Análise Exploratória e de Correlação.pdf
│   └── Análise Multivariada.pdf
│
├── code/                # Scripts em R utilizados nas análises
│   ├── fase1.r          # Análise descritiva e correlação
│   └── fase2.r          # Modelagem estatística e diagnóstico
│
├── data/                # Conjunto de dados utilizado no estudo
│   └── price_data_107.csv
│
├── images/              # Visualizações geradas durante a análise
│   ├── Rplot01.png
│   ├── Rplot02.png
│   └── ...
│
└── README.md            # Este arquivo
```

## 🔧 Dependências

Para executar os scripts corretamente, as seguintes bibliotecas R são necessárias:

- `e1071` – para cálculo de assimetria e curtose;
- `lmtest` – para testes estatísticos em modelos lineares;
- `car` – para o teste de Durbin-Watson (opcional);
- `stats` – pacote base do R (já incluído);
- `graphics` – para os gráficos (já incluído).

Você pode instalar as dependências com:

```r
install.packages(c("e1071", "lmtest", "car"))
```

## 💻 Instalação do R e RStudio

### Instalar o R:

1. Acesse o site oficial: [https://cran.r-project.org/](https://cran.r-project.org/)
2. Escolha o seu sistema operacional (Windows, macOS ou Linux).
3. Baixe e siga as instruções de instalação.

### Instalar o RStudio:

1. Acesse o site: [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)
2. Baixe a versão gratuita do RStudio Desktop.
3. Siga o instalador conforme o seu sistema operacional.

> ⚠️ O R deve estar instalado **antes** do RStudio.

## 📊 Descrição Geral

A análise compreende:

- Visualização e sumarização estatística dos dados;
- Testes de correlação (Pearson);
- Ajuste de modelos de regressão linear;
- Avaliação da qualidade do modelo via ANOVA, R² e resíduos;
- Diagnósticos estatísticos (normalidade, autocorrelação, heterocedasticidade).

## 📌 Referências

- Apostilas presentes na pasta `artigo/`;
- Testes e conceitos aplicados conforme literatura estatística aplicada.

---

Sinta-se à vontade para abrir *issues* ou contribuir com melhorias!

