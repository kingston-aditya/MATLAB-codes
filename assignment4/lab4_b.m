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
y11 = ones(size(t1));                
y12 = zeros(size(t2));                  
y13 = ones(size(t3));                 
y14 = ones(size(t4));                 
y15 = zeros(size(t5));                 
y16 = zeros(size(t6));                 
y17 = zeros(size(t7));                  
y18 = ones(size(t8));                  

%defining message signal
ym1 = [y11 y12 y13 y14 y15 y16 y17 y18];

%plot ym1
figure();
subplot(5,1,1);
plot(t ,ym1); 
ylim([-0.5 1.5]);
title("Message signal(ak)");
xlabel("time(sec)");
grid on;

%defining (1-ak)
y21 = zeros(size(t1));                   
y22 = ones(size(t2));                  
y23 = zeros(size(t3));                   
y24 = zeros(size(t4));                    
y25 = ones(size(t5));                 
y26 = ones(size(t6));                  
y27 = ones(size(t7));                  
y28 = zeros(size(t8)); 

%defining amplitudes of wave list
ym2 = [y21 y22 y23 y24 y25 y26 y27 y28];

%plot ym2 
figure(1);
subplot(5,1,2);
plot(t ,ym2); 
ylim([-0.5 1.5]);
title("Message signal(1-ak)");
xlabel("time(sec)");
grid on; 

% plotting carrier signal
Ac=1; 
fc0=3000; 
Tc0 =  1/fc0;
t1 = 0:Tc0/333.33:(Tc0*24);
yc0=Ac*sin(2*pi*fc0*t); 
subplot(5,1,3);
plot(t1,yc0);  
title("Carrier Signal for (1-ak)");
xlabel("time(sec)");
grid on;

%plotting carrier signal 2
fc1=2000; 
Tc1 =  1/fc1;
t1 = 0:Tc1/499.99:(Tc1*16);
yc1=Ac*sin(2*pi*fc1*t); 
subplot(5,1,4);
plot(t1,yc1);  
title("Carrier Signal for ak");
xlabel("time(sec)");
grid on;

% modulated signal
y = (ym1.*yc1)+(ym2.*yc0);
subplot(5,1,5);
plot(t1,y); 
title("Modulated Signal");
xlabel("time(sec)");
grid on;
