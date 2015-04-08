%Project: 	Tutorial on Least Significant Bit Substitution
%               Watermark Embedding

clear all;

% read original image
file_name='lena.bmp';
orig_object=imread(file_name);

% read watermarked image
file_name='lsb_watermarked.bmp';
watermarked_object=imread(file_name);

% create difference of original and watermarked image
diff_object=imfuse(orig_object,watermarked_object,'diff');
imwrite(diff_object, 'diff.bmp');