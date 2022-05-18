clc
table_rep = zeros(10,10);
r= 1
c= 1
for n = 1:55
    table_rep(r,c)= p121lngr1sorted(n,1);
    table_rep(c,r)= p121lngrsorted(n,1);
    c= c+1;
    if(c >= 11)
        r= r+1;
        c= r;
    end
        
end 
%table_rep(table_rep<0.6) = 0;
p121lngr5table = table_rep;
[ p121lngr5table_conf ] = confusion_matrix_analysis( p121lngr5table )
clearvars n c r table_rep
% good_ones_table= zeros(11,11);
% 
% r= 1
% c= 1
% for n = 1:66
%     good_ones_table(r,c)= good_ones(n,3);
%     good_ones_table(c,r)= good_ones(n,3);
%     c= c+1;
%     if(c >= 12)
%         r= r+1;
%         c= r;
%     end
%         
% end   