require("MMSec")

library(png)

# Load the watermark
watermark <- as.matrix(read.table("outputs/watermark", header=F))

# Load watermarked image
#watermarked_png <- load.png("outputs/watermarked.png")
img <- readPNG("outputs/watermarked.png")
print(img)

watermarked <- t(as.matrix(watermarked_png))
print(watermarked)


# Pearson correlation
print(dim(watermark))
print(dim(watermarked))
result <- cor.test(watermarked, watermark, method="pearson")

print(result)
