function [ tiny_im ] = generate_tiny_image(img)

img = double(img);
imquant = img/255;
imquant = round(imquant*(16-1))+1;

tiny_im = zeros(16,16,3);

[height,width,color] = size(imquant);

%hrat = floor(height/16);
%wrat = floor(width/16);

    for i = 1:16
           for j = 1:16
               rpixel = imquant(i,j,1);
               gpixel = imquant(i,j,2);
               bpixel = imquant(i,j,3);

               tiny_im(i,j,1) = rpixel;
               tiny_im(i,j,2) = gpixel;
               tiny_im(i,j,3) = bpixel;
           end
    end
    
tiny_im = reshape(tiny_im,(16^2)*3,1);

end