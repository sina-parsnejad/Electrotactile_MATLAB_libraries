
clc

input_file= p106ph38A3S2sorted;
p106ph38A3S2_data = [];
p106ph38A3S2_table = [];

%labels= {'base', 'comp', 'p101_r1', 'p101_r2', 'p101_r3', 'p102_r1', 'p102_r2', 'p102_r3', 'p103_r1', 'p103_r2', 'p103_r3', 'p104_r1', 'p104_r2', 'p104_r3', 'p105_r1', 'p105_r2', 'p105_r3'};
% temp_data= [base_comp p101_r1 p101_r2 p101_r3 p102_r1 p102_r2 p102_r3 p103_r1 p103_r2 p103_r3 p104_r1 p104_r2 p104_r3 p105_r1 p105_r2 p105_r3];
temp_data= [labels input_file];
%mean_data= all_data;

mean_data= [ 
    mean(temp_data(1:2,:));
         temp_data(3:11,:); 
    mean(temp_data(12:13,:));
         temp_data(14:21,:);
    mean(temp_data(22:23,:));
         temp_data(24:30,:);
    mean(temp_data(31:32,:));
         temp_data(33:38,:);
    mean(temp_data(39:40,:));
         temp_data(41:45,:);
    mean(temp_data(46:47,:)); 
         temp_data(48:51,:);
    mean(temp_data(52:53,:));
         temp_data(54:56,:);
    mean(temp_data(57:58,:));
         temp_data(59:60,:);
    mean(temp_data(61:62,:));
         temp_data(63:63,:);
    mean(temp_data(64:65,:));
       
        
         ];
s= 10;     
table_rep = zeros(s,s);
r= 1;
c= 1;
for n = 1:55
    table_rep(r,c)= mean_data(n,3);
    table_rep(c,r)= mean_data(n,3);
    c= c+1;
    if(c > s)
        r= r+1;
        c= r;
    end
        
end   

p106ph38A3S2_data= mean_data;
p106ph38A3S2_table= table_rep;

clearvars mean_data table_rep r c temp_data all_data input_file temp n s;