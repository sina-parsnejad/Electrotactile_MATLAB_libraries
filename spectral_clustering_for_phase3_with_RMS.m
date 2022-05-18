% similar to k-fold cross validation
%clc
k= 18;

table= original_table;
table_size = size(table,1);
table(1:(table_size+1):end) = 0;

dist = table;
dist_original_table = original_table;

dist_original_table(dist_original_table<0.4) = 0;

sim_value= 0.5;
S = exp(-dist.^2);
issymmetric(S);
S_eps = S;
S_eps(S_eps<sim_value) = 0;
%Create a graph object from S.
G_eps = graph(S_eps);
%Visualize the similarity graph.
figure(1)
plot(G_eps)
cluster_list= unique(conncomp(G_eps));
kx = max(cluster_list);

global_min = 0;
global_min2 = 0;
global_conf = 0;
global_RMS = 1;

for n=1:10
    [idx3, V] = spectralcluster(S,k,'Distance','precomputed');
    [clusters, I] = sort(idx3); 
    clusters= [clusters I];
    clearvars I;
    
    C = cell(k,1);
    

         
    [table_size, ~] = size(table);

    for n = 1:table_size
        C{clusters(n,1)} = [C{clusters(n,1)} clusters(n,2)];
    end
    all_combinations= combvec(C{:});
    comb_sizes = size(all_combinations);
    for n = 1: comb_sizes(2)
         label_list= (sort(all_combinations(:,n))).';
         temp_table= original_table( label_list, label_list);
        [ RMS_val, temp_table_min ]= RMS_analysis_with_mins (temp_table);

     if ( RMS_val <= global_RMS)
         if( RMS_val < global_RMS)
             global_min=0;
         end
         if( temp_table_min > global_min)
             global_RMS= RMS_val;
             global_min = temp_table_min;
             best_table = temp_table;
             best_table_label = label_list;
             best_table_label= best_table_label.';
             RMS_best_table_label = best_table_label ;
             RMS_best_table = best_table;
             %ultimate_best_min = best_min;
             %ultimate_best_confusion_matrix = best_confusion_matrix;
             best_cluster= C;
             RMS_idx3= idx3;
             RMS_S_eps = S_eps;
         end
     end
%      [ conf, temp_table_min ]= confusion_matrix_analysis_with_mins (temp_table);
%      if ( temp_table_min >= global_min2)
%          if( temp_table_min > global_min2)
%              global_conf=0;
%          end
%          if( conf >= global_conf)
%              global_RMS2= RMS_val;
%              global_min2 = temp_table_min;
%              best_table2 = temp_table;
%              best_table_label = label_list;
%              best_table_label= best_table_label.';
%              min_best_table_label = best_table_label ;
%              min_best_table = best_table2;
%              %ultimate_best_min = best_min;
%              %ultimate_best_confusion_matrix = best_confusion_matrix;
%              min_cluster= C;
%              min_idx3= idx3;
%              min_S_eps = S_eps;
%          end
%      end
    end 
    

    
    
end

[ RMS_Best_RMS, ~]= RMS_analysis_with_mins (RMS_best_table)
[RMS_best_confusion_matrix, RMS_best_min ]= confusion_matrix_analysis_with_mins (RMS_best_table)

% [ min_Best_RMS, ~]= RMS_analysis_with_mins (min_best_table)
% [min_best_confusion_matrix, min_best_min ]= confusion_matrix_analysis_with_mins (min_best_table)

[elements, ~] = size(best_cluster);

Clusters_based_on_BF_and_TF= cell(elements,1);
BF_and_TF_clusters_unified= [];
% 
% for n = 1:elements
%     
%     Clusters_based_on_BF_and_TF{n} = waveform_LUT(best_cluster{n}.', 1:2);
%     [Cell_size, ~] = size(Clusters_based_on_BF_and_TF{n});
%     A=ones(Cell_size,1)*n;
%     Clusters_based_on_BF_and_TF{n} = [Clusters_based_on_BF_and_TF{n} A];
%     
%     BF_and_TF_clusters_unified = [BF_and_TF_clusters_unified ; Clusters_based_on_BF_and_TF{n}];
% 
% end

%hold on
%gscatter(X{n}(:,1),X{n}(:,2),X{n}(:,3));
% figure(2)
% gscatter(BF_and_TF_clusters_unified(:,1),BF_and_TF_clusters_unified(:,2),BF_and_TF_clusters_unified(:,3));