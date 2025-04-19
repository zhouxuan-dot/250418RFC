#---
#  title: "Figure 3-B. Line chart. "
#  author: "Xuan Zhou"
#  Lastdate: "2025/4/18"
#---

# ---3-B--------------------------------------------------------------
setwd('XXX\\Git\\Figure3-B')
dataa <- read.table('data3b.txt',header = F)
dataa

pdf("Fif3-B.pdf", width = 8, height = 7)
x <- 1:4
y1 <- dataa$V2
y2 <- dataa$V3
y3 <- dataa$V4
y4 <- dataa$V5
plot(x,y1, type = "o", col = "#00868B", pch = 1 , xlab = "Class", ylab = "Accuracy (%)",yaxt="n",bty="o",lwd = 2,cex.lab = 1.5,cex = 1.5, cex.axis = 1.5) 
par(new = TRUE)
plot(x, y2, type = "n", ann = FALSE, axes = FALSE, ylim = range(c(y1, y2))) 
lines(x, y2,type = "o", col = "#00868B",lty = 2, lwd = 2,cex.lab = 1.5,cex = 1.5)
axis(side = 2, col = "#00868B", col.axis = "#00868B",lwd = 2,cex.lab = 1.5,cex = 1.5, cex.axis = 1.5)  
par(new = TRUE)   
plot(x, y3, type = "n", ann = FALSE, axes = FALSE, ylim = c(-2,4),cex.lab = 1.5,cex = 1.5)  
lines(x, y3,type = "o", col = "#FF7F00",lty = 3 ,lwd = 2,cex.lab = 1.5,cex = 1.5)
lines(x, y4,type = "o", col = "#FF7F00",lty = 1 ,lwd = 2,cex.lab = 1.5,cex = 1.5)
axis(side = 4, col = "#FF7F00", col.axis = "#FF7F00",lwd = 2,cex.lab = 1.5,cex = 1.5, cex.axis = 1.5) 

#par(mai=c(0.5,0,0,0))
xy <- par('usr')
legend(x=xy[2]- xinch(2.0),y=xy[4] - yinch(0.8) , legend = c("true", "predicted", "error","SD"), col = c("#00868B", "#00868B", "#FF7F00", "#FF7F00"), lty = c(1,2,3,1),lwd = 2,bty = 'n',cex = 1.5)
dev.off()
