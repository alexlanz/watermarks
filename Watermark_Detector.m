%Project: 	Watermark Detector

clear all;

% read in original watermark file -> message
file_name='bamboo.bmp';
message=imread(file_name);

% determine size of watermarked image
Mw=size(watermarked_image,1);	%Height
Nw=size(watermarked_image,2);	%Width

% use lsb of watermarked image to recover watermark
for ii = 1:Mw
    for jj = 1:Nw
        watermark(ii,jj)=bitget(watermarked_image(ii,jj),8);
    end
end

% scale the recovered watermark
watermark=256*double(watermark);
imwrite(watermark,'orgiginal_watermark.bmp');
% scale and display recovered watermark
%figure(1)
%imshow(watermark,[])
%title('Recovered Watermark')