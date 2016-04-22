png("Plot2.png")

plot(data$Global_active_power ~ seq_along(data$Date), type = "l", xlab = "",
     ylab = "Global active power (kilowats)", xaxt = "n")
axis(1, at = c(0, length(data$Date)/2, length(data$Date)), labels = c("Thu", "Fri", "Sat"))

dev.off()