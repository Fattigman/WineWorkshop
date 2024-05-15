library(ggplot2)
library(tidyverse)

# Define server logic
server <- function(input, output) {
  # Perform statistics here
  model <- reactive({
    # select and filter parameter
    
    dat <- input$dataset %>%
      select(any_of(input$param))
    
    # Put model here
    model <- lm(quality ~ .,
                data = dat)
    
    var <- anova(model) %>% 
      as.data.frame() %>%
      select(`Sum Sq`) %>%
      rownames_to_column('Parameter') %>%
      filter(Parameter != 'Residuals') %>%
      mutate(tot = sum(`Sum Sq`),
             var = `Sum Sq` / tot) %>%
      mutate(Parameter = str_replace_all(Parameter, '\\.', ' '),
             Parameter = str_to_sentence(Parameter))
  })
  
  # Create regression plot
  output$reg_plot <- renderPlot({
    # Create plot here
    
    ggplot(var, aes(x = '', y = var, fill = Parameter)) +
      geom_bar(stat = 'identity', width = 1) +
      coord_polar('y', start = 0) +
      scale_fill_brewer(palette = 'Set3') +
      theme(axis.title = element_blank(), axis.ticks = element_blank(),
            axis.text = element_blank(), rect = element_blank())
    
  })
}