require("MMSec")

# Read original image
#data(lena)
lena <- load.png("images/lena-small.png")
original <- as.matrix(lena) * 255


# Size of original image
dim <- dim(original)
heigth <- dim[1]
width <- dim[2]

# Generate watermark
watermark <- matrix(0, nrow=heigth, ncol=width)

for (i in 1:heigth) {
	watermark[i,] <- sample(0:255, width, replace=T)
}

# Store the watermark
write.table(watermark, file="outputs/watermark", row.names=F, col.names=F)

save.png(greymap(watermark), "outputs/watermark.png", overwrite=TRUE)

# Apply λ to the watermark
λ <- 1/51
watermark <- λ * watermark
watermark <- round(watermark)

# Adding watermark to the original image
watermarked <- original

for (i in 1:heigth) {
	for (j in 1:width) {
	
		watermarked[i,j] = original[i,j] + watermark[i,j]

		if (watermarked[i,j] > 255) {
			watermarked[i,j] = 255
		}

	}
}

# Save images
save.png(greymap(original), "outputs/original.png", overwrite=TRUE)
save.png(greymap(watermarked), "outputs/watermarked.png", overwrite=TRUE)

