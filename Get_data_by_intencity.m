function [alpha_data,beta_data,channel_res]=Get_data_by_intencity(part_num,intensity,channel_names)
part_folder="Participant "+num2str(part_num);
figs_for_spectra=part_folder+"\Figs for spectra\Backgr_int_"+num2str(intensity)+".dat";

channel_res=readtable(figs_for_spectra);
channel_res=table2array(channel_res(:,1:length(channel_names)));
channel_res=channel_res-mean(channel_res);

alpha_data=[];
beta_data=[];

for i=1:length(channel_names)
    [alpha_region,beta_region]=Frequency_regions_estimation(channel_res(:,i),0);
    alpha_data=[alpha_data,alpha_region];
    beta_data=[beta_data,beta_region];
end
end