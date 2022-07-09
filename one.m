close all;
clear all;
[img, palette_img]=imread('lena.png'); % reads the indexed image in filename into ing and reads its associated colormap into palette
img = img(:,:) % selects the first "pane" of the array "img". If the array only has one pane (e.g., a grayscale image) 
figure(1) %Create a  figure.
imshow(img, palette_img); % Gray? 3 image  displays the indexed image img with the colormap palette_img.
axis('image'); %This command will fit the axes box tightly around the data
axis on; % Showing the Normal axis
colorbar; % display a grayscale image with a color bar
figure(2)
palette_img = colormap(jet(255)); % sets the colormap for the current figure to the colormap specified by jet and jet returns the colormap with 255 colors.
imshow(img, palette_img);
axis('image');
axis on;
colorbar; 
histo = imhist(img,palette_img); %  calculates the histogram for the indexed image img with colormap palette_img.
figure(3);
plot(histo,'.');% creates a histogram chart with "." .
M=zeros(size(img)); % Creates a variable with the elements zero as the same size of img.
compt=0;
[L,C]=size(img) % L and C representing the row and column of img matrix respectively.
for i=1:L
    for j=1:C
        if (img(i,j) == 33 | img(i,j) == 53 | img(i,j) == 78) % Evaluating this specific pixel size and later it updates
            img(i,j) = 254; % It is updating the pixel into 254
            M(i,j)=5; % From here we can notice which specifc matrix element is updated 254.
            compt=compt+1; % The total pixel updated to 254 is around 5907
        end;
    end;
end;

histoIM = imhist(img,palette_img); % Putting information in the imhist function which is histogram
figure(4);
plot(histoIM,'.'); % Each exceptional point is updated by "."
figure(5);
IM=image(img); % We are showing the exceptional points in the image .
axis('image');
axis on;
colorbar;
% palette_img;