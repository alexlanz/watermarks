classdef WatermarkDetector
    properties
        original = false;
    end
    properties(Constant)
        threshold = 0.95;
        watermark_name='images/baboon50x50.bmp';
    end
    methods

        function r = getOriginal(obj)

            if (obj.original ~= false)
                r = obj.original;
                return;
            end

            watermark_object=imread(obj.watermark_name);

            Sh=size(watermark_object,1);
            Sw=size(watermark_object,2);

            % use msb of watermark image
            for ii = 1:Sh
                for jj = 1:Sw
                    watermark_original(ii,jj)=bitget(watermark_object(ii,jj),8);
                end
            end

            obj.original = watermark_original;

            r = watermark_original;

        end

        function r = detect(obj, image_object)

            r = 0;

            Sh=size(image_object,1);
            Sw=size(image_object,2);


            % use lsb of watermarked image
            for ii = 1:Sh
                for jj = 1:Sw
                    watermark_extracted(ii,jj)=bitget(image_object(ii,jj),1);
                end
            end

            % orignal watermark image
            watermark_original=obj.getOriginal();

            % check the difference of the original watermark and the extracted one
            d=corr2(watermark_original,watermark_extracted);

            if (d > obj.threshold)
                r = 1;
            end

        end
    end
end