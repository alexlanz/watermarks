function return_value = watermark_detector( image_object ) 
 
    return_value = 0;

    watermark_name='images/baboon.bmp';
    watermark_threshold=0.8;

    watermark_object=imread(watermark_name);

    Sh=size(watermark_object,1);
    Sw=size(watermark_object,2);

    % use msb of watermark image
    for ii = 1:Sh
        for jj = 1:Sw
            watermark_original(ii,jj)=bitget(watermark_object(ii,jj),8);
        end
    end

    % use lsb of watermarked image
    for ii = 1:Sh
        for jj = 1:Sw
            watermark_extracted(ii,jj)=bitget(image_object(ii,jj),1);
        end
    end

    % check the difference of the original watermark and the extracted one
    d=corr2(watermark_original,watermark_extracted);

    if (d > watermark_threshold)
        return_value = 1;
    end
 
end