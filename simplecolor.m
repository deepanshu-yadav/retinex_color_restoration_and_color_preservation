function out=simplecolor(input,clip1,clip2)
[row,col]=size(input);
tot=row*col;
%{
    int per1, per2;
    int index;
    double min,max, scale;
    double *sortdata;

    sortdata= (double*) malloc(image_size*sizeof(double));

    memcpy(sortdata, data, image_size*sizeof(double));

    qsort(sortdata, image_size, sizeof sortdata[0], &myComparisonFunction);

    per1 = (int) (s1*image_size/100);
    min=sortdata[per1];

    per2=(int)(s2*image_size/100);
    max= sortdata[image_size-1-per2];


    if(max  <= min)
        for(index=0; index<(int)image_size; index++)
            data_out[index]=max;
    else
    {
        scale=255./(max-min);
        for(index=0; index<(int)image_size; index++)
        {
            if(data[index] < min) data_out[index]=0.;
            else if(data[index]> max) data_out[index]=255.;
            else data_out[index]=scale*(data[index]-min);
        }
    }

    return data_out;



%}
x=reshape(input,1,tot);
y=sort(x);
per1=uint32((clip1/100)*tot);
min=y(1,per1);
per2=uint32((clip2/100)*tot);
max=y(1,tot-per2);
data_out=zeros(1,tot);
if(max  <= min)
        for i=1:tot
            data_out(1,i)=max;
        end
else
    
        
        scale=(255)/(max-min);
        for j=1:tot
        
            if x(1,j) < min 
                data_out(1,j)=0;
            elseif x(1,j)> max 
                data_out(1,j)=255;
            else
                data_out(1,j)=scale*(x(1,j)-min);
            end
        end
           
end






out=reshape(data_out,row,col);


end