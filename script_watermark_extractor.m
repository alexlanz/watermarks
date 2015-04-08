%Project: 	Tutorial on Least Significant Bit Substitution
%               Watermark Recover

clear all;

% read in watermarked image
watermarked_name='images/watermarked.bmp';
watermarked_object=imread(watermarked_name);

% determine size of watermarked image
Mw=size(watermarked_object,1);	%Height
Nw=size(watermarked_object,2);	%Width

% use lsb of watermarked image to recover watermark
for ii = 1:Mw
    for jj = 1:Nw
        watermark(ii,jj)=bitget(watermarked_object(ii,jj),1);
    end
end

% scale the recovered watermark
watermark=256*double(watermark);
imwrite(watermark,'recovered_watermark.bmp');