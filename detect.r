require("MMSec")

library(png)

# Load the watermark
watermark <- as.matrix(read.table("outputs/watermark", header=F))

# Load the image
image <- load.png("outputs/watermarked.png")
image <- as.matrix(image) * 255

# Pearson correlation
print(dim(watermark))
print(dim(image))
result <- cor.test(image, watermark, method="pearson")

print(result)
