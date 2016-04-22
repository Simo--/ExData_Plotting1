png("Plot3.png")

plot(1:2880, data$Sub_metering_1, type = "n", ylab = "Energie sub metering", xlab = "", xaxt = "n")
with(data, points(1:2880, data$Sub_metering_1, col = "black", type = "l"))
with(data, points(1:2880, data$Sub_metering_2, col = "red", type = "l"))
with(data, points(1:2880, data$Sub_metering_3, col = "blue", type = "l"))
axis(1, at = c(0, length(data$Date)/2, length(data$Date)), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()