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
