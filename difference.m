% Watermark Difference

clear all;

image_name='images/lena50x50.png';
watermarked_name='outputs/watermarked.png';
output_name='outputs/diff.png';

% read in the images
image_object=imread(image_name);
watermarked_object=imread(watermarked_name);

% create difference of original and watermarked image
diff_object=imfuse(image_object,watermarked_object,'diff');

imwrite(diff_object, output_name);