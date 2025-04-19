#---
#  title: "Figure 2-D. Boxplot. "
#  author: "Xuan Zhou"
#  Lastdate: "2025/4/18"
#---
##---------------------------------------------------------------
setwd('XXX\\Git\\Figure2-D')
data1 <- read.table('HIAplotP2-D.txt',header = T)
colors <- c("#8A919799", "#00CED1", "#87CEFA", "#FED43999", "#FFAEB9")
pdf("Fif2-D.pdf", width = 8, height = 6)
boxplot(Standard_Deviation ~ Spectral_Number, data = data1, col = colors,cex.axis = 1.5,cex.lab = 1.5)
dev.off()
