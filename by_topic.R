setwd("\\\\icnas2.cc.ic.ac.uk/mc6515/Desktop/graph_r")
setwd("C:/Users/marga/Desktop/graph_r")

library(xlsx)
library(gdata)
library(readxl)
require(gdata)
library(dplyr)
library(ggplot2)
library(tidyverse)

topic <- read_excel("by_topic.xlsx", sheet="use")
dim(topic) # 18832  rows  7 cols


# subset and remove the 0 nvals and also the Unknown topic 

topic <- subset(topic, nvals==1 & !(Topic=="Unknown"))
dim(topic)
# 8254 rows  7 cols

table(topic$Topic)
View(topic)
summary(topic)

# group by Topic 
bytopic <- topic %>%
 group_by(Year,Topic) %>%
 summarize(n())


colnames(bytopic)[colnames(bytopic)=="n()"] <- "Publications"


expo <- ggplot(data=bytopic, aes(x=Year,y=Publications,color=Topic, fill=Topic))

expo + geom_line() + theme_classic() +
        scale_y_continuous(breaks=seq(0, 170, 20)) +
        scale_x_continuous(breaks=seq(1960, 2019, 5))


#-----------------------Bar chart------------------------------#
ggsave("bytopic_plots/bartopic.pdf")
expo + geom_bar(stat="identity",  position="stack", width=0.5) +
        scale_y_continuous(breaks=seq(0, 200, 20)) +
        scale_x_continuous(breaks=seq(1960, 2019, 5)) +
        theme_classic()

expo + geom_bar(stat="identity",  position="stack", width=0.5) +
 theme_classic()



#-------------------------Line graph----------------------------------#
#----We only want "Dietary constituents" and "Dietary pattern"--------#


ggsave("bytopic_plots/dietconst_dietpatt.pdf")

bytopic %>%
        filter(Topic=="Dietary constituents" | Topic=="Dietary pattern") %>%
        ggplot(aes(x=Year,y=Publications,color=Topic)) +
        geom_line() + theme_classic() +
        scale_y_continuous(breaks=seq(0, 170, 20)) +
        scale_x_continuous(breaks=seq(1970, 2019, 5))



# Try faceting 

ggsave("bytopic_plots/facet_full.pdf")   
expo + geom_line() + theme_classic() +
        scale_y_continuous(breaks=seq(0, 170, 25)) +
        scale_x_continuous(breaks=seq(1960, 2019, 8)) +
        facet_wrap(~ Topic) +
        theme(axis.title.x=element_blank(),
              axis.text.x=element_blank(),
              strip.text.x=element_text(size = 7, color = "black", 
                                        face = "plain"))


# remove Years 2019 amd 2018 

bytopic <- bytopic %>%
 filter(Year<2018)

range(bytopic$Year) # 1962 2017

# reconstruct the plot 

expo <- ggplot(data=bytopic, aes(x=Year,y=Publications,color=Topic, fill=Topic))

ggsave("bytopic_plots/facet_without2018_2019.pdf")   
expo + geom_line() + theme_classic() +
 scale_y_continuous(breaks=seq(0, 170, 25)) +
 scale_x_continuous(breaks=seq(1960, 2019, 8)) +
 facet_wrap(~ Topic) +
 theme(axis.title.x=element_blank(),
       axis.text.x=element_blank(),
       strip.text.x=element_text(size = 7, color = "black", 
                                 face = "plain"))

    
##---DRAFT---###


g.papers + geom_line(stat="identity") + xlab("Year") + ylab("Number of papers") +
 ggtitle("Topics by year") +
 theme(plot.title = element_text(hjust = 0.5)) + 
 theme_classic() + theme(axis.text.x=element_text(angle=60, hjust=1)) + 
 scale_color_hue(l=60, c=90) + scale_y_continuous(breaks=seq(0, 750, 50)) 

range(bytopic$Year)
# 1962 2019

range(bytopic$Publications)
# 1 176 

#
g.papers + geom_smooth(method = "loess") +
 geom_line(aes(color=Topic)) + 
 xlab("Year") + 
 ylab("Number of papers") +
 scale_y_continuous(breaks=seq(0, 170, 5)) +
 theme_classic()

 ?geom_smooth


g.papers + geom_smooth(method = "loess") +
 geom_line(aes(color=Topic)) + 
 xlab("Year") + 
 ylab("Number of papers") +
 scale_y_continuous(breaks=seq(0, 170, 20)) +
 facet_wrap(~ Topic)
 

View(topicd)

table(topic$Year, topic$Topic)


