

std_matrix = zeros(66,6);

%105 103 104 106 102 101
%103 106 104 103 101 105
%103 106 102 101 104 105
%103 102 101 104 106 105
std_matrix(:,1)= std(all_data(:,9 :11)')';
std_matrix(:,2)= std(all_data(:,6 :8 )')';
std_matrix(:,3)= std(all_data(:,18 :20)')';
std_matrix(:,4)= std(all_data(:,3 :5 )')';
std_matrix(:,5)= std(all_data(:,12:14)')';
std_matrix(:,6)= std(all_data(:,15:17)')'; 
all_data_int_person= [mean(all_data(:,9 :11),2) mean(all_data(:,6 :8 ),2) mean(all_data(:,18 :20),2)  mean(all_data(:,3 :5 ),2) mean(all_data(:,12:14),2) mean(all_data(:,15:17),2)];
int_p_std= std(all_data_int_person')';

% std_matrix(:,1)= std(all_data(:,3 :5 )')';
% std_matrix(:,2)= std(all_data(:,6 :8 )')';
% std_matrix(:,3)= std(all_data(:,9 :11)')';
% std_matrix(:,4)= std(all_data(:,12:14)')';
% std_matrix(:,5)= std(all_data(:,15:17)')';
% std_matrix(:,6)= std(all_data(:,18 :20)')';
% all_data_int_person= [mean(all_data(:,3 :5 ),2) mean(all_data(:,6 :8 ),2) mean(all_data(:,9 :11),2) mean(all_data(:,12:14),2) mean(all_data(:,15:17),2) mean(all_data(:,18:20),2) ];
% int_p_std= std(all_data_int_person')';

% % std_matrix(:,1)= std(all_data(:,9 :11)')';
% % std_matrix(:,2)= std(all_data(:,18 :20)')';
% % std_matrix(:,3)= std(all_data(:,6 :8 )')'; 
% % std_matrix(:,4)= std(all_data(:,3 :5 )')';
% % std_matrix(:,5)= std(all_data(:,12:14)')';
% % std_matrix(:,6)= std(all_data(:,15:17)')'; 
% %  
% % 
% % all_data_int_person= [mean(all_data(:,9 :11),2) mean(all_data(:,18 :20),2) mean(all_data(:,6 :8 ),2)  mean(all_data(:,3 :5 ),2) mean(all_data(:,12:14),2) mean(all_data(:,15:17),2)];
% % int_p_std= std(all_data_int_person')';


subject_dependency_overall_c3 = (1+int_p_std)./(1+mean(std_matrix(:,1:5) ,2));
RMS_subject_dependency_overall_c3= rms(subject_dependency_overall_c3)


for n=2:6
%     all_data_int_person(:, 1:n)
%     std(all_data_int_person(:, 1:n)')'
%     (1+std(all_data_int_person(:, 1:n)')')
%     std_matrix(:,1:n)
%     (1+mean(std_matrix(:,1:n) ,2))
%   
% 
%     (1+mean(std_matrix(:,1:n) ,2))./(1+std(all_data_int_person(:, 1:n)')')
    subject_dependency_matrix_c3(:,n) =  (1+mean(std_matrix(:,1:n) ,2))./(1+std(all_data_int_person(:, 1:n)')')
end
RMS_subject_dependency_matrix_c3= rms(subject_dependency_matrix_c3)
rms(RMS_subject_dependency_matrix_c3(:, 2:6))



