detect <- function(image, watermark) {

	# Pearson correlation
	result <- cor.test(image, watermark, method="pearson")

	# Check
	if (result$estimate >= 0.02) {
		return (TRUE)
	}

	return (FALSE)
	
}

