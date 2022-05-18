
clc

input_file= p101ph3A8S3;
p101ph3A8S3_data = [];
p101ph3A8S3_table = [];

%labels= {'base', 'comp', 'p101_r1', 'p101_r2', 'p101_r3', 'p102_r1', 'p102_r2', 'p102_r3', 'p103_r1', 'p103_r2', 'p103_r3', 'p104_r1', 'p104_r2', 'p104_r3', 'p105_r1', 'p105_r2', 'p105_r3'};
% temp_data= [base_comp p101_r1 p101_r2 p101_r3 p102_r1 p102_r2 p102_r3 p103_r1 p103_r2 p103_r3 p104_r1 p104_r2 p104_r3 p105_r1 p105_r2 p105_r3];
temp_data= [labels input_file];
%mean_data= all_data;

mean_data= [ 
    mean(temp_data(1:2,:));
         temp_data(3:6,:); 
    mean(temp_data(7:8,:));
         temp_data(9:11,:);
    mean(temp_data(12:13,:));
         temp_data(14:15,:);
    mean(temp_data(16:17,:));
         temp_data(18:18,:);
    mean(temp_data(19:20,:));
         
         ];
s = 5;     
table_rep = zeros(s,s);
r= 1;
c= 1;
for n = 1:15
    table_rep(r,c)= mean_data(n,3);
    table_rep(c,r)= mean_data(n,3);
    c= c+1;
    if(c > s)
        r= r+1;
        c= r;
    end
        
end   

p101ph3A8S3_data= mean_data;
p101ph3A8S3_table= table_rep;

clearvars mean_data table_rep r c temp_data all_data input_file temp n s;