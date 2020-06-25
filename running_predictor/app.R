library(shiny)
library(lubridate)

# Define UI for application 
ui <- fluidPage(

    # Application title
    titlePanel("Race Pace Predictor"),

    # Sidebar 
    sidebarLayout(
        sidebarPanel(
            textInput("distance",
                        "Length of race in kilometers",
                        value = 10),
            textInput("training",
                      "Kilometers run in previous 12 weeks",
                      value = 100)
        ),

        # Show the predicted race pace
        mainPanel(
            textOutput("pace"),
            textOutput("finish")
    )
)
)

# Define server logic required calculate race pace
server <- function(input, output) {
    
    output$pace <- renderText({
        
        # generate pace based on input$distance and input$training from ui.R
        race_pace <- 342.06054 + (2.808069 * as.numeric(input$distance)) - 
            (0.17157 * as.numeric(input$training))
        race_pace <- round(race_pace, 0)
        
        paste("Predicted race pace: ", seconds_to_period(race_pace), 
              " / km", sep = "")
        
    })
    
    output$finish <- renderText({
        
        # generate pace based on input$distance and input$training from ui.R
        race_pace <- 342.06054 + (2.808069 * as.numeric(input$distance)) - 
            (0.17157 * as.numeric(input$training))
        race_pace <- round(race_pace, 0)
        
        #generate finish time based on pace and distance
        finish_time <- round(race_pace * as.numeric(input$distance), 0)

        paste("Predicted finish time: ", seconds_to_period(finish_time), 
              sep = "")
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
