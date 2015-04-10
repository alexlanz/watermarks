% Watermark Attack

clear all;

% Attack image
image_name='outputs/watermarked.png';
output_name='outputs/attacked.png';

image_object=imread(image_name);

Sh=size(image_object,1);
Sw=size(image_object,2);

% Detector
detector = WatermarkDetector;

% Random object
random_object=image_object;

while detector.detect(random_object) == 1

    x = randi([1 Sh],1);
    y = randi([1 Sw],1);
    random_object(x, y)=128;

end


imwrite(random_object,output_name);