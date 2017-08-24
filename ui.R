# install.packages("shiny")
# install.packages("shinydashboard")
# install.packages("ggplot2")
# install.packages("plyr")
# install.packages("plotly")
# install.packages("DT")
# install.packages("ggthemes")
library(shiny)
library(shinydashboard)
library(ggplot2)
library(plyr)
library(plotly)
library(DT)
library(ggthemes)

# my data
library(readxl)
Imdb <- read_excel("~/Desktop/Programming/DataScience/Projects/IMDB_WebScraping_Project/Imdb.xlsx")

my_data=Imdb
# changing date to categorical data 
#my_data$Year=factor(my_data$Year)

## Preparing sidebar items
sidebar <- dashboardSidebar(
  width = 310,
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Data", tabName = "datafile", icon = icon("th")),
    menuItem("Visualization", icon = icon("navicon"), tabName = "graphs", 
             menuSubItem("Top Shows Viewed", tabName = "topShows", icon = icon("pie-chart")), 
             menuSubItem("Top Shows Viewed by Population under 18", tabName = "under18", icon = icon("pie-chart")),
             menuSubItem("Top Shows Viewed by Population from 18-29", tabName = "aged18_29", icon = icon("pie-chart")),
             menuSubItem("Top Shows Viewed by Population from 30-44", tabName = "aged30_44", icon = icon("pie-chart")),
             menuSubItem("Top Shows Viewed by Population from 44+", tabName = "aged44+", icon = icon("pie-chart"))
    )
  )
)
## Preparing body items
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Introduction",  align = "center", style = "font-family: 'times'; color:red"),
            p("type the introduction to the project", 
              a("imdb", href = "link to imdb")," and",
              a("ratings", href="link of ratings"),
              style = "font-family: 'times'"),
              fluidRow(
                column(
                  h2("About this app ...", align = "center", style = "font-family: 'times'; color:red"),
                  p("This app helps you to explore and visualize ,I have used the database available by web scraping",
                    a("here.", href="github link to pythin code"), 
                    style = "font-family: 'times'"),
                  width = 4,
                  align = "left"
                  
                ),
                column(
                  h2("How to use!", style = "font-family: 'times'; color:red"),
                  p("This app contains two major sections; database and graphs.add more info", 
                    style = "font-family: 'times'"), 
                  p("type description", 
                    style = "font-family: 'times'"),
                  width = 8,
                  align = "left"
                ),
                br(),
                br()
                ),
            br(),
            br()
      ),
            tabItem(tabName = "datafile",
                    box(title = "Top 100 Shows IMDB",
                        width = 12, 
                        DT::dataTableOutput('da.tab'))  
            ),
            # for top shows 
            tabItem(tabName = "topShows",
                    fluidRow(
                      column(
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Top 20 Shows",
                                 plotlyOutput("topShows"), width = "100%",height='100%'),
                          tabPanel("Male",
                                 plotlyOutput("topShowsMale"), width = "100%"),
                          tabPanel("Female", 
                                 plotlyOutput("topShowsFemale"), width = "100%")
                        ),width = 12, height=100),
                      height='100%',width = 12),
                    height='80%')
                    ),
            #for top shows seen by age group under 18
            tabItem(tabName = "under18",
                    fluidRow(
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Top 10 Shows under 18",
                                   plotlyOutput("Top_10_Shows_under_18"), width = "100%"),
                          tabPanel("Male",
                                   plotlyOutput("Top_10_Shows_under_18_male"), width = "100%"),
                          tabPanel("Female", 
                                   plotlyOutput("Top_10_Shows_under_18_female"), width = "100%")
                        ),width = 12, height=100),
                      height='100%',width = 12),
                    height='80%'),
            tabItem(tabName = "aged18_29",
                    fluidRow(
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Top 10 Shows Aged 19-29",
                                   plotlyOutput("Top_10_Shows_aged18_29"), width = "100%"),
                          tabPanel("Male",
                                   plotlyOutput("Top_10_Shows_aged18_29_male"), width = "100%"),
                          tabPanel("Female", 
                                   plotlyOutput("Top_10_Shows_aged18_29_female"), width = "100%")
                        ),width = 12, height=100),
                      height='100%',width = 12),
                    height='80%'),
            tabItem(tabName = "aged30_44",
                    fluidRow(
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Top 10 Shows Aged 30-44",
                                   plotlyOutput("Top_10_Shows_aged30_44"), width = "100%"),
                          tabPanel("Male",
                                   plotlyOutput("Top_10_Shows_aged30_44_male"), width = "100%"),
                          tabPanel("Female", 
                                   plotlyOutput("Top_10_Shows_aged30_44_female"), width = "100%")
                        ),width = 12, height=100),
                      height='100%',width = 12),
                    height='80%'),
            tabItem(tabName = "aged44+",
                    fluidRow(
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Top 10 Shows Aged 44+",
                                   plotlyOutput("Top_10_Shows_aged44"), width = "100%"),
                          tabPanel("Male",
                                   plotlyOutput("Top_10_Shows_aged44_male"), width = "100%"),
                          tabPanel("Female", 
                                   plotlyOutput("Top_10_Shows_aged44_female"), width = "100%")
                        ),width = 12, height=100),
                      height='100%',width = 12),
                    height='80%')))
            
            
            
## Putting them together into a dashboardPage

ui <- dashboardPage( 
  skin="yellow",
  # add this -> navbarMenu()
  dashboardHeader(
    title="IMDB Top Shows To Advertise On",
    titleWidth = 250
  ),
  sidebar,
  body
)
