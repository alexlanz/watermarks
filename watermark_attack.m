% Watermark Attack

clear all;


image_name='outputs/watermarked.bmp';
image_object=imread(image_name);


% Initial check
result = watermark_detector(image_object);
display(result);