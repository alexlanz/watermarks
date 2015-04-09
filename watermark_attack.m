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

for ii = 1:100
    for jj = 1:100
        image_object(ii,jj)=100;
    end
end

% output
display(image_object)

imwrite(image_object, 'outputs/white.bmp');