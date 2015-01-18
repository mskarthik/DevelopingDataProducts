library(shiny)

GetA <- function(LoanAmount,Rate,LoanTerm) {
  n <- LoanTerm*12
  R <- Rate/(12*100)
  A <- LoanAmount*(R*(1+R)^n)/((1+R)^n-1)
  A
}

GetTable <- function(LoanAmount,Rate,LoanTerm) {
  n <- LoanTerm*12
  R <- Rate/(12*100)
  A <- LoanAmount*(R*(1+R)^n)/((1+R)^n-1)
  Month <- 1:12
  Loan <-1:12
  Interest <- 1:12
  Loan[1] <- LoanAmount
  
  for(i in 2:12){
    Month[i] <- i
    Loan[i] <- (Loan[i-1] - (A-Loan[i-1]*R))
    Interest[i] <- Loan[i-1]*R
  }
  
  data.frame(Month,Loan,Interest)
  
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
      output$A <- renderPrint(GetA(input$LoanAmount,input$Rate,input$LoanTerm))
      output$AmortTable <- renderTable(GetTable(input$LoanAmount,input$Rate,input$LoanTerm))
})