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

# Calculate neutral grey
neutralGrey = round(mean(image))

# Set random pixels to grey value until the watermark is not detected anymore
repeat {
	watermarked <- detect(attacked, watermark)

	if (! watermarked) {
		break
	}

	x = sample(1:heigth, 1, replace=T)
	y = sample(1:width, 1, replace=T)

	attacked[x,y] = neutralGrey
}

save.png(greymap(attacked), "outputs/attacked-step1.png", overwrite=TRUE)

# Find a tangent
tangent <- matrix(0, nrow=heigth, ncol=width)

getPixelOffset <- function(image, watermark, x, y) {

	currentPixelValue = image[x,y]

	for (offset in c(64, -64, 128, -128, 192, -192)) {
		changedPixelValue = (currentPixelValue + offset)

		if (changedPixelValue < 0 || changedPixelValue > 255) {
			next
		}

		image[x,y] = changedPixelValue
		watermarked <- detect(image, watermark)
		
		if (watermarked) {
			image[x,y] = currentPixelValue
			return (offset)
		}
	}

	image[x,y] = currentPixelValue
	return (0)
}

for (x in 1:heigth) {
	for (y in 1:width) {

		tangent[x,y] = getPixelOffset(attacked, watermark, x, y)

	}
}

#print(tangent)

scaledVector <- tangent / 64

attacked <- image

for (x in 1:heigth) {
	for (y in 1:width) {
		
		changedValue = attacked[x,y] - scaledVector[x,y]

		if (changedValue < 0) {
			changedValue = 0
		}

		if (changedValue > 255) {
			changedValue = 255
		}

		attacked[x,y] = changedValue
	
	}
}

result = detect(attacked, watermark)

print(result)

# Save images
save.png(greymap(attacked), "outputs/attacked.png", overwrite=TRUE)
