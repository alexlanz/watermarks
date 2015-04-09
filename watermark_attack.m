% Watermark Attack

clear all;

watermarked_name='outputs/watermarked.bmp';
output_name='outputs/init.bmp';

% read in the images
watermarked_object=imread(watermarked_name);

% determine size of watermark image
Mw=size(watermarked_object,1);    %Height
Nw=size(watermarked_object,2);    %Width

% create inital image
init_object = watermarked_object;

% use lsb of watermarked image
init_object(1:30,1:30) = 100;

imwrite(watermarked_object,output_name);