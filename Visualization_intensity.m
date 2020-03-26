function [] = Visualization_intensity(title_name, label, means_alpha, means_beta, intensitys)
figure()
hold on
plot(intensitys,means_alpha)
plot(intensitys,means_beta)
plot(intensitys,(means_alpha+means_beta)/2)
legend(["Alpha region", "Beta region","Alpha+Beta regions"])
xlabel("Intensity")
ylabel(label)
title(title_name)
grid on
end