% similar to k-fold cross validation
clc
k=10;

table= original_table;
table_size = size(table,1);
table(1:(table_size+1):end) = 0;

dist = table;
dist_original_table = original_table;

dist_original_table(dist_original_table<0.4) = 0;

sim_value= 0.95;
S = exp(-dist.^2);
issymmetric(S);
S_eps = S;
S_eps(S_eps<sim_value) = 0;
%Create a graph object from S.
G_eps = graph(S_eps);
%Visualize the similarity graph.
%figure(1)
%plot(G_eps)
cluster_list= unique(conncomp(G_eps));
kx = max(cluster_list);

global_min = 0;
global_conf = 0;
global_RMS = 1;

for table_size=1:100
    [idx3, V] = spectralcluster(S,k,'Distance','precomputed');
    [clusters, I] = sort(idx3); 
    clusters= [clusters I];
    clearvars I;
    
    C = cell(k,1);
        
    [table_size, ~] = size(table);

    for table_size = 1:table_size
        C{clusters(table_size,1)} = [C{clusters(table_size,1)} clusters(table_size,2)];
    end
    all_combinations= combvec(C{:});
    comb_sizes = size(all_combinations);
    for table_size = 1: comb_sizes(2)
         label_list= (sort(all_combinations(:,table_size))).';
         temp_table= original_table( label_list, label_list);
        [ RMS_val, temp_table_min ]= RMS_analysis_with_mins (temp_table);
        if ( RMS_val <= global_RMS)
             if( RMS_val < global_RMS)
                 global_min=0;
                 global_conf=0;
             end
            if( temp_table_min >= global_min)
                 [conf , ~ ]= confusion_matrix_analysis_with_mins (temp_table);
                 if( conf > global_conf)
                    global_conf = conf;
                    global_RMS= RMS_val;
                    global_min = temp_table_min;
                    best_table = temp_table;
                    best_table_label = label_list.';
                    best_cluster= C;
                    best_idx3= idx3;
                    best_S = S;
                 end
            end
        end
    end 
end

global_RMS
[ ~, global_min ]= RMS_analysis_with_mins (best_table)
global_conf

% [elements, ~] = size(ultimate_cluster);
% 
% Clusters_based_on_BF_and_TF= cell(elements,1);
% BF_and_TF_clusters_unified= [];
% 
% for table_size = 1:elements
%     
%     Clusters_based_on_BF_and_TF{table_size} = waveform_LUT(ultimate_cluster{table_size}.', 1:2);
%     [Cell_size, ~] = size(Clusters_based_on_BF_and_TF{table_size});
%     A=ones(Cell_size,1)*table_size;
%     Clusters_based_on_BF_and_TF{table_size} = [Clusters_based_on_BF_and_TF{table_size} A];
%     
%     BF_and_TF_clusters_unified = [BF_and_TF_clusters_unified ; Clusters_based_on_BF_and_TF{table_size}];
% 
% end
% 
% %hold on
% %gscatter(X{n}(:,1),X{n}(:,2),X{n}(:,3));
% figure(2)
% gscatter(BF_and_TF_clusters_unified(:,1),BF_and_TF_clusters_unified(:,2),BF_and_TF_clusters_unified(:,3));