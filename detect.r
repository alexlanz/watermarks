detect <- function(image) {

	# Load the watermark
	watermark <- as.matrix(read.table("outputs/watermark", header=F))

	# Pearson correlation
	result <- cor.test(image, watermark, method="pearson")

	# Check
	if (result$estimate >= 0.01) {
		return (TRUE)
	}

	return (FALSE)
	
}

