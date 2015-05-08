require("MMSec")
source('detect.r')

# Load the watermark
watermark <- as.matrix(read.table("outputs/watermark", header=F))

# Load the image
image <- load.png("outputs/watermarked.png")
image <- as.matrix(image) * 255

attacked <- image

# Size of image
dim <- dim(image)
heigth <- dim[1]
width <- dim[2]

# Set random pixels to grey value until images is not detected anymore
repeat {
	watermarked <- detect(attacked, watermark)

	if (! watermarked) {
		break
	}

	x = sample(1:heigth, 1, replace=T)
	y = sample(1:width, 1, replace=T)

	attacked[x,y] = 128
}

# Save images
save.png(greymap(attacked), "outputs/attacked.png", overwrite=TRUE)
