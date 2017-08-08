function res123 = Image_handlers1(arg,scale1,clip1)
I = imread(arg);
%imshow(I);
I=double(I); 
R=I(:,:,1); 
G=I(:,:,2); 
B=I(:,:,3);
%%
% constructing filters
%{
k1=4; 
k2=5; 
r=161; 
alf=1458; 
nn=floor((r+1)/2); 
for i=1:r 
    for j=1:r 
        b(i,j) =exp(-((i-nn)^2+(j-nn)^2)/(k1*alf))/(k2*pi*alf*10000); % Gaussian 1 
   end 
end 

k1=8;                                                                   
k2=8; 
r=161; 
alf=1458; 
nn=floor((r+1)/2); 
for i=1:r 
    for j=1:r 
        bb(i,j) =exp(-((i-nn)^2+(j-nn)^2)/(k1*alf))/(k2*pi*alf*10000);     % Gaussian 2 
   end 
end 

k1=0.5; 
k2=0.5; 
r=161; 
alf=1458; 
nn=floor((r+1)/2); 
for i=1:r 
    for j=1:r 
        bbb(i,j) =exp(-((i-nn)^2+(j-nn)^2)/(k1*alf))/(k2*pi*alf*10000);  % Gaussian 2 3 
    end 
    end 
%}
scale=scale1;

%filter(:,:,1)=b;
%filter(:,:,2)=bb;
%filter(:,:,3)=bbb;

clip=clip1;
%  For RED Component  
for i=1:3
%filter=fspecial('gaussian',[161 161],scale(i));
%result(:,:,i)=log(R)-log(imfilter(R,filter));
%result(:,:,i)=single_ret(R,scale(i));
z=imgaussfilt(R,scale(i));
result(:,:,i)=log(R)-log(z);
end
total=1/3*(result(:,:,1)+result(:,:,2)+result(:,:,3));


finR=total.*(log(125*R)-log(R+G+B));

outR=simplecolor(finR,clip(1),clip(2));
%outR=histtru(finR,clip(1),clip(2));

%%
%For Green Component 
for i=1:3
%filter=fspecial('gaussian',[161 161],scale(i));
%result(:,:,i)=log(G)-log(imfilter(G,filter));
%result(:,:,i)=single_ret(G,scale(i));
z=imgaussfilt(G,scale(i));
result(:,:,i)=log(G)-log(z);
end
total=1/3*(result(:,:,1)+result(:,:,2)+result(:,:,3));
finG=total.*(log(125*G)-log(R+G+B));
outG=simplecolor(finG,clip(1),clip(2));
%outG=histtru(finG,clip(1),clip(2));

%For Blue Component
for i=1:3
%filter=fspecial('gaussian',[161 161],scale(i));
%result(:,:,i)=log(B)-log(imfilter(B,filter));
%result(:,:,i)=single_ret(B,scale(i));
z=imgaussfilt(B,scale(i));
result(:,:,i)=log(B)-log(z);
end
total=1/3*(result(:,:,1)+result(:,:,2)+result(:,:,3));
finB=total.*(log(125*B)-log(R+G+B));
outB=simplecolor(finB,clip(1),clip(2));
%outB=histtru(finB,clip(1),clip(2));

%Rnew=uint8(finR);
%Gnew=uint8(finG);
%Bnew=uint8(finB);

Rnew=uint8(outR);
Gnew=uint8(outG);
Bnew=uint8(outB);

RGB(:,:,1)=Rnew;
RGB(:,:,2)=Gnew;
RGB(:,:,3)=Bnew;
figure ,
imshow(RGB);
title('color restoration');
end