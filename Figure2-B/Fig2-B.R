
#---
#  title: "Figure 2-B. Confusionplot. "
#  author: "Xuan Zhou"
#  Lastdate: "2025/4/18"
#---
##---------------------------------------------------------------
setwd('XXX\\Git\\Figure2-B')

library(ggplot2)
confusion_df <-read.table('HXJZ1.txt',header = T)

p <- ggplot(confusion_df, aes(x = Actual, y = Predicted)) +
  geom_tile(aes(fill = Count), color = "black") +
  geom_text(aes(label = Count), vjust = 1,size = 6, color = "black") +
  scale_fill_gradient(low = "white", high = "#00CED1") +  
  theme_minimal() +
  theme(axis.text.x = element_text( angle = 45, color = "black", hjust = 1,vjust=1, size=15,face = "bold"))+  
  theme(axis.text.y = element_text( vjust=1, color = "black",size=15,face = "bold"),
        axis.title.x =element_text( size=15, color = "black",face = "bold"), 
        axis.title.y=element_text( size=15, color = "black",face = "bold"), 
        legend.key.size = unit(25, "pt"),
        legend.text = element_text(size=15, color = "black"),
        legend.title = element_text(size=15, color = "black")
  ) 

print(p)

ggsave("Fig2-B.pdf", p, width = 20, height = 18, units = "cm")
