fm =7;
fc = 30;

Am =1;
Ac = 1;

Tm = 1/fm;
t = linspace(0,2*Tm,500);

kp = 2*pi*0.333;

% message signal
figure();
subplot(211);
mt = Am*square(2*pi*fm*t);
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


