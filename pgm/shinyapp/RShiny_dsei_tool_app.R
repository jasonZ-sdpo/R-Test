####################################################################################  
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
# http://shiny.rstudio.com/
# Objective: an R-shiny application ORR Bayesian
# Author:  Zhonggai Li, Boxuan Li
# Date:    2021 Mar 4, V4 
#  version history:
#   v2: 20180802 added the input for baseline ORR and target ORR, and calculate the probability of posterior ORR>=target ORR;
#   v3: 20201125 added the beta-binomial posterior density plot and updated the AE table with multiple response rates and number of patients;
#   v4: 20210223 added the phase 2 interim analysis through Bayesian predictive probability with Beta-Binomial posterior.
########################################################################

rm(list=ls())

source("RShiny_dsei_tool_global.R")
source("RShiny_dsei_tool_helper.R")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("About the app", tabName = "about", icon = icon("dashboard")),
    menuItem("Posterior Mean and CI", icon = icon("th"), tabName = "posteriormean"),
    menuItem("Beta-Binomial Analysis", icon = icon("th"), tabName = "betabinom"),
    menuItem("Event Incidence", tabName = "eincidence", icon = icon("th")),
             #badgeLabel = "new", badgeColor = "green"),
    menuItem("Interim Analysis", tabName = "interimanalysis", icon = icon("th"),
             menuSubItem('Frequentist Method', tabName = 'fm_interim'))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "about",
            h2("About"),
            p("This application, written in R Shiny, helps to justify the sample size used in 
              early oncology studies (Phase I/Phase II)."),

            p("The first tab ('Posterior Mean and CI') calculates the posterior mean and credible intervals (90% or 95% ) 
              for a specified number of observed responses. Based on the posterior distribution, 
              the probability of the true response rate falling in one of several predefined efficacy 
              intervals,as well as above target_ORR is also calculated. Two figures are created, one showing the 
              posterior mean with the credible intervals and the other showing a bar graph 
              for the probabilities in each efficacy interval for the number of observed responses. 
              A result table and the figures can be downloaded."),
            
            p("The second tab ('Beta-Binomial Analysis') incoporates multiple functions related to the application of Bayesian inference using
              Beta-Binomial conjugate pair in early phases of clinical trial. By specifying the numebr of patients, 
              responses, priors, and other relevant parameters, a tabset panal can be produced, including the density 
              plot, and the predictive probability-based interim analysis. The former shows the posterior density plot with the probability of the  
              response rate falling within the target interval. The latter presents a table for the interim monitoring
              of early stopping criteria during the phase II trial. At each interim stage, the range of reponses required
              to declare futility or efficacy is calculated and the type I error and power of the design are also obtained
              through simulation."),
            
            p("The third tab ('Event Incidence') calculates the probability of observing pre-specified number of events in a 
              Phase I or dose escalation study given a particular sample size and incidence of the event."),
              
            p("The fourth tab ('Interim Analysis') calculates the probability of stopping at interim analysis and the probability of 
              success at final analysis, provided the sample size at final analysis, sample size at interim,
              maximum number of responders required to stop at interim, minimum number of responders for the 
              trial to be successful and true response rate (ORR or CR).")
    ),
    tabItem(tabName = "posteriormean",
            h2("Posterior Mean and Credible intervals"),
            box(width = 12, title = "Inputs", status = "warning", solidHeader = T, 
            #fluidRow(
              # box(
              #   "Box content here", br(), "More box content",
              #   sliderInput("slider", "Slider input:", 1, 100, 50),
              #   textInput("text", "Text input:")
              # ),
            #  box(width = 4, "First Shape parameter of Beta distribution (a) ", numericInput("a", "a :", value = 0.25)),
            #  box(width = 4, "Second Shape parameter of Beta distribution (b)", numericInput("b", "b :", value = 1)),
            #  box(width = 4, textInput("prob","Efficacy Intervals", value = "0.15, 0.3"))
            #),
            fluidRow(
              box(width = 4, "Baseline ORR/Event Rate (b_orr) ", numericInput("b_orr", "Baseline ORR/Event rate:", value = 0.25)),
              box(width = 4, "Target ORR/Event Rate (t_orr)", numericInput("t_orr", "Target ORR/Event rate:", value = 0.45)),
              box(width = 4, textInput("prob","Efficacy Intervals", value = "0.15, 0.3"))
            ),
            fluidRow(
              box(width = 4, selectInput("ci", label = "Credible Interval", choices = list("90 %" = 1, "95 %" = 2),
                                         selected = 1)),
              box(width = 4, textInput("text", "No. of responders", value = "0, 5, 10, 15, 20")),
              box(width = 4, sliderInput("n", "Sample Size :", 1, 500, 20))
            )),
            fluidRow(
              box(width = 10, title = "Table showing the posterior mean and CI", status = "primary", solidHeader = T,  tableOutput("table1"))
            ),
            fluidRow(
              box(width = 6, title = "Forest Plot", status = "primary", solidHeader = T, plotOutput("plot1")),
              box(width = 6, title = "Bar Plot", status = "primary", solidHeader = T, plotOutput("plot2"))
            ),
            fluidRow(
              box(width = 6, title = "Forest Plot", status = "primary", solidHeader = T, downloadLink("downloadReport","Download")))
    ),
    tabItem(tabName = "betabinom",
            h2("Beta-Binomial Posterior Analysis"),
            box(title = "Inputs", width = 12, status = "warning", solidHeader = T, 
                fluidRow(
                  box(width = 4, numericInput("a", "Alpha", value=0.5, min=0, max=50, step=1)),
                  box(width = 4, numericInput("b", "Beta", value=0.5, min=0, max=50, step=1))
                  #box(width = 6, sliderInput("range", "Target Interval",
                  #                           min = 0, max = 1,
                  #                           value = c(0, 0.1)))
                ),
                h3("Parameters for the density plot"),
                fluidRow(
                  box(width = 4, numericInput("n_resp", "Number of responders", value=1, min=0, max=100, step=10)),
                  box(width = 4, numericInput("n_trial", "Number of trials", value=10, min=0, max=200, step=10))
                ),
                fluidRow(
                  box(width = 4, numericInput("ci_lb","Lower bound of target interval",value=0, min=0, max=1, step=0.1)),
                  box(width = 4, numericInput("ci_ub","Upper bound of target interval",value=0.1, min=0, max=1, step=0.1))
                ),
                h3("Parameters for the interim analysis"),
                fluidRow(
                  box(width = 4, numericInput("nMAX", "Total number of patients", 
                                              value=30, min=0, max=300, step=10)),
                  box(width = 5, textInput("nInt", "Number of patients at interim points", 
                                           value = "5, 10, 15"))
                ),
                fluidRow(
                  box(width = 3, numericInput("p0", "Reference response rate", 0.5,
                                              min=0, max=1, step=0.1)),
                  box(width = 3, numericInput("pa", "Response rate for alternative hypothesis", 0.75,
                                              min=0, max=1, step=0.1)),
                  box(width = 3, textInput("pfe", "Early stopping threshold for futility and efficacy", 
                                           value = "0.25, 0.95")),
                  box(width = 3, numericInput("pt", "Threshold for delaring efficacy at the end of the trial",
                                              0.8, min=0, max=1, step=0.1))
                )),
            fluidRow(
              box(width=12,
                  tabsetPanel(type = "tabs",
                              tabPanel("Density Plot",
                                       h3("Posterior Density Plot"),
                                       plotOutput("plot3")),
                              tabPanel("Phase II Interim Analysis", 
                                       h3("Probability to Stop at the Interim Stages Based on Predictive Probability"),
                                       tableOutput("table4"))))
            )),
    tabItem(tabName = "eincidence",
            h2("Probability of observing different number of events"),
            box(title = "Inputs", width = 10, status = "warning", solidHeader = T, 
                fluidRow(
                  box(width = 6, textInput("patients", "Number of patients", value = "6, 10")),
                  box(width = 6, textInput("aeinc", "Event incidence rate", value = "0.025, 0.05")),
                  box(width = 4, textInput("noae", "Number of events", value = "1, 2"))
                )),
            fluidRow(
              box(width = 10,  title = "Table showing the probability of observing events", status = "primary", solidHeader = T,
                  div(style = 'overflow-x: scroll', tableOutput("table2")))
            )
    ),
    tabItem(tabName = "interimanalysis",
            h2("Calculation of probability to stop at interim and success at final analysis"),
            box(title = "Inputs", width = 12, status = "warning", solidHeader = T, 
            fluidRow(
            box(width = 5, sliderInput("N", "Number of patients at final analysis",
                        min = 1, max = 100, value = 40)),
            box(width = 5, sliderInput("n.interim", "Number of patients at interim",
                        min = 1, max = 50, value = 20))
            ),
            fluidRow(
            box(width = 4, textInput("true.p", "True response rate", 
                                       value = "0.15, 0.20")),
            box(width = 4, numericInput("r.stop", "Max no. of responses to stop at interim", 3,
                         min = 1, max = 15, step = 1)),
            box(width = 4, numericInput("r.success", "Min no. of responses to be successful at final analysis", 18,
                         min = 1, max = 15, step = 1))
            )),
            fluidRow(
             box(width = 12, title = "Table showing the probability to stop at interim and of success at final analysis", status = "primary", solidHeader = T, 
                 tableOutput("table3"))
            )
    )
  )
)

# Put them together into a dashboardPage
ui <- 
dashboardPage(
  dashboardHeader(title = "Sample Size Calculation",
                  titleWidth = 400),
  sidebar,
  body
)


server <- shinyServer(function(input, output, session) {
  dataInput1 <- reactive({
    #posterior_dat(no.res = input$text, a = input$a, b = input$b, ci = as.numeric(input$ci), prob = input$prob, 
    #             n = input$n)
    posterior_dat(no.res = input$text, b_orr = input$b_orr, t_orr = input$t_orr, ci = as.numeric(input$ci), prob = input$prob, 
                  n = input$n)
  })
  
  dataInput2 <- reactive({
    ae_dat(patients = input$patients, aeinc = input$aeinc, noae = input$noae)
  })
  
  dataInput3 <- reactive({
    dat_interim_final(N = input$N, n = input$n.interim, r.stop = input$r.stop, r.success = input$r.success, True.p = input$true.p)
  })
  
  dataInput4 <- reactive({
    dat_interim_bayes(Nmax=input$nMAX,Nint=input$nInt,a=input$a,b=input$b,
                      p0=input$p0,pt=input$pt,pa=input$pa,pfe=input$pfe)
  })
  
  output$table1 <- renderTable({
    
    dat1 <- dataInput1()
  }, digits = 3)
  
  output$table2 <- renderText({
    
    dat2 <- dataInput2()
  })
  
  output$table3 <- renderTable({
    
    dat3 <- dataInput3()
  }, digits = 3)
  
  output$table4 <- renderText({
    
    dat4 <- dataInput4()
  })
  
  plotInput1 <- reactive({
    df <- dataInput1()
    p <- plot_errorbar(df)
  })
  
  output$plot1 <- renderPlot({
    print(plotInput1())
  })
  
  plotInput2 <- reactive({
    df <- dataInput1()
    p <- plot_probbar(df)
  })
  
  output$plot2 <- renderPlot({
    print(plotInput2())
  })
  
  plotInput3 <- reactive({
    p <- plot_bb_density(a=input$a,b=input$b,prior=F,n=input$n_trial,
                         y=input$n_resp,target.ci=c(input$ci_lb,input$ci_ub))
  })
  
  output$plot3 <- renderPlot({
    print(plotInput3())
  })
  
  # output$downloadData <- downloadHandler(
  #   filename = function() {
  #     paste("output-", Sys.Date(), ".csv", sep="")
  #   },
  #   content = function(file) {
  #     write.csv(dataInput(), file, row.names = FALSE)
  #   }
  # )
  # 
  # output$downloadPlot1 <- downloadHandler(
  #   filename = function() {
  #     paste("plot1-", Sys.Date(), ".png", sep="")
  #   },
  #   content = function(file) {
  #     device <- function(...,width, height){
  #       grDevices::png(...,width = width, height = height, res = 300, units = "in")
  #     }
  #     ggsave(file, plot = plotInput1(), device = device)
  #   }
  # )
  # 
  # output$downloadPlot2 <- downloadHandler(
  #   filename = function() {
  #     paste("plot2-", Sys.Date(), ".png", sep="")
  #   },
  #   content = function(file) {
  #     device <- function(...,width, height){
  #       grDevices::png(...,width = width, height = height, res = 300, units = "in")
  #     }
  #     ggsave(file, plot = plotInput2(), device = device)
  #   }
  # )
  
  output$downloadReport <- downloadHandler(
    filename = function() {
      paste('my-report', ".docx", sep = "")
    },
    
    content = function(file) {
      src <- normalizePath('report.Rmd')
      
      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      owd <- setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'report.Rmd', overwrite = TRUE)
      
      library(rmarkdown)
      out <- render('report.Rmd', word_document())
      file.rename(out, file)
    }
  )
  
})
 
shinyApp(ui = ui, server = server)
