library(shiny)

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
            (textOutput("pace"))
    )
)
)

# Define server logic required calculate race pace
server <- function(input, output) {
    
    output$pace <- renderText({
    
        # generate pace based on input$distance and input$training from ui.R
        race_pace <- 342.06054 + (2.808069 * as.numeric(input$distance)) - 
            (0.17157 * as.numeric(input$training))
        
        paste("Predicted race pace:", round(race_pace, 1), "secs/km")
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
