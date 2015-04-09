% Watermark Detector

clear all;

watermark_name='images/baboon.bmp';

% read in the images
watermark_object=imread(watermark_name);

% determine size of watermark image
Mw=size(watermark_object,1);    %Height
Nw=size(watermark_object,2);    %Width

% use msb of watermark image
for ii = 1:Mw
    for jj = 1:Nw
        watermark_original(ii,jj)=bitget(watermark_object(ii,jj),8);
    end
end


% create start white image
image_object=true(Mw,Nw);

% output
imwrite(image_object, 'outputs/white.bmp');


image_object=imread('outputs/white.bmp');
image_object(1:256,1:256,:) = [1,0,0];
imwrite(image_object, 'outputs/white.bmp');
