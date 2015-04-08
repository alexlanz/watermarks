% Watermark Embedding - Least Significant Bit Substitution

clear all; 

image_name='images/lena.bmp';
watermark_name='images/baboon.bmp';
output_watermark_name='images/watermarked.bmp';
output_watermark_noice_name='images/watermarked_noice.bmp';

% read in the images
image_object=imread(image_name);
watermark_object=imread(watermark_name);

% conversions needed to spread the image values on a 256 gray-scale
watermark_object=double(watermark_object);
watermark_object=round(watermark_object./256);
watermark_object=uint8(watermark_object);

% determine the size of cover image used for embedding
Mc=size(image_object,1);    %Height
Nc=size(image_object,2);    %Width

% determine the size of watermark_object object to embed
Mm=size(watermark_object,1);            %Height
Nm=size(watermark_object,2);            %Width

% title the watermark_object object out to cover object size to generate watermark
for ii = 1:Mc
    for jj = 1:Nc
        watermark(ii,jj)=bitget(watermark_object(ii,jj),8);
    end
end

% set the LSB of image_object(ii,jj) to the value of the MSB of watermark(ii,jj)
watermarked_image=image_object;
for ii = 1:Mc
    for jj = 1:Nc
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),1,watermark(ii,jj));
    end
end

% add noise to watermarked image
noisy=imnoise(watermarked_image, 'gaussian');

% write to file the two images
imwrite(watermarked_image,output_watermark_name);
imwrite(noisy,output_watermark_noice_name);