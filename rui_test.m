addpath("./src/CINC2013/rui");
pkg load signal;

[h,r]=edfread("./data/adfecgdb/r01.edf");
% what window to plot
plot_win = 10000;
% what window to process
proc_win = 100000;
s=r(2:5,1:proc_win);

%subplot(3,1,1);
%plot(r(1,1:plot_win));
%title("Direct");

subplot(2,1,2);
plot(s(1,1:plot_win));
title("Ab1");

[f,q]=physionet2013(1,s);
%title("computed fECG");

% restrict plot window
g=f(f<plot_win);
% get clearance above plot1
y_clear = max(r(1,:)) * 0.6;

hold on;
subplot(2,1,1);
plot((1:plot_win), r(1,1:plot_win), '-', g, y_clear*ones(size(g,1),1), 'vk');
hold off;
