function [ output_args, min ] = confusion_matrix_analysis( input_matrix )
%CONFUSION_MATRIX_ANALYSIS Summary of this function goes here
%   Detailed explanation goes here
[input_size, XXX] = size(input_matrix);
target=0;
mini= 1;
for row = 1:input_size
    for col= 1:input_size
        if(row == col)
            target= target + 1 - input_matrix(row, col);
        else
            target= target + input_matrix(row, col);
			if (mini >input_matrix(row, col))
				mini = input_matrix(row, col);
			end
        end
    end
end
output_args= target/(input_size*input_size);
min= mini;
clearvars target input_size row col XXX mini;


end

