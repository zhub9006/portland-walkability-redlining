# ========================================
# Portland Walkability and Redlining Analysis
# Author: Bea Woodbury
# Date: 2026
# Summary: Linear Regression analysis examining the relationship 
# between HOLC redlining grades and walkability within 
# neighborhoods in Portland, Oregon


# Install and Load Packages
library(tidyverse)
library(stargazer)
library(car)
library(lmtest)
library(sandwich)
library(ggplot2)
library(corrplot)


# Load Data Set 
data <- read.csv("data/Portland_Analysis_Data.csv")


# Initial Check
head(data)
str(data)
summary(data)

# Clean Data 

# Grade to Factor
data$grade <- factor(data$grade, levels = c("A", "B", "C", "D"))

# Redlined to factor
data$redlined <- factor(data$redlined, labels = c("Not Redlined", "Redlined"))

# Keep only graded neighborhoods
data_holc <- data %>%
  filter(!is.na(grade))

data_regression <- data %>%
  filter(grade %in% c("A", "B", "C", "D"))

# EDA

summary(data_regression[, c("AVG_WALK", "Avg_Vul", "AVG_POC", 
                            "AVG_INC", "grade", "redlined")])

# Walkability by HOLC Grade
data_regression %>%
  group_by(grade) %>%
  summarise(
    n = n(),
    mean_walk = round(mean(AVG_WALK), 2),
    sd_walk = round(sd(AVG_WALK), 2),
    min_walk = round(min(AVG_WALK), 2),
    max_walk = round(max(AVG_WALK), 2)
  )

# Walkability by Redlined Status
data_regression %>%
  group_by(redlined) %>%
  summarise(
    n = n(),
    mean_walk = round(mean(AVG_WALK), 2),
    sd_walk = round(sd(AVG_WALK), 2),
    min_walk = round(min(AVG_WALK), 2),
    max_walk = round(max(AVG_WALK), 2)
  )

data_regression %>%
  group_by(grade) %>%
  summarise(
    n = n(),
    mean_walk = round(mean(AVG_WALK), 2),
    sd_walk = round(sd(AVG_WALK), 2),
    min_walk = round(min(AVG_WALK), 2),
    max_walk = round(max(AVG_WALK), 2)
  )


# Visualization

# Walkability by HOLC Grade 
ggplot(data_regression, aes(x = grade, y = AVG_WALK, fill = grade)) +
  geom_boxplot() +
  scale_fill_manual(values = c(
    "A" = "#76a865",
    "B" = "#7db5c4",
    "C" = "#e8d283",
    "D" = "#d9838d"
  )) +
  labs(
    x = "HOLC Grade",
    y = "Walkability Score (0-100)",
    fill = "HOLC Grade",
    caption = "Source: City of Portland Complete Neighborhoods Score"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Regression

# Model 1: Binary Redlined 
model1 <- lm(AVG_WALK ~ redlined + Avg_Vul, 
             data = data_regression)

summary(model1)

# Model 2: Categorical Grade 
# Grade A is the reference category
model2 <- lm(AVG_WALK ~ grade + Avg_Vul, 
             data = data_regression)

summary(model2)

# Model 3: Binary with all control variables
model3 <- lm(AVG_WALK ~ redlined + Avg_Vul + AVG_POC + AVG_INC,
             data = data_regression)

summary(model3)

# Model 4: Categorical with all control variables 
model4 <- lm(AVG_WALK ~ grade + Avg_Vul + AVG_POC + AVG_INC,
             data = data_regression)

summary(model4)

# Regression Diagnostics


# Multicollinearity Check (VIF)
cat("Model 1 VIF:\n")
vif(model1)

cat("\nModel 2 VIF:\n")
vif(model2)

cat("\nModel 3 VIF:\n")
vif(model3)

cat("\nModel 4 VIF:\n")
vif(model4)

# Diagnostic Plots 
par(mfrow = c(2, 2))
plot(model2, main = "Model 2 Diagnostics")

par(mfrow = c(2, 2))
plot(model4, main = "Model 4 Diagnostics")

# Breusch-Pagan Test for Heteroskedasticity 

cat("\nBreusch-Pagan Test Model 1:\n")
bptest(model1)

cat("\nBreusch-Pagan Test Model 2:\n")
bptest(model2)

cat("\nBreusch-Pagan Test Model 3:\n")
bptest(model3)

cat("\nBreusch-Pagan Test Model 4:\n")
bptest(model4)

# Shapiro-Wilk Test for Normality of Residuals

cat("\nShapiro-Wilk Test Model 1:\n")
shapiro.test(residuals(model1))

cat("\nShapiro-Wilk Test Model 2:\n")
shapiro.test(residuals(model2))

cat("\nShapiro-Wilk Test Model 3:\n")
shapiro.test(residuals(model3))

cat("\nShapiro-Wilk Test Model 4:\n")
shapiro.test(residuals(model4))


# Robust Standard Errors for Model 1 
library(sandwich)
library(lmtest)

coeftest(model1, vcov = vcovHC(model1, type = "HC3"))
coeftest(model3, vcov = vcovHC(model3, type = "HC3"))

# Identify influential neighborhoods
data_regression[c(24, 49, 63), c("NAME", "grade", "AVG_WALK", 
                                 "Avg_Vul", "AVG_POC", "AVG_INC")]
                

# Revised Models - Addressing Multicollinearity


# Model 3a: Binary + Income only 
model3a <- lm(AVG_WALK ~ redlined + AVG_INC,
              data = data_regression)
summary(model3a)
vif(model3a)

# Model 3b: Binary + POC only 
model3b <- lm(AVG_WALK ~ redlined + AVG_POC,
              data = data_regression)
summary(model3b)
vif(model3b)

# Model 4a: Categorical + Income only 
model4a <- lm(AVG_WALK ~ grade + AVG_INC,
              data = data_regression)
summary(model4a)
vif(model4a)

# Model 4b: Categorical + POC only 
model4b <- lm(AVG_WALK ~ grade + AVG_POC,
              data = data_regression)
summary(model4b)
vif(model4b)

# Regression Table for Outputs
stargazer(model1, model2, model4b, model2_sens,
          type = "html",
          out = "outputs/regression_table.html",
          title = "OLS Regression Models: Walkability and HOLC Redlining in Portland Neighborhoods",
          column.labels = c("Model 1", "Model 2", "Model 4b", "Sensitivity"),
          covariate.labels = c("Redlined (D=1)", 
                               "Grade B", "Grade C", "Grade D",
                               "Vulnerability Score",
                               "Percent POC"),
          dep.var.labels = "Walkability Score (AVG_WALK)",
          add.lines = list(
            c("Reference Category", "A/B/C=0", "Grade A", "Grade A", "Grade A"),
            c("Forest Park Included", "Yes", "Yes", "Yes", "No")
          ),
          notes = "Robust standard errors used for Model 1. Grade A is reference category for categorical models.",
          star.cutoffs = c(0.05, 0.01, 0.001))
