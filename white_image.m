% Watermark Detector

clear all;

image_name='images/baboon.bmp';
output_name='outputs/white.bmp';

% read in the images
image_object=imread(image_name);

% determine size of watermark image
Mw=size(image_object,1);    %Height
Nw=size(image_object,2);    %Width

% use msb of watermark image
for ii = 1:Mw
    for jj = 1:Nw
        image_object(ii,jj)=255;
    end
end

% output
imwrite(image_object, output_name);
