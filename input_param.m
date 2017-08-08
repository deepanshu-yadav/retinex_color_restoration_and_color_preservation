function res123 = input_param(arg)
defaultans = {'15','80','250','1','1'}; %default
options.Resize = 'on';
params = inputdlg({'low','medium','high','lower_clip','upper_clip'},...
              'Parameters', [1 7; 1 7;1 7;1 7;1 7],defaultans,options); 
low=str2double(params{1});
medium=str2double(params{2});
high=str2double(params{3});
clip1=str2double(params{4});
clip2=str2double(params{5});

scale=[low medium high];
clip=[clip1 clip2];
Image_handlers1(arg,scale,clip);
Image_handlers2(arg,scale,clip);
 

end