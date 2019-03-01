function [chist] = generateColourHistogram(img)

img = double(img);
imquant = img/255;
imquant = round(imquant*(16-1))+1;
imshow((imquant-1)/15);

%r = img(:,:,1);
%g = img(:,:,2);
%b = img(:,:,3);

%[yr, x] = imhist(r);
%[yg, x] = imhist(g);
%[yb, x] = imhist(b);

%plot(x, yr, 'Red', x, yg, 'Green', x, yb, 'Blue');

%chist = horzcat(yr, yg, yb);

chist = zeros(16, 16, 16);

%chist(1,:) = [];
%chist(end,:) = [];

[height,width,color] = size(imquant);

width;
height;
color;

   for i = 1:height
       for j = 1:width
           rpixel = imquant(i,j,1);
           gpixel = imquant(i,j,2);
           bpixel = imquant(i,j,3);
           
          % total = total + rpixel + gpixel + bpixel;
           
           chist(rpixel,gpixel,bpixel) = chist(rpixel,gpixel,bpixel) + 1 ;
       end 
   end

   chist = reshape(chist,1,16.^3);
   
end

