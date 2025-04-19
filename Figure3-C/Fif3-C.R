#---
#  title: "Figure 3-C. regression chart. "
#  author: "Xuan Zhou"
#  Lastdate: "2025/4/18"
#---

# ---3-C--------------------------------------------------------------
setwd('XXX\\Git\\Figure3-C')
XDATA <- read.table(file="data3c.txt",header= F)
colnames(XDATA) <- c('V1','true','predict')# ,'error','SD'

correlation <- cor(XDATA$true, XDATA$predict)

model <- lm(XDATA$predict ~ XDATA$true, data = XDATA)

XDATA$predicted <- predict(model)

cor_matrix <- matrix(correlation, ncol = 1)
pdf("Fif3-C.pdf", width = 8, height = 7)

plot(XDATA$true, XDATA$predict, 
     main = "DH4 proportion analysis", 
     xlab = "Actual_proportion, log (%)",
     ylab = "Predicted_proportion, (%)",
     col.lab = "black",
     pch = 19,
     lwd = 2,cex.lab = 1.5,cex = 1.5, cex.axis = 1.5)
lines(XDATA$true, XDATA$predicted, col = "#00868B", lwd = 2)
#lines(XDATA$true,XDATA$true, col = "red", lwd = 2)

legend("topleft", 
       legend = c(paste("Correlation:", round(correlation, 4)),
                  paste("Regression Equation: y =", round(coef(model)[2], 2), "x +", round(coef(model)[1], 2)),
                  paste("R^2 =", round(summary(model)$r.squared, 2))),
       #col = "blue",
       #lty = 1,
       bty = "n",cex = 1.5)
dev.off()
