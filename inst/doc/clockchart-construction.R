## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fig.height=4, fig.width=4, fig.align='center', fig.cap="The Unit Circle"----
k <- 100
timepoint <- exp(1i * 2 * pi * (k:1) / k)
plot(timepoint, pch = 19, type = "b")

## ----circle, fig.height=4, fig.width=4, fig.align='center'--------------------
k <- 24
hour <- exp(1i * 2 * pi * (k:1) / k)
plot(hour, pch = 19)

## ----fig.height=4, fig.width=4, fig.align='center'----------------------------
k <- 24 # Hours
subk <- 24 * 4 # Fraction of hours
times <- exp(1i * 2 * pi * (k:1) / k)
subtimes <- data.frame(SubT = exp(1i * 2 * pi * (subk:1) / subk))
ampm <- c(rep(" AM", 6), rep(" PM", 12), rep(" AM", 6))
library(tibble)
dfclock <- tibble(
  time = times,
  hour = c(6:12, 1:12, 1:5), # May not be needed
  label = paste0(c(6:12, 1:5), ampm)
)

## ----skeleton, fig.height=4, fig.width=4, fig.align='center'------------------
library(ggplot2) # Load the package ggplot2
p1 <- dfclock %>% ggplot() +
  geom_path(data = subtimes, aes(Re(SubT), Im(SubT))) +
  # Connect Last two missing points
  geom_line(data = subtimes %>% dplyr::slice(-c(2:95)), aes(Re(SubT), Im(SubT))) +
  theme(aspect.ratio = 1) +
  geom_text(data = dfclock, aes(Re(time) * 1.1, Im(time) * 1.1, label = label)) +
  geom_point(
    data = subtimes,
    aes(Re(SubT), Im(SubT)), shape = 19, color = "black", size = 0.6
  ) +
  geom_point(aes(Re(time), Im(time)), color = "black", size = 1.8)
p1

## ----skeleton_clean, fig.height=4, fig.width=4, fig.align='center'------------
p1 + theme(
  axis.text.x = element_blank(),
  axis.ticks.x = element_blank(),
  axis.text.y = element_blank(),
  axis.ticks.y = element_blank()
) +
  labs(x = "", y = "")

## -----------------------------------------------------------------------------
# Data to check on
chkdf <- data.frame(
  time = c("06:00:00", "12:00:00", "17:30:00", "00:05:25"),
  value = sample(10, 4)
)
library(dplyr)
chkdf %>% tidyr::separate_wider_delim(
  cols = time,
  names = c("hour", "minute", "second"),
  cols_remove = FALSE,
  delim = ":"
)

