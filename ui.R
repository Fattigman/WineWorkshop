library(shiny)

mP <- mainPanel(
  plotOutput("reg_plot")
)

sP <- sidebarPanel(
  # Create an input for predictor variables
  ,
  # Create an input for response variable
  
)

# Define UI
ui <- fluidPage(
  titlePanel("Wine Quality Regression Analysis"),
  sidebarLayout(
    sP,
    mP
  )
)