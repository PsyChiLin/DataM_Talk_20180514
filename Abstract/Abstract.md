---
title: 'Design a Shiny app using R'
author: Chi-Lin Yu
output: pdf_document
---
Do you want to allow people to explore your dataset ? Do you want to share a model you built ? Are you interested in making an interactive application ? By using a `R` package `Shiny`, you will be able to make interactive data visualizations and applications using the `R` language. In this presentation, I will talk about *what* is `Shiny`, *why* and *when* to use Shiny, and *where* to learn Shiny. Also, will give you an intuition of *how* to build a Shiny app.

To run `Shiny` on your R, the [`Shiny`](https://cran.r-project.org/web/packages/shiny/shiny.pdf) package is required. 

```r
install.packages("shiny")
```

You can also run some quick examples and play with them beforehand.
```r
library(shiny)
runExample("01_hello")
#runExample("02_text")
```

See you 5/14 ! Hope you can get some feelings about `Shiny` package then !