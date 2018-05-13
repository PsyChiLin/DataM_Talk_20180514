####################  Distribution App ######################
library(shiny)
library(ggplot2)
library(MASS)
server <- function(input, output) {
  # define the function for generating random numbers
  d <- reactive({
    dist <- switch(input$dist,
                   norm = rnorm,
                   t = rt,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   mvn = mvrnorm,
                   rnorm)
    if (input$dist == "t"){
      dist(input$n,df = input$df)
    } else if (input$dist == "mvn") {
      mvrnorm(input$n, mu = c(0, 0), 
              Sigma = matrix(c(1, 0.5, 0.5, 1),2))
    } else {
      dist(input$n)
    }
  })
  # for plots
  output$plot <- renderPlot({
    dist <- input$dist
    n <- input$n
    if (input$dist == "mvn") {
      par(mar = rep(0, 4))
      p <- persp(kde2d(d()[,1], d()[,2],n = input$n),xlab = "X",
                 phi = 45, theta = 30,shade = .5, border = NA)
    } else {
      hist(d(),main = paste("r", dist, "(", n, ")", sep = ""),
           col = "grey", border = "white", xlab = "Values")
    }
  })
  # for summary table
  output$summary <- renderPrint({
    summary(d())
  })
  # for showing data
  output$table <- renderTable({
    d()
  })
}