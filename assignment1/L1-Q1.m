clc;
% message signal
mp = 1;
fm = 1000;
% tm = 0.001
tm = 1/fm;
% time for simulation
t = (0:tm/1000000:2*tm);
mt = mp*sin(2*pi*fm*t);
% figure plot 1
figure();
plot(t,mt);
title("Message signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on;
% Carrier signal
% mu can be any value out of 0.5,1,1.5.
% Change the value accordingly
mu = 1.5; 
Ac = mp/mu;
fc = 100*1000000;
tc = 1/fc;
t = (0:tm/100000000000:2*tc);
mc=Ac*sin(2*pi*fc*t);
% figure plot 2
figure();
plot(t,mc);
title("Carrier signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on;
% Am signal
t = (0:tm/1000000:6*tm);
phi=Ac*(1+mu*sin(2*pi*fm*t)).*sin(2*pi*fc*t);
figure();
plot(t,phi);
title("AM Signal");
xlabel("time(sec)");
ylabel("Amplitude(volt)");
grid on;
