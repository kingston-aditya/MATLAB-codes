fm =1000;
fc = 10*1000;

Am =3;
Ac = 1;

Tm = 1/fm;
t = linspace(0,2*Tm,50000);

kp = 2*pi*5;

% message signal
figure();
subplot(211);
mt = Am*sin(2*pi*fm*t);
plot(t,mt);
xlabel("time");
ylabel("mt");
title("message signal");
grid on;

% PM signal
subplot(212);
mfm = Ac*cos(2*pi*fc*t + kp*mt);
plot(t,mfm);
xlabel("time");
ylabel("mfm");
title("PM signal");
grid on;