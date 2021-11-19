library(shiny)
library(ggpubr)

ui <- fluidPage(
    titlePanel("ggboxplot random number demo"),
    sidebarLayout(
        sidebarPanel(
            p("See the Readme below for a description of this app."),
            radioButtons("setseed", "Set seed before getting samples?",
                         c("No"=FALSE, "Yes"=TRUE)),
            radioButtons("dist", "Distribution:",
                         c("Normal"="norm", "Log-normal"="lnorm")),
            sliderInput("n", "Number of observations:", value=6, min=1, max=15),
            sliderInput("mean", "Mean:", value=0, min=-10, max=10),
            sliderInput("sd", "Standard deviation:", value=1, min=0, max=10),
            width=6),

        mainPanel(
            plotOutput("plot"),
            tableOutput("table"),
            width=6
        )
    )
)

server <- function(input, output){
    d <- reactive({
        dist <- switch(input$dist, norm=rnorm, lnorm=rlnorm)
        if (input$setseed){
            set.seed(Sys.time())
        }
        dist(input$n, input$mean, input$sd)})

    output$plot <- renderPlot({
        ggboxplot(data.frame(x=1, y=d()), x="x", y="y")})

    output$table <- renderTable({
        d()})
}

shinyApp(ui, server)
