function [alpha_region,beta_region]=Frequency_regions_estimation(X, vis)
alpha=[8,12];
beta=[15,30];
Fs=250;                   
L=length(X);

n=2^nextpow2(L);

Y=fft(X,n);
f=Fs*(0:(n/2))/n;
P=abs(Y/n);

alpha_limits=(f>=alpha(1)).*(f<=alpha(2));
alpha_freq=nonzeros(f.*alpha_limits);
alpha_region=nonzeros(P(1:n/2+1)'.*alpha_limits);

beta_limits=(f>=beta(1)).*(f<=beta(2));
beta_freq=nonzeros(f.*beta_limits);
beta_region=nonzeros(P(1:n/2+1)'.*beta_limits);

if vis==1
    figure()
    hold on
    plot(alpha_freq,alpha_region)
    plot(beta_freq,beta_region)
    % plot(f,P(1:n/2+1)) 
    xlabel('Frequency (f)')
    ylabel('|P(f)|')
end

end