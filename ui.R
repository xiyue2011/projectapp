
shinyUI(fluidPage(
  titlePanel("Basis Analysis of Time Series Data Sets"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("var", 
        label = "Choose a variable to display",
        choices = c("nhtemp", "sunspot.year", "WWWusage"),
        selected = "airmiles"),

      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30) 
      
     #numericInput("obs", "Number of observations to view:", 10)
 
   ),
  
    #mainPanel(plotOutput("tsplot"))
    mainPanel(

p("In this shiny application, we employ three time series data sets in the", a("Datasets package", href = "http://stat.ethz.ch/R-manual/R-patched/library/datasets/html/00Index.html"), "on CRAN."),
      br(),
      strong("The three data sets are:"),
      p("* nhtemp: The mean annual temperature in degrees Fahrenheit in New Haven, Connecticut, from 1912 to 1971."),
      p("* sunspot.year: Yearly numbers of sunspots from 1700 to 1988."),
      p("* WWWusage: A vector of 100 observations showing the numbers of users connected to the Internet through a server every minute."), 
      br(),
      p("In this application, a user can get the basic summary of a variable, which is a table produced by the R function", code("summary()"), "."),
      verbatimTextOutput("summary"),
   
      p("A user can get the histogram of a variable produced  by the R function", code("hist"), ".", "By choosing the number of bins, a user can decide how fine the histogram is.")  ,      
      plotOutput("hist"),

      p("A user can also get the plot of a variable againt time  by the R function", code("plot"), 
",", "which shows a trend of the variable against time."),
      plotOutput("plot")
    )

  )
))
