
clc

input_file= S1P101sorted;
S1P101_data = [];
S1P101_table = [];

%labels= {'base', 'comp', 'p101_r1', 'p101_r2', 'p101_r3', 'p102_r1', 'p102_r2', 'p102_r3', 'p103_r1', 'p103_r2', 'p103_r3', 'p104_r1', 'p104_r2', 'p104_r3', 'p105_r1', 'p105_r2', 'p105_r3'};
% temp_data= [base_comp p101_r1 p101_r2 p101_r3 p102_r1 p102_r2 p102_r3 p103_r1 p103_r2 p103_r3 p104_r1 p104_r2 p104_r3 p105_r1 p105_r2 p105_r3];
temp_data= [labels input_file];
%mean_data= all_data;

mean_data= [ 
    mean(temp_data(1:5,:));
         temp_data(5:32,:); 
    mean(temp_data(33:37,:));
         temp_data(16:25,:);
    mean(temp_data(26:27,:));
         temp_data(28:36,:);
    mean(temp_data(37:38,:));
         temp_data(39:46,:);
    mean(temp_data(47:48,:));
         temp_data(49:55,:);
    mean(temp_data(56:57,:)); 
         temp_data(58:63,:);
    mean(temp_data(64:65,:));
         temp_data(66:70,:);
    mean(temp_data(71:72,:));
         temp_data(73:76,:);
    mean(temp_data(77:78,:));
         temp_data(79:81,:);
    mean(temp_data(82:83,:));
         temp_data(84:85,:);
    mean(temp_data(86:87,:));
         temp_data(88:88,:);
    mean(temp_data(89:90,:));         
        
         ];
     
table_rep = zeros(12,12);
r= 1;
c= 1;
for n = 1:78
    table_rep(r,c)= mean_data(n,3);
    table_rep(c,r)= mean_data(n,3);
    c= c+1;
    if(c > 12)
        r= r+1;
        c= r;
    end
        
end   

S1P101_data= mean_data;
S1P101_table= table_rep;

clearvars mean_data table_rep r c temp_data all_data input_file temp n;