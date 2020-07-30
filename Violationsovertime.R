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

CAA <- read.csv(here("MA4_CAA_enforcement.csv"))

CAA$year <- as.numeric(CAA$year)

#some basics on axis formatting 

largernumbers <- element_text(face = "bold", size = 14)
largernumbers2 <- element_text(face = "bold", size = 12)

#let's make a figure that looks *sparklyyyy*

CAAenforce <- ggplot(CAA, mapping=aes(x=factor(year), y=CAA_enforcement, color=President, group=1))+
  scale_color_manual(values=c("#00bb38" , "#619eff"))+
  geom_point(size=3)+
  geom_line()+
  labs(y="CAA enforcement", x="Year")+
  ggtitle("CAA enforcement in MA 4")+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        axis.title.x=largernumbers,
        axis.text.y=largernumbers2, axis.title.y=largernumbers,plot.title = largernumbers, 
        axis.text.x=element_text(angle= 80,hjust=1))




CAAenforce
  

#now let's save it 

ggsave("CAA_enforcement_MA4.png", plot = CAAenforce)
  
  