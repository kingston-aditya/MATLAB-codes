clc;

% message signal
mp =2; 
fm = 1000; 
tm = 1/fm;
t = 0:tm/1000000:2*tm; 
ym = mp*sin(2*pi*fm*t); 
figure();
plot(t,ym);
grid on; 
title("Message signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");

% Carrier signal
Ac=2; 
fc=100*1000000; 
tc=1/fc;
t = (0:tm/100000000000:2*tc);
yc=Ac*sin(2*pi*fc*t); 
figure();
plot(t,yc);
grid on; 
title("Carrier Signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");

% DSB-SC
t = (0:tm/1000000:2*tm);
y=Ac*(mp*sin(2*pi*fm*t)).*sin(2*pi*fc*t); 
figure();
plot(t,y); 
title(" DSB-SC Signal");
xlabel("time(sec)");
ylabel("Amplitude(volt)");
grid on;