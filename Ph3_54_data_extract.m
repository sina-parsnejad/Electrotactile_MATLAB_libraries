
clc

input_file= p101ph3A2S3;
p101ph3A2S3_data = [];
p101ph3A2S3_table = [];

%labels= {'base', 'comp', 'p101_r1', 'p101_r2', 'p101_r3', 'p102_r1', 'p102_r2', 'p102_r3', 'p103_r1', 'p103_r2', 'p103_r3', 'p104_r1', 'p104_r2', 'p104_r3', 'p105_r1', 'p105_r2', 'p105_r3'};
% temp_data= [base_comp p101_r1 p101_r2 p101_r3 p102_r1 p102_r2 p102_r3 p103_r1 p103_r2 p103_r3 p104_r1 p104_r2 p104_r3 p105_r1 p105_r2 p105_r3];
temp_data= [label input_file];
%mean_data= all_data;

mean_data= [ 
    mean(temp_data(1:2,:));
         temp_data(3:10,:); 
    mean(temp_data(11:12,:));
         temp_data(13:19,:);
    mean(temp_data(20:21,:));
         temp_data(22:27,:);
    mean(temp_data(28:29,:));
         temp_data(30:34,:);
    mean(temp_data(35:36,:));
         temp_data(37:40,:);
    mean(temp_data(41:42,:)); 
         temp_data(43:45,:);
    mean(temp_data(46:47,:));
         temp_data(48:49,:);
    mean(temp_data(50:51,:));
         temp_data(52:52,:);
    mean(temp_data(53:54,:));
         
         ];
     
table_rep = zeros(9,9);
r= 1;
c= 1;
for n = 1:45
    table_rep(r,c)= mean_data(n,3);
    table_rep(c,r)= mean_data(n,3);
    c= c+1;
    if(c > 9)
        r= r+1;
        c= r;
    end
        
end   

p101ph3A2S3_data= mean_data;
p101ph3A2S3_table= table_rep;

clearvars mean_data table_rep r c temp_data all_data input_file temp n;