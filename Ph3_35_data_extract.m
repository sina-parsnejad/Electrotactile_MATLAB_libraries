
clc

input_file= p122ph38A52S2sorted;
p122ph38A52S2_data = [];
p122ph38A52S2_table = [];

%labels= {'base', 'comp', 'p101_r1', 'p101_r2', 'p101_r3', 'p102_r1', 'p102_r2', 'p102_r3', 'p103_r1', 'p103_r2', 'p103_r3', 'p104_r1', 'p104_r2', 'p104_r3', 'p105_r1', 'p105_r2', 'p105_r3'};
% temp_data= [base_comp p101_r1 p101_r2 p101_r3 p102_r1 p102_r2 p102_r3 p103_r1 p103_r2 p103_r3 p104_r1 p104_r2 p104_r3 p105_r1 p105_r2 p105_r3];
temp_data= [labels input_file];
%mean_data= all_data;

mean_data= [ 
    mean(temp_data(1:2,:));
         temp_data(3:8,:); 
    mean(temp_data(9:10,:));
         temp_data(11:15,:);
    mean(temp_data(16:17,:));
         temp_data(18:21,:);
    mean(temp_data(22:23,:));
         temp_data(24:26,:);
    mean(temp_data(27:28,:));
         temp_data(29:30,:);
    mean(temp_data(31:32,:)); 
         temp_data(33:33,:);
    mean(temp_data(34:35,:));
         
         ];
     
table_rep = zeros(7,7);
r= 1;
c= 1;
for n = 1:28
    table_rep(r,c)= mean_data(n,3);
    table_rep(c,r)= mean_data(n,3);
    c= c+1;
    if(c > 7)
        r= r+1;
        c= r;
    end
        
end   

p122ph38A52S2_data= mean_data;
p122ph38A52S2_table= table_rep;

clearvars mean_data table_rep r c temp_data all_data input_file temp n;