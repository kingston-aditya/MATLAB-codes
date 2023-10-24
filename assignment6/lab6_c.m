% question1(c)
clc;
close all;

% message signal
Am =1;   
fm1 = 1; 
fm2 = 3;  
t = 0:0.02:1;  

ym = Am*(sin(2*pi*fm1*t)-sin(2*pi*fm2*t)); 
figure(1);
subplot(3,1,1);
plot(t,ym);
title("Message signal in time domain");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on; 

%impulse train 
t=0:0.02:1;
y = ones(length(t));
subplot(3,1,2)
stem(t,y);
title("impulse train");
xlabel("t");
ylabel("Amplitude(volt)");
grid on;

%sampled signal
gs= y.*ym;
subplot(3,1,3);
stem(t,ym);
title("impulse train multiplied to message signal");
xlabel("t");
ylabel("Amplitude(volt)");
grid on;

% superimposed signal
l = 16;
peak = max(abs(ym));
delta = 2*peak/16;

gkts = ym/delta;
gkts = round(gkts);
gkts = gkts*delta;

figure(2);
plot(t,ym,'r');
hold on;
stem(t,ym,'b');
hold on;
stem(t,gkts,'g');
legend('message','sampled','quantized');
title("Superimposed signal");
xlabel("t");
ylabel("Amplitude(volt)");
grid on;
