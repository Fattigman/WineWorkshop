library(ggplot2)

# Define server logic
server <- function(input, output) {
  # Perform statistics here
  model <- reactive({
    # Put model here
  })
  
  # Create regression plot
  output$reg_plot <- renderPlot({
    # Create plot here
  })
}