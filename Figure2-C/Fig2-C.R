
#---
#  title: "Figure 2-C. Boxplot. "
#  author: "Xuan Zhou"
#  Lastdate: "2025/4/18"
#---
##---------------------------------------------------------------
setwd('XXXX\\Git\\Figure2-C')
data1 <- read.table('P2B2.txt',header = T)
colors <- c("#8A919799", "#00CED1", "#87CEFA", "#FED43999", "#FFAEB9") 
pdf("Fif2-C.pdf", width = 8, height = 6)
boxplot(Classification_Accuracy ~ Spectral_Number, data = data1, col = colors,cex.axis = 1.5,cex.lab = 1.5) 
dev.off()
