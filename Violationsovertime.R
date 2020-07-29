#Let's bring in some packages

#install.packages("here")
#install.packages("ggplot2")
#install.packages("tidyr")
#install.packages("dplyr")
#install.packages("wesanderson")


library(here)
library(ggplot2)
library(tidyr)
library(dplyr)
library(wesanderson)


#let's load in the data 

RCRA <- read.csv(here("MA4_RCRA_enforcement.csv"))

RCRA$year <- as.numeric(RCRA$year)

#some basics on axis formatting 

largernumbers <- element_text(face = "bold", size = 14)
largernumbers2 <- element_text(face = "bold", size = 12)

#let's make a figure that looks *sparklyyyy*

RCRAinsp <- ggplot(RCRA, mapping=aes(x=factor(year), y=RCRA_enforcement, color=President, group=1))+
  geom_point(size=3)+
  geom_line()+
  labs(y="RCRA enforcement", x="Year")+
  ggtitle("RCRA enforcement in MA 4")+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        axis.title.x=largernumbers,
        axis.text.y=largernumbers2, axis.title.y=largernumbers,plot.title = largernumbers, 
        axis.text.x=element_text(angle= 80,hjust=1))




RCRAinsp
  
  
  