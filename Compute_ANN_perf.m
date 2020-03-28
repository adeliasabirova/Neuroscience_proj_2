function [perf_matr,mean_perf]=Compute_ANN_perf(data,channel_names,vis)
offset=min(data);
scale=ones(size(offset))./(max(data)-min(data));

data_NN=(data-offset).*scale;
perf_matr=zeros(length(channel_names));
for i=1:length(channel_names)
    for j=1:length(channel_names)
        x=data_NN(:,i);
        y=data_NN(:,j);
        [perf]=ANN_perfomance(x,y);
        perf_matr(i,j)=perf;
    end
end

mean_perf=mean(perf_matr,'all');

if vis==1
    Visualization_matrix(perf_matr,channel_names)
end
end

function [perf]=ANN_perfomance(x,y)
cv = cvpartition(size(x,1),'HoldOut',0.5);
idx = cv.test;
x_train=x(~idx,:);
y_train=y(~idx,:);
x_test=x(idx,:);
y_test=y(idx,:);
net=feedforwardnet(10);
net=train(net,x_train',y_train');
y_calc=net(x_test');
perf=1-mse(net,y_test',y_calc);
end