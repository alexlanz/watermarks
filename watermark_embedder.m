% Watermark Embedding

clear all; 

image_name='images/lena.bmp';
watermark_name='images/baboon.bmp';
output_name='outputs/watermarked.bmp';

% read in the images
image_object=imread(image_name);
watermark_object=imread(watermark_name);

% determine size of watermark image
Mw=size(watermark_object,1);    %Height
Nw=size(watermark_object,2);    %Width

% use lsb of watermark image
for ii = 1:Mw
    for jj = 1:Nw
        watermark(ii,jj)=bitget(watermark_object(ii,jj),8);
    end
end

% set the LSB of image_object(ii,jj) to the value of the MSB of watermark(ii,jj)
watermarked_object=image_object;
for ii = 1:Mw
    for jj = 1:Nw
        watermarked_object(ii,jj)=bitset(watermarked_object(ii,jj),1,watermark(ii,jj));
    end
end

% write to file the watermarked image
imwrite(watermarked_object,output_name);
