function [outputArg1] = table_conv_function(inputArg1)
%TABLE_CONV_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

outputArg1 = zeros(11,11);
r= 1;
c= 1;
for n = 1:66
    outputArg1(r,c)= inputArg1(n,1);
    outputArg1(c,r)= inputArg1(n,1);
    c= c+1;
    if(c >= 12)
        r= r+1;
        c= r;
    end
        
end

clearvars r c 
end

