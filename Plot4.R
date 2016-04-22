png("Plot4.png")

par(mfrow = c(2, 2))

# Plot (1,1)
plot(data$Global_active_power ~ seq_along(data$Date), type = "l", xlab = "",
     ylab = "Global active power (kilowats)", xaxt = "n")
axis(1, at = c(0, length(data$Date)/2, length(data$Date)), labels = c("Thu", "Fri", "Sat"))

# Plot (1,2)
plot(data$Voltage ~ seq_along(data$Date), type = "l", xlab = "datetime",
     ylab = "Voltage", xaxt = "n")
axis(1, at = c(0, length(data$Date)/2, length(data$Date)), labels = c("Thu", "Fri", "Sat"))

# Plot (2,1)
plot(1:2880, data$Sub_metering_1, type = "n", ylab = "Energie sub metering", xlab = "", xaxt = "n")
with(data, points(1:2880, data$Sub_metering_1, col = "black", type = "l"))
with(data, points(1:2880, data$Sub_metering_2, col = "red", type = "l"))
with(data, points(1:2880, data$Sub_metering_3, col = "blue", type = "l"))
axis(1, at = c(0, length(data$Date)/2, length(data$Date)), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#Plot(2,2)
plot(data$Global_reactive_power ~ seq_along(data$Date), type = "l", xlab = "datetime",
     ylab = "Global_reactive_power", xaxt = "n")
axis(1, at = c(0, length(data$Date)/2, length(data$Date)), labels = c("Thu", "Fri", "Sat"))

dev.off()