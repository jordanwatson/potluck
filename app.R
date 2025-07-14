library(shiny)

data <- read.csv("https://raw.githubusercontent.com/jordanwatson/potluck/master/data.csv")

country <- as.character(data$Name)

ui <- fluidPage(
  titlePanel("Welcome to the International Pot Luck random country generator"),
  p("The rules (which are meant to enhance the fun):"),
  br(),
  p("(1) Click the button ONLY ONCE to get your country (it's less fun if you cheat and click multiple times, though significant others often get upset if you clicked without them, so they may want their own country)."),
  br(),
  p("(2) Prepare a dish from your country."),
  br(),
  p("(3) Bring said dish to 324C Olomana St after 5 pm."),
  br(),
  p("(4) If you adorn your dish with flags, interpretive dance, or other nationalistic sentiment, people will like you more."),
  sidebarLayout(
    sidebarPanel( 
      actionButton("generateBt", "Click here")
    ),
    mainPanel( 
      verbatimTextOutput("result")
    ) 
  )
)

server <- function(input, output) {
  output$result <- renderPrint({ 
    if (input$generateBt > 0 ) 
      isolate(
        country[round(runif(1, min = 0, max = nrow(data)))]
      )
  })
}

shinyApp(ui = ui, server = server)
