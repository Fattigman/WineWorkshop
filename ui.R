library(shiny)

mP <- mainPanel(
  plotOutput("reg_plot")
)

sP <- sidebarPanel(
  # Create an input for predictor variables
  parameter <- c("red_wine", "white_wine")
)

# Define UI
ui <- fluidPage(
  titlePanel("Wine Quality Regression Analysis"),
  sidebar = sidebar("Quality parameters"),
  card(),
  selectInput(
    "parameter",
    "Select option",
    choices = list("Red wine" = 1, "White wine" = 2),
    selected = 1), 
  sidebarLayout(
    sP,
    mP
  )
)