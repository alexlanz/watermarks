% Watermark Detector

clear all;

watermark_name='images/baboon.bmp';
watermarked_name='images/watermarked.bmp';


% read in the images
watermark_object=imread(watermark_name);
watermarked_object=imread(watermarked_name);

% determine size of watermarked image
Mw=size(watermark_object,1);    %Height
Nw=size(watermark_object,2);    %Width

% use lsb of watermarked image to recover watermark
for ii = 1:Mw
    for jj = 1:Nw
        watermark_original(ii,jj)=bitget(watermark_object(ii,jj),8);
    end
end

% scale the watermark
watermark_original=256*double(watermark_original);

% determine size of watermarked image
Mw=size(watermarked_object,1);    %Height
Nw=size(watermarked_object,2);    %Width

% use lsb of watermarked image to recover watermark
for ii = 1:Mw
    for jj = 1:Nw
        watermark(ii,jj)=bitget(watermarked_object(ii,jj),1);
    end
end

% scale the recovered watermark
watermark=256*double(watermark);

% check the difference of the original watermark and the extracted one
d=corr2(watermark_original,watermark);

display(d);

%imwrite(watermark,'original_watermark.bmp');
