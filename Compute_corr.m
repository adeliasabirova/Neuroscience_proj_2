function [corr_,mean_]=Compute_corr(data,channel_names,vis)
corr_=corr(data,"type","Pearson");
mean_=(sum(corr_,'all')-length(channel_names))/(length(channel_names)^2-length(channel_names));

if vis==1
    Visualization_matrix(corr_,channel_names)
end
end