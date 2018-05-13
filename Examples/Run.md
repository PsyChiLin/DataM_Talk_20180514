---
title: 'Run example'
author: Chi-Lin Yu
output: pdf_document
---
```r
shinyApp(ui, server) 
# runApp("your_dir_of_shinyapp")
```

```r
# run shiny app on github
runGitHub()
```
Run the app from Githib with code !
```r
library(shiny)
# runGitHub("PsyChiLin/DataM_Talk_20180514")
runGitHub("PsyChiLin/DataM_Talk_20180514",display.mode = "showcase")
```