library(datasets)
data(nhtemp)
data(sunspot.year)
data(WWWusage)

shinyServer(function(input, output) {

  dataInput <- reactive({
    switch(input$var, 
	"nhtemp" = nhtemp,
	"sunspot.year" = sunspot.year,	
	"WWWusage" = WWWusage
	)  
  })

  output$summary <- renderPrint({
    data <- dataInput()
    summary(data)
  })

  output$hist <- renderPlot({
      data <- dataInput()  
      bins <- seq(min(data), max(data), length.out = input$bins + 1)
      hist(data, breaks = bins, col = 'peachpuff', freq = NULL, xlab = input$var, main = paste('Histogram of', input$var))
  })

  output$plot <- renderPlot({
      data <- dataInput()
      plot(data, type='l', ylab = input$var)
  })

})


