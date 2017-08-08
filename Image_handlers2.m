function res123 = Image_handlers2(arg,scale1,clip1)
I = imread(arg);
%imshow(I);
I=double(I); 
R=I(:,:,1); 
G=I(:,:,2); 
B=I(:,:,3);
scale=scale1;
clip=clip1;
[row,col]=size(R);
%  For only intensity  Component  
Int=(R+G+B)/3;
for i=1:3
%filter=fspecial('gaussian',[161 161],scale(i));
z=imgaussfilt(Int,scale(i));
%result(:,:,i)=log(Int)-log(imfilter(Int,filter));
%result(:,:,i)=single_ret(Int,scale(i));
result(:,:,i)=log(Int)-log(z);
end
total=1/3*(result(:,:,1)+result(:,:,2)+result(:,:,3));
%Int1=total;
%Int1=histtru(total,clip(1),clip(2));

Int1=simplecolor(total,clip(1),clip(2));

for i=1:row
    for j=1:col
        Be=max([R(i,j) G(i,j) B(i,j)]);
        A=min([255/Be Int1(i,j)/Int(i,j)]);
        outR(i,j)=A*R(i,j);
        outG(i,j)=A*G(i,j);
        outB(i,j)=A*B(i,j);
    end
end

Rnew=uint8(outR);
Gnew=uint8(outG);
Bnew=uint8(outB);

RGB(:,:,1)=Rnew;
RGB(:,:,2)=Gnew;
RGB(:,:,3)=Bnew;
figure ,
imshow(RGB);
title('colour preservation');
end