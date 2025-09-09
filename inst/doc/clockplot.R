## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  warning = FALSE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(clockplot)

## -----------------------------------------------------------------------------
head(smsclock)

## ----eval=FALSE---------------------------------------------------------------
# clock_chart(smsclock, time, Col = "green")

## ----clock-chart, fig.align = 'center', fig.height=6, fig.width=6-------------
p1 <- clock_chart(smsclock, time, Col = "green")
p1 + ggplot2::labs(title = "SMS Receiving Times")

## -----------------------------------------------------------------------------
head(bdquake)

## ----eval=FALSE---------------------------------------------------------------
# clock_chart_col(bdquake, time = hms, crit = mag)

## ----clock-chart-col, fig.align = 'center', fig.height=6, fig.width=6---------
p <- clock_chart_col(bdquake, time = hms, crit = mag)
p + ggplot2::labs(size = "Magnitude", title = "Earthquakes in Bangladesh since 2023")

## ----eval=FALSE---------------------------------------------------------------
# clock_chart_qnt(
#   data = bdquake, time = hms, len = depth,
#   Col = mag, high = "red", low = "blue"
# )

## ----clock-chart-qnt, fig.align = 'center', fig.height=6, fig.width=6---------
p1 <- clock_chart_qnt(
  data = bdquake, time = hms, len = depth,
  Col = mag, high = "red", low = "blue"
)
p1 + ggplot2::labs(
  color = "Depth", size = "Magnitude",
  title = "Earthquakes in Bangladesh since 2023"
)

## ----eval=FALSE---------------------------------------------------------------
# labs(size = "TITLE", color = "")
# # clock_chart_qnt(acdt, time = Time, len = Temperature.F., Col = Temperature.F.)+labs(size = "Temperature", color = "")

## ----clock-chart-acdt, fig.align = 'center', fig.height=6, fig.width=6--------
acdt <- read.csv("https://raw.githubusercontent.com/mahmudstat/open-analysis/main/data/usacc.csv")
clock_chart_qnt(acdt, time = Time, len = Humidity..., Col = Temperature.F.) +
  ggplot2::labs(size = "Humidity", color = "Temperature")

## ----eval=FALSE, clock-chart-len, fig.align = 'center', fig.height=6, fig.width=6----
# p1 <- clock_chart_len(data = bdquake, time = hms, crit = depth)
# p1 + ggplot2::labs(title = "Earthquakes in Bangladesh since 2023")

## -----------------------------------------------------------------------------
head(smsclock, 4)

## ----clock-chart-qlt, fig.align = 'center', fig.height=6, fig.width=6---------
clock_chart_qlt(smsclock, time = time, crit = Title) +
  ggplot2::labs(color = "Sender", title = "SMS's Received throughout the Day")

## ----eval=FALSE---------------------------------------------------------------
# clock_chart_qlt(smsclock, time = time, crit = sender) + facet_wrap(~day)

## ----eval=FALSE---------------------------------------------------------------
# clock_chart_qlt(smsclock, time = time, crit = sender) + facet_wrap(~Title)

## ----cyclic-chart, fig.align = 'center', fig.height=6, fig.width=6------------
Col <- c("#0040ff", "#00bfff", "#8000ff")
cyclic_chart(bdtemp,
  Period = Month, Value = Temperature,
  crit = City, ColV = Col
)

## ----dayc, fig.align = 'center', fig.height=6, fig.width=6--------------------
value <- sample(15:30, 24, replace = TRUE)
day_chart(hvalue = value, high = "blue", low = "yellow", width = 0.8)

