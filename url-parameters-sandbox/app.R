library(shiny)

ui <- fluidPage(
    
    titlePanel("Old Faithful Geyser Data"),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            actionButton(inputId='generate_link',
                         label="Generate Link")
        ),
        
        mainPanel(
            plotOutput("distPlot"),
            textOutput('url')
        )
    )
)
# e.g. http://127.0.0.1:5043/?bins=40
server <- function(input, output, session) {
    # Here you read the URL parameter from session$clientData$url_search
    observe({
        query <- parseQueryString(session$clientData$url_search)
        if (!is.null(query[['bins']])) {
            updateSliderInput(session, "bins", value = query[['bins']])
        }
    })
    
    get_base_url <- function(session) {
        
        # url_elements <- list(protocol=session$clientData$url_protocol,
        #                      hostname=session$clientData$url_hostname,
        #                      #pathname=session$clientData$url_pathname,
        #                      port=session$clientData$url_port)
        # #search=session$clientData$url_search)
        # attr(url_elements, 'class') <- 'url'
        # 
        # return (httr::build_url(url_elements))
        
        
        url_string <- paste0(session$clientData$url_protocol,
                             "//",
                             session$clientData$url_hostname,
                             ":",
                             session$clientData$url_port)
        print(url_string)
        url <- httr::parse_url(url_string)
        return (httr::build_url(url))
    }

    build_custom_url <- function(session, input){ #, base_url="http://127.0.0.1:5043") {
        #base_url="http://127.0.0.1:5043"
        base_url <- get_base_url(session)
        url <- httr::parse_url(base_url)
        url$query <- list("bins"=input$bins,
                          "other_setting"="This is another seetting??",
                          "filter___Filter variable (asdf)"=1)
        custom_url <- httr::build_url(url)
        
        print(paste("Num chars in URL:", nchar(custom_url)))
        print(paste("URL:", custom_url))
        return (custom_url)
    }

    observeEvent(input$generate_link, {
        showModal(urlModal(build_custom_url(session, input), title = "Bookmarked application link", subtitle = NULL))
        #showModal(modalDialog(httr::build_url(url), easyClose = TRUE))
    })
    
    output$distPlot <- renderPlot({
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
        shiny::updateQueryString(build_custom_url(session, input), mode = "replace")
    })
    
    output$url <- renderText({
        get_base_url(session)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
