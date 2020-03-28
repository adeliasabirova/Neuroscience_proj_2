function [res,result]=time_dependency(part_num,intensity,channel_names,fun,t)
[~,~,channel_res]=Get_data_by_intencity(part_num,intensity,channel_names);

n=round(t/60*length(channel_res));
res=[];
for i=1:length(channel_res)-n
    data=channel_res(i:i+n,:);
    alpha_data=[];
    beta_data=[];
    for j=1:length(channel_names)
        [alpha_region,beta_region]=Frequency_regions_estimation(data(:,j),0);
        alpha_data=[alpha_data,alpha_region];
        beta_data=[beta_data,beta_region]; 
    end
    [~,alpha_res]=fun(alpha_data,channel_names,0);
    [~,beta_res]=fun(beta_data,channel_names,0);
    res=[res,(alpha_res+beta_res)/2];
end
result=mean(res);
end