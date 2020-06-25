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
                        "Length of race",
                        value = 10),
            textInput("training",
                      "Distance run in previous 12 weeks",
                      value = 100),
            radioButtons("units",
                         "Units", 
                         c("Kilometers" = "kms",
                         "Miles" = "miles"))
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
        
        if(input$units == "kms"){
            
            # generate pace based on input$distance and input$training from ui.R
            race_pace <- 342.06054 + (2.808069 * as.numeric(input$distance)) - 
                (0.17157 * as.numeric(input$training))
        
            race_pace <- round(race_pace, 0)
        
            paste("Predicted race pace: ", seconds_to_period(race_pace), 
              " / km", sep = "")
        }
        else{
            
            #convert miles to kilometers
            
            km_distance <- as.numeric(input$distance) * 1.609344
            km_training <- as.numeric(input$training) * 1.609344
            
            # generate pace based on input$distance and input$training from ui.R
            race_pace <- 342.06054 + (2.808069 * km_distance) - 
                (0.17157 * km_training)
            
            #convert kilometers back to miles and display results
            
            race_pace <- race_pace * (1 / 0.6213712)
            
            race_pace <- round(race_pace, 0)
            
            paste("Predicted race pace: ", seconds_to_period(race_pace), 
                  " / mile", sep = "")
            
        }
        
    })
    
    output$finish <- renderText({
        
        if(input$units == "kms"){
        
        # generate pace based on input$distance and input$training from ui.R
        race_pace <- 342.06054 + (2.808069 * as.numeric(input$distance)) - 
            (0.17157 * as.numeric(input$training))
        race_pace <- round(race_pace, 0)
        
        #generate finish time based on pace and distance
        finish_time <- round(race_pace * as.numeric(input$distance), 0)

        paste("Predicted finish time: ", seconds_to_period(finish_time), 
              sep = "")
        
        }else{
            
            #convert miles to kilometers
            
            km_distance <- as.numeric(input$distance) * 1.609344
            km_training <- as.numeric(input$training) * 1.609344
            
            # generate pace based on input$distance and input$training from ui.R
            race_pace <- 342.06054 + (2.808069 * km_distance) - 
                (0.17157 * km_training)
            
            #convert kilometers back to miles
            
            race_pace <- race_pace * (1 / 0.6213712)
            
            # generate finish time based on pace and distance
            
            finish_time <- round(race_pace * as.numeric(input$distance), 0)
            
            paste("Predicted finish time: ", seconds_to_period(finish_time), 
                  sep = "")
            
        }
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
