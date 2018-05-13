####################  Distribution App ######################
library(shiny)
library(ggplot2)
library(MASS)
# Define UI for random distribution app ----
ui <- fluidPage(
  titlePanel("Distribution Demo"),
  # Sidebar layout with input and output definitions
  sidebarLayout(
    # Sidebar panel for inputs
    sidebarPanel(
      # Input: Select the random distribution type
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "t Dist" = "t",
                     "Uniform" = "unif",
                     "Log-normal" = "lnorm",
                     "Exponential" = "exp",
                     "Bivariate-Normal" = "mvn"
      )),
      # Spacing
      br(),
      conditionalPanel(
        condition = "input.dist == 't'",
        sliderInput('df',"degree of freedom",
                    value = 1,
                    min = 1,
                    max = 30
      )),
      # Input: Slider for the number of observations
      sliderInput("n",
                  "Number of observations:",
                  value = 500,
                  min = 1,
                  max = 1000)
      
    ),
    # Main panel for displaying outputs
    mainPanel(
      # Output: plot, summary, and table
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("plot")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("table"))
      )
    )
  )
)
