# Load the watermark
watermark <- as.matrix(read.table("outputs/watermark", header=F))

# Detect
detect <- function(image) {

	# Pearson correlation
	result <- cor.test(image, watermark, method="pearson")
	print(result$estimate)

	# Check
	if (result$estimate <= 0.021 & result$estimate >= 0.019) {
		
		coin = sample(0:1, 1, replace=T)

		if (coin == 0) {
			return (FALSE)
		} else {
			return (TRUE)
		}
	}

	if (result$estimate > 0.021) {
		return (TRUE)
	}

	return (FALSE)
	
}

