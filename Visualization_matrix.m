function []=Visualization_matrix(matrix,channel_names)
figure()
imagesc(matrix)
xticklabels(channel_names)
yticklabels(channel_names)
end