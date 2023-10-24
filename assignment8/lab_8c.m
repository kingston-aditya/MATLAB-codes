% question1(c)
clc;
close all;

%Message signal
Am =1;   
fm1 = 1; 
fm2 = 3;  
t = 0:1/999:0.2;  
ym = Am*(sin(2*pi*fm1*t)-sin(2*pi*fm2*t));  


%impulse train
fs=50; 
T = 1/fs; 
y=zeros(size(T));
y(1:1:end)=1;

%sampled signal
g_kTs= y.*ym;

%summation of products
y1 = sinc(t*fs);
y2 = g_kTs.* y1;
plot(t,ym,'k');
hold on;

%plot(t,g_kTs);
t1 = 0:0.02:0.2;
temp=zeros(size(t1));
i=1;
for k=t1
    disp(i);
    temp(i) = Am*(sin(2*pi*fm1*k)-sin(2*pi*fm2*k));
    i=i+1;
end
stem(t1,temp);
hold on;

for k = 1:10
    y2 = y2 + g_kTs .* sinc((t/T) - k);
    y3 = g_kTs .* sinc((t/T) - k);
    plot(t,y3,'linewidth', 2);
    hold on;
end

plot(t,y2,"--");
hold off
title('g(t), gs(kTs) and ghat(t)');
xlabel('Time(sec)')
ylabel('Magnitude')
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
xticks([0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2]);
legend('g(t)','gs kTs','g hat(t)');
grid on;
