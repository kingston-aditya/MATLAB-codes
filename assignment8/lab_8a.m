% question1(a)
clc;
close all;
t = 0:1/999:0.2; 

%frequency of the impulse in Hz
f=50; 
fs=f; 
y=zeros(size(t));
y(1:fs/f:end)=1;

%time shifted Sinc function

y1 = sinc(t*f);
figure(2);

subplot(2,1,1);
plot(t,y1);
grid on;
title('sinc(t/TS) signal');
xlabel('Time(sec)')
ylabel('Magnitude')
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2])
xticks([0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2]);
grid on;

subplot(2,1,2);
T = 1/50;

% Shifted sincs
% iterate from 0 to 10
for k = 0:10
    y2 = sinc((t/T) - k);
    plot(t,y2,'linewidth',2);
    hold on;
end

title('shifted sincs');
xlabel('Time(sec)')
ylabel('Magnitude')
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2])
xticks([0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2]);
grid on;
