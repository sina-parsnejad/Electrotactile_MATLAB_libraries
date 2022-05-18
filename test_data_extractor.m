
clc

input_file= p101tstp1sorted;
p119s6_data = [];
p119s6_table = [];

%labels= {'base', 'comp', 'p101_r1', 'p101_r2', 'p101_r3', 'p102_r1', 'p102_r2', 'p102_r3', 'p103_r1', 'p103_r2', 'p103_r3', 'p104_r1', 'p104_r2', 'p104_r3', 'p105_r1', 'p105_r2', 'p105_r3'};
% temp_data= [base_comp p101_r1 p101_r2 p101_r3 p102_r1 p102_r2 p102_r3 p103_r1 p103_r2 p103_r3 p104_r1 p104_r2 p104_r3 p105_r1 p105_r2 p105_r3];
temp_data= [labels input_file];
%mean_data= all_data;

mean_data= [ 
    mean(temp_data(1:2,:));
         temp_data(3:17,:); 
    mean(temp_data(18:19,:));
         temp_data(20:33,:);
    mean(temp_data(34:35,:));
         temp_data(36:48,:);
    mean(temp_data(49:50,:));
         temp_data(51:62,:);
    mean(temp_data(63:64,:));
         temp_data(65:75,:);
    mean(temp_data(76:77,:)); 
         temp_data(78:87,:);
    mean(temp_data(88:89,:));
         temp_data(90:98,:);
    mean(temp_data(99:100,:));
         temp_data(101:108,:);
    mean(temp_data(109:110,:));
         temp_data(111:117,:);
    mean(temp_data(118:119,:));
         temp_data(120:125,:);
    mean(temp_data(126:127,:));
         temp_data(128:132,:);
    mean(temp_data(133:134,:));
         temp_data(135:138,:);
    mean(temp_data(139:140,:));
         temp_data(141:143,:);
    mean(temp_data(144:145,:));
         temp_data(146:147,:);
    mean(temp_data(148:149,:));
         temp_data(150:150,:);
    mean(temp_data(151:152,:));
        
         ];
     
table_rep = zeros(16,16);
r= 1;
c= 1;
for n = 1:136
    table_rep(r,c)= mean_data(n,3);
    table_rep(c,r)= mean_data(n,3);
    c= c+1;
    if(c > 16)
        r= r+1;
        c= r;
    end
        
end   

p119s6_data= mean_data;
p119s6_table= table_rep;

clearvars mean_data table_rep r c temp_data all_data input_file temp n;