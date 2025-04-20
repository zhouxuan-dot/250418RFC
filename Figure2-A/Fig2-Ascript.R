#FIG--2A--Averaged Raman spectroscopy
#---
#  title: "Figure 2-A. Averaged Raman spectroscopy. "
#  author: "Xuan Zhou"
#  Lastdate: "2025/4/18"
#---

library(sos)
library(dplyr)
library(baseline)
library(hyperSpec)
library(prospectr)
library("RamanEx") #
func_lib()

folderpath <- "Git\\Figure2-A"
func_lib()
setwd(folderpath)
wavenumber <- fread("wavenumber.txt", header = F, sep = "\t")[,1]
wavenumber <- as.data.frame(wavenumber)[,1]

filepaths_tem <- list.files(pattern = "*.csv", full.names = TRUE)

files_data <- c()
for(i in filepaths_tem){
  files_data_i <- read.csv(i,header = FALSE,sep = ",")
  colnames(files_data_i) <- wavenumber
  files_data_i$Group <- gsub(".csv","",basename(i))
  files_data <- rbind(files_data,files_data_i)
}

hs_pre <- files_data
hyperspec_melt <- spc_melt(hs_pre, "Group", 300, 5000)
hyperspec_melt$value <- as.numeric(as.character(hyperspec_melt$value))

hyperspec_melt_summary <- Rmisc::summarySE(hyperspec_melt, 
                                           measurevar = "value", groupvars = c("Group", "wavenumber"))
levels <- levels(factor(hyperspec_melt_summary$Group))
n <- length(levels) * 0.1
for(i in levels)
{
  inds <- which(hyperspec_melt_summary$Group == i )
  hyperspec_melt_summary[inds,]$value <- hyperspec_melt_summary[inds,]$value + n
  n <- n - 0.2
}
hyperspec_melt_summary$wavenumber <- as.numeric(as.character(hyperspec_melt_summary$wavenumber))

plot_hyperspec <- ggplot(data = hyperspec_melt_summary,aes(x = wavenumber, y = value, group = factor(Group))) +
  geom_ribbon(aes(ymin = value - sd, ymax = value + sd, fill = factor(Group)),alpha = 0.3) +
  geom_line(aes(color = factor(Group)),size = 0.8) + 
  
  scale_x_continuous(breaks = seq(500,3050,100)) +
  default_theme()+
  theme(
    legend.title = element_blank(),
    axis.text.x = element_text(size = 15,angle = 45,hjust = 1,vjust = 1),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()) +
  ylab("Normalized Intensity (a.u.)") +
  xlab(expression(paste('Wavenumber (cm'^{-1},')',sep = "")))
plot_hyperspec

ggsave("Fig2-A.pdf", plot_hyperspec, width=20, height=28, units = "cm")

