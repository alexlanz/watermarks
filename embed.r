require("MMSec")

# Read original image
data(lena)
original <- lena

# Size of original image
dim <- dim(original)
heigth <- dim[1]
width <- dim[2]

# Generate watermark
watermark <- matrix(0, nrow=heigth, ncol=width)

for (i in 1:heigth) {
	watermark[i,] <- sample(0:255, width, replace=T)
}

# Apply λ to the watermark
λ <- 1/51
watermark <- λ * watermark
watermark <- round(watermark)

# Adding watermark to the original image
watermarked <- matrix(0, nrow=heigth, ncol=width)

for (i in 1:heigth) {
	for (j in 1:width) {
	
		watermarked[i,j] = original[i,j] + watermark[i,j]

		if (watermarked[i,j] > 255) {
			watermarked[i,j] = 255
		}

	}
}

# Save images
pdf("outputs/original.pdf")
plot(greymap(original))
dev.off()

png(filename="outputs/original.png")
plot(greymap(original))
dev.off()

pdf("outputs/watermark.pdf")
plot(greymap(watermark))
dev.off()

png(filename="outputs/watermark.png")
plot(greymap(watermark))
dev.off()

pdf("outputs/watermarked.pdf")
plot(greymap(watermarked))
dev.off()

png(filename="outputs/watermarked.png")
plot(greymap(watermarked))
dev.off()
