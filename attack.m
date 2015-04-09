% Watermark Attack

clear all;


image_name='outputs/watermarked.bmp';
output_name='outputs/attacked.bmp';

image_object=imread(image_name);
attacked_object=image_object;


% Attack
while watermark_detector(attacked_object)

    

end



