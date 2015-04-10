% Watermark Attack

clear all;

image_name='outputs/watermarked.png';
output_name='outputs/attacked.png';

% Attack image
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

% Tangent
for ii = 1:Sh
    for jj = 1:Sw

        temp_object = random_object;
        pixel_color = temp_object(ii, jj);
        tangent(ii, jj) = 0;

        for kk = 1:3

            temp_object(ii, jj) = mod((pixel_color + (64 * kk)), 256);

            if detector.detect(temp_object) == 1
                tangent(ii, jj) = kk;
                break;
            end

        end

    end
end

% Modifying watermarked image
attacked_object=image_object;

for ii = 1:Sh
    for jj = 1:Sw

        if tangent(ii, jj) ~= 0
            attacked_object(ii, jj) = attacked_object(ii, jj) + 1;
        end

    end
end

% Final check
if detector.detect(attacked_object) == 0
    display('Attacked with success!');
end

imwrite(attacked_object, output_name);