## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(riskclustr)

## ----message = FALSE----------------------------------------------------------
# Load needed packages
library(riskclustr)
library(dplyr)

## -----------------------------------------------------------------------------
# create a new example dataset that contains a factor variable
factor_data <- 
  subtype_data %>%
  mutate(
    x4 = cut(
      x1,
      breaks = c(-3.4, -0.4, 0.3, 1.1, 3.8),
      include.lowest = T,
      labels = c("1st quart",
                 "2nd quart",
                 "3rd quart",
                 "4th quart")
      )
    )

## -----------------------------------------------------------------------------
# Fit the model using x4 in place of x1
mod1 <- eh_test_subtype(
  label = "subtype",
  M = 4,
  factors = list("x4", "x2", "x3"),
  data = factor_data,
  digits = 2
)

## -----------------------------------------------------------------------------
mypval <- posthoc_factor_test(
  fit = mod1, 
  factor = "x4", 
  nlevels = 4
  )

## -----------------------------------------------------------------------------
mypval$pval

## -----------------------------------------------------------------------------
mypval$pval_raw

