#---
#  title: "Figure 2-E. Hot-plot. "
#  author: "Xuan Zhou"
#  Lastdate: "2025/4/18"
#---
##---------------------------------------------------------------
setwd('XXX\\Git\\Figure2-E')

library(ggplot2)

confusion_df <-read.table('BACH-HXJZ.txt',header = T)

p <- ggplot(confusion_df, aes(x = Predicted, y = Model)) +
  geom_tile(aes(fill = Accuracy), color = "white") +
  geom_text(aes(label = Accuracy), vjust = 1,size = 6) +
  scale_fill_gradient(low = "white", high = "#00CED1") +  
  theme_minimal() +
  theme(axis.text.x = element_text( hjust = 1,vjust=1, size=18, color = "black", face = "bold"))+ 
  theme(axis.text.y = element_text(vjust=1,size=18, color = "black",face = "bold"),
        axis.title.x =element_text(size=18, color = "black",face = "bold"), 
        axis.title.y=element_text(size=18, color = "black",face = "bold"), 
        legend.key.size = unit(25, "pt"),
        legend.text = element_text(size=18, color = "black",face = "bold"),
        legend.title = element_text(size=18, color = "black",face = "bold")
  )

print(p)

ggsave("Fig2-E.pdf", p, width = 18, height = 19, units = "cm")
