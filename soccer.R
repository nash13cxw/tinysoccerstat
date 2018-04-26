library(dplyr)
library(ggplot2)
library(ggthemes)
library(ggrepel)

mo <- read.csv(file="/Users//Desktop/mo.csv")
me <- read.csv(file="/Users//Desktop/messi.csv")
cr <- read.csv(file="/Users//Desktop/cr.csv")
soccer <- rbind(mo,me,cr)

soccer <- soccer %>% mutate(mpg=mins/Goals)

soccer %>% ggplot(aes(x=name,y=Goals,fill=Competition)) + 
  geom_bar(stat = "identity",position = "dodge") 

soccer %>% ggplot(aes(name,Goals))+
  geom_point()+
  ggtitle("Scatter Plot")+
  theme_economist(base_size=10)+
  geom_label_repel(aes(name, Goals, label = Competition),box.padding = 0.35, point.padding = 0.5,segment.color = 'grey50')

soccer %>% ggplot(aes(name,mpg))+
  geom_point()+
  ggtitle("Scatter Plot")+
  theme_economist(base_size=10)+
  geom_label_repel(aes(name, mpg, label = Competition),box.padding = 0.35, point.padding = 0.5,segment.color = 'grey50')
