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

plot(x, yr, 'Red', x, yg, 'Green', x, yb, 'Blue');

%chist = horzcat(yr, yg, yb);

chist = zeros(16, 16, 16);

%chist(1,:) = [];
%chist(end,:) = [];

end
