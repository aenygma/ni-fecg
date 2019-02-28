addpath("./src");
addpath("./src/CINC2013/maurizio.varanini@ifc.cnr.it/B/");

pkg load signal;

[h,r]=edfread("./data/adfecgdb/r04.edf");
% what window to plot
plot_win = 1000*5;
% what window to process
proc_win = 10000;
s=r(2:5,1:proc_win);

subplot(2,1,2);
plot(s(1,1:plot_win));
title("Ab1");

[f,q]=physionet2013(1, s, "rec name");
%title("computed fECG");

% f is given in sec, convert to sample index
f = f*1000;
% restrict plot window
g=f(f<plot_win);
% get clearance above plot1
y_clear = max(r(1,1:proc_win)) * 0.6;

hold on;
subplot(2,1,1);
plot((1:plot_win), r(1,1:plot_win), '-', g, y_clear*ones(size(g,1),1), 'vk');
title("Direct fECG (solid line) vs Computed fECG (diamond marker)");
hold off;
