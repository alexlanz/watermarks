% Watermark Attack

clear all;


image_name='outputs/watermarked.bmp';
output_name='outputs/attacked.bmp';

image_object=imread(image_name);
attacked_object=image_object;

Sh=size(attacked_object,1);
Sw=size(attacked_object,2);


% Attack
while watermark_detector(attacked_object) == 1
    
    for ii 1:1000

        x = randi([1 Sh],1);
        y = randi([1 Sw],1);
	    attacked_object(x, y)=100;

    end

end

imwrite(attacked_object,output_name);