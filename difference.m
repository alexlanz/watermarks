% Watermark Difference

clear all;

image_name='images/lena128x128.png';
watermarked_name='outputs/attacked.png';
output_name='outputs/diff.png';

% read in the images
image_object=imread(image_name);
watermarked_object=imread(watermarked_name);

% create difference of original and watermarked image
diff_object=imfuse(image_object,watermarked_object,'diff');

imwrite(diff_object, output_name);