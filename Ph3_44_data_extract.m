
clc

input_file= p102ph38A52S1sorted;
p102ph38A52S1_data = [];
p102ph38A52S1_table = [];

%labels= {'base', 'comp', 'p101_r1', 'p101_r2', 'p101_r3', 'p102_r1', 'p102_r2', 'p102_r3', 'p103_r1', 'p103_r2', 'p103_r3', 'p104_r1', 'p104_r2', 'p104_r3', 'p105_r1', 'p105_r2', 'p105_r3'};
% temp_data= [base_comp p101_r1 p101_r2 p101_r3 p102_r1 p102_r2 p102_r3 p103_r1 p103_r2 p103_r3 p104_r1 p104_r2 p104_r3 p105_r1 p105_r2 p105_r3];
temp_data= [labels input_file];
%mean_data= all_data;

mean_data= [ 
    mean(temp_data(1:2,:));
         temp_data(3:9,:); 
    mean(temp_data(10:11,:));
         temp_data(12:17,:);
    mean(temp_data(18:19,:));
         temp_data(20:24,:);
    mean(temp_data(25:26,:));
         temp_data(27:30,:);
    mean(temp_data(31:32,:));
         temp_data(33:35,:);
    mean(temp_data(36:37,:)); 
         temp_data(38:39,:);
    mean(temp_data(40:41,:));
         temp_data(42:42,:);
    mean(temp_data(43:44,:));
        
         ];
     
s = 8;     
table_rep = zeros(s,s);
r= 1;
c= 1;
for n = 1:36
    table_rep(r,c)= mean_data(n,3);
    table_rep(c,r)= mean_data(n,3);
    c= c+1;
    if(c > s)
        r= r+1;
        c= r;
    end
        
end    

p102ph38A52S1_data= mean_data;
p102ph38A52S1_table= table_rep;

clearvars mean_data table_rep r c temp_data all_data input_file temp n s;