clc;
clear all;
[filename, pathname] = uigetfile('*.bmp;*.tif;*.jpg;*.pgm','Pick an M-file');
%%
im_in = imread(filename);
%im_in = imread(filename);

im = imresize(im_in, [32 32]);
im_grey=single(rgb2gray(im));
%imshow(im_grey);
%im2 = im(:,:,1)+(im(:,:,2)*2^8)+(im(:,:,3)*2^16);
temph = fopen('temph.s','w');
im3=im_grey-single(128*ones(32));

 fprintf(temph,'\t\tAREA  image_data, DATA, READONLY\n');
 fprintf(temph,'\t\tEXPORT  sample\n');
 fprintf(temph,'\t\tEXPORT  sample_end\n');
 fprintf(temph,'\t\tEXPORT  sample_size\n');
 fprintf(temph,'\t\tEXPORT  quant_mat\n');


fprintf(temph,'sample\t');
im_vect=reshape(im3,32*32,1);
   str=num2hex(im_vect);
   for i =1:32*32
        hexstr=str(i,:);
         fprintf(temph,'\t\tDCD 0x%s\n',hexstr);

    end
%  fprintf(temph,'%d\n', im2);
 fprintf(temph,'sample_end\n');
 fprintf(temph,'sample_size\tEQU\tsample_end-sample\n');
 
fprintf(temph,'quant_mat\t');
Q50 = [ 16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62; 
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
    
 fprintf(temph,'\t\tDCD 0x%08x\n',Q50);

 fprintf(temph,'\t\tEND');

fclose(temph);
