% Watermark Detector

clear all;

watermark_name='images/baboon.bmp';
watermarked_name='images/watermarked.bmp';

% read in the images
watermark_object=imread(watermark_name);
watermarked_object=imread(watermarked_name);

% determine size of watermark image
Mw=size(watermark_object,1);    %Height
Nw=size(watermark_object,2);    %Width

% use lsb of watermark image
for ii = 1:Mw
    for jj = 1:Nw
        watermark_original(ii,jj)=bitget(watermark_object(ii,jj),8);
    end
end

% use lsb of watermarked image
for ii = 1:Mw
    for jj = 1:Nw
        watermark_extracted(ii,jj)=bitget(watermarked_object(ii,jj),8);
    end
end


% check the difference of the original watermark and the extracted one
d=corr2(watermark_original,watermark_extracted);

display(d);