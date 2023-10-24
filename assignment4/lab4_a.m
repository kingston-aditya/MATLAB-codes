clc;
close all;

% defining time for message signal
Tb = .001;
t1 = 0:Tb/999:Tb;
t2 = Tb:Tb/999:2*Tb;
t3 = 2*Tb:Tb/999:3*Tb;
t4 = 3*Tb:Tb/999:4*Tb;
t5 = 4*Tb:Tb/999:5*Tb;
t6 = 5*Tb:Tb/999:6*Tb;
t7 = 6*Tb:Tb/999:7*Tb;
t8 = 7*Tb:Tb/999:8*Tb;

%defining time array
t = [t1 t2 t3 t4 t5 t6 t7 t8];

% defining ak
y1 = ones(size(t1));                   
y2 = zeros(size(t2));                  
y3 = ones(size(t3));                 
y4 = ones(size(t4));                  
y5 = zeros(size(t5));          
y6 = zeros(size(t6));           
y7 = zeros(size(t7));         
y8 = ones(size(t8));     

%defining message signal
ym = [y1 y2 y3 y4 y5 y6 y7 y8];

%plot ym
figure();
subplot(3,1,1);
plot(t ,ym);  
ylim([-0.5 1.5]);
title("Message signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on;

% defining a carrier signal
Ac=1; 
fc=3000; 
Tc =  1/fc;
t1 = 0:Tc/333.33:(Tc*24);
yc=Ac*sin(2*pi*fc*t); 
subplot(3,1,2);
plot(t1,yc); 
title("Carrier Signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on;

% defining a modulated signal
y = (ym.*yc);
subplot(3,1,3);
plot(t,y); 
title("Modulated Signal");
xlabel("time(sec)");
ylabel("Amplitude(volt)");
grid on;

