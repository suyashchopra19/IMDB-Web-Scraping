# install.packages("readxl")
# Reading data set
library(readxl)
Imdb <- read_excel("./Imdb.xlsx")

my_data=Imdb

server <- function(input, output) {
  ## stuffs for data tab
  # data table output
  output$da.tab <- DT::renderDataTable(datatable(my_data,
                                                 style = "bootstrap",
                                                 filter = list(position = 'top', clear = T, plain = F),
                                                 options = list(pageLength = 1500, dom = 'Bfrtip', 
                                                                buttons = 
                                                                  list('copy', 'print', list(
                                                                    extend = 'collection',
                                                                    buttons = c('csv', 'excel', 'pdf'), 
                                                                    text = 'Download')
                                                                  )
                                                 )
  )
  )
  ## stuffs for data explorer
  output$topShows <- renderPlotly({
    # build graph with ggplot syntax
    top=head(Imdb[order(Imdb$Rating, decreasing= T),], n = 20)
    p1 <- ggplot() + geom_jitter(aes(y = Title, x = Rating, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p1)
  })
  output$topShowsMale <- renderPlotly({
    top=head(Imdb[order(Imdb$Average_Males, decreasing= T),], n = 20)
    p2 <- ggplot() + geom_jitter(aes(y = Title, x = Average_Males, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p2)
  })
  output$topShowsFemale <- renderPlotly({
    top=head(Imdb[order(Imdb$Average_Female, decreasing= T),], n = 20)
    p3 <- ggplot() + geom_jitter(aes(y = Title, x = Average_Female, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p3)
  })
  output$Top_10_Shows_under_18 <- renderPlotly({
    top=head(Imdb[order(Imdb$Average_Aged_Under_18, decreasing= T),], n = 20)
    p4 <- ggplot() + geom_jitter(aes(y = Title, x = Average_Aged_Under_18, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p4)
  })
  output$Top_10_Shows_under_18_male <- renderPlotly({
    top=head(Imdb[order(Imdb$Average_Males_Under_18, decreasing= T),], n = 20)
    p5 <- ggplot() + geom_jitter(aes(y = Title, x =Average_Males_Under_18 , color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p5)
  })
  output$Top_10_Shows_under_18_female <- renderPlotly({
    top=head(Imdb[order(Imdb$Average_Female_Under_18, decreasing= T),], n = 20)
    p6 <- ggplot() + geom_jitter(aes(y = Title, x = Average_Female_Under_18, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p6)
  })
  output$Top_10_Shows_aged18_29 <- renderPlotly({
    top=head(Imdb[order(Imdb$`Average_Aged_18-29`, decreasing= T),], n = 20)
    p7 <- ggplot() + geom_jitter(aes(y = Title, x = `Average_Aged_18-29`, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p7)
  })
  output$Top_10_Shows_aged18_29_male <- renderPlotly({
    top=head(Imdb[order(Imdb$`Average_Male_Aged_18-29`, decreasing= T),], n = 20)
    p8 <- ggplot() + geom_jitter(aes(y = Title, x = `Average_Male_Aged_18-29`, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p8)
  })
  output$Top_10_Shows_aged18_29_female <- renderPlotly({
    top=head(Imdb[order(Imdb$`Average_Female 18-29`, decreasing= T),], n = 20)
    p9 <- ggplot() + geom_jitter(aes(y = Title, x = `Average_Female 18-29`, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p9)
  })
  output$Top_10_Shows_aged30_44 <- renderPlotly({
    top=head(Imdb[order(Imdb$`Average_Aged_30-44`,decreasing = T),], n = 20)
    p10 <- ggplot() + geom_jitter(aes(y = Title, x = `Average_Aged_30-44`, color = Studio), data = top,
                                  show.legend = T, 
                                  inherit.aes = T, 
                                  width = 0.2, 
                                  height = 0.5,
                                  size = 2,
                                  alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p10)
  })
  output$Top_10_Shows_aged30_44_male <- renderPlotly({
    top=head(Imdb[order(Imdb$`Average_Male 30-44`, decreasing= T),], n = 20)
    p11<- ggplot() + geom_jitter(aes(y = Title, x = `Average_Male 30-44`, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p11)
  })
  output$Top_10_Shows_aged30_44_female <- renderPlotly({
    top=head(Imdb[order(Imdb$`Average Female 30-44`, decreasing= T),], n = 20)
    p12<- ggplot() + geom_jitter(aes(y = Title, x =`Average Female 30-44` , color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p12)
  })
  output$Top_10_Shows_aged44 <- renderPlotly({
    top=head(Imdb[order(Imdb$`Average_Aged 45+`, decreasing= T),], n = 20)
    p13<- ggplot() + geom_jitter(aes(y = Title, x = `Average_Aged 45+`, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p13)
  })
  output$Top_10_Shows_aged44_male <- renderPlotly({
    top=head(Imdb[order(Imdb$`Average male 45+`, decreasing= T),], n = 20)
    p14<- ggplot() + geom_jitter(aes(y = Title, x = `Average male 45+`, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p14)
  })
  output$Top_10_Shows_aged44_female <- renderPlotly({
    top=head(Imdb[order(Imdb$`Average_female 45+`, decreasing= T),], n = 20)
    p15<- ggplot() + geom_jitter(aes(y = Title, x = `Average_female 45+`, color = Studio), data = top,
                                 show.legend = T, 
                                 inherit.aes = T, 
                                 width = 0.2, 
                                 height = 0.5,
                                 size = 2,
                                 alpha =0.5) + 
      ggthemes::theme_gdocs() 
    
    ggplotly(p15)
  })
}


