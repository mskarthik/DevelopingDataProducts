library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Mortgage Calculator"),
  sidebarPanel(
    numericInput("LoanAmount", label = h3("Loan Amount"),value = 250000),
    numericInput("Rate", label = h3("Interest Rate"), value = 4),
    numericInput("LoanTerm", label = h3("Loan Term"), value = 30)
  ),
  
  mainPanel(
    h3('Monthly Installment'),
    verbatimTextOutput("A"),
    h4('Amortization Schedule'),
    tableOutput("AmortTable")
    
  )
  
))