clc;

Am = 1;
Ac = 1;
fm =1000;
fc = 10^7;

T = 1/fm;
t = (0:T/999:2*T);
kf = 2*pi*5000;

% message signal
figure();
subplot(411);
mt = Am*sin(2*pi*fm*t);
plot(t,mt);
xlabel("t");
ylabel("m(t)");
title("message signal");
grid on;

% carrier signal
subplot(412);
mt = Ac*sin(2*pi*fc*t);
plot(t,mt);
xlabel("t");
ylabel("m(t)");
title("carrier signal");
grid on;

% modulated signal
subplot(413);
imt = Am*(1-cos(2*pi*fm*t))/(2*pi*fm);
plot(t,imt);
xlabel("t");
ylabel("m(t)");
title("integrated signal");
grid on;

% FM signal
subplot(414);
fm = Ac*cos(2*pi*fc*t + kf*imt);
plot(t,fm);
xlabel("t");
ylabel("m(t)");
title("modulated signal");
grid on;


