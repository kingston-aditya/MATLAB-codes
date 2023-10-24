% question1(b)
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
y=zeros(size(t));
y(1:1:end)=1;

%sampled signal
figure(1);
g_kTs= ym .* y;
t1 = 0:0.02:0.2;
temp=zeros(size(t1));
i=1;
for k=t1
    temp(i) = Am*(sin(2*pi*fm1*k)-sin(2*pi*fm2*k));
    i=i+1;
end
stem(t1,temp);
hold on;

%Sinc function
plot(t,ym,'b');
hold on;
for k = 0:10 
    y2 = sinc(((t - k*T) / T));
    y3 = y2 .* g_kTs;
    plot(t,y3,'linewidth', 2);
    hold on;
end

title('Message signal and scaled sinc pulses');
xlabel('Time(sec)')
ylabel('Magnitude')
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2])
xticks([0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2]);
legend('g(t)','sinc pulses')
grid on;



