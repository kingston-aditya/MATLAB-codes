% question1(b)
clc;
close all;

Tb = .001;

%defining ck
t1 = 0:Tb/999:Tb;
t2 = Tb:Tb/999:2*Tb;
t3 = 2*Tb:Tb/999:3*Tb;
t4 = 3*Tb:Tb/999:4*Tb;
t5 = 4*Tb:Tb/999:5*Tb;
t6 = 5*Tb:Tb/999:6*Tb;
t7 = 6*Tb:Tb/999:7*Tb;
t8 = 7*Tb:Tb/999:8*Tb;
t9 = 8*Tb:Tb/999:9*Tb;
t10 = 9*Tb:Tb/999:10*Tb;
t11 = 10*Tb:Tb/999:11*Tb;

%defining time 
t = [t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11];

%initialising ck
y1 = 1*ones(size(t1));                    
y2 = 1*ones(size(t2));                   
y3 = 1*ones(size(t3));                    
y4 = 0*ones(size(t4));                    
y5 = 0*ones(size(t5));                   
y6 = 1*ones(size(t6));                   
y7 = 0*ones(size(t7));                   
y8 = 1*ones(size(t8));                    
y9 = 1*ones(size(t9));                    
y10 = 0*ones(size(t10));                    
y11 = 0*ones(size(t11));

%defining ck
yck = [y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11];

%plot ck
figure(1);
subplot(3,1,1);
plot(t ,yck); 
ylim([-0.5 1.5]);
title("ck signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on; 

%new mapping for ak. 
% 0 matches to 1, 1 matches to -1
y1 = 1*ones(size(t1));                     
y2 = 1*ones(size(t2));                    
y3 = 1*ones(size(t3));                     
y4 = -1*ones(size(t4));                     
y5 = -1*ones(size(t5));                    
y6 = 1*ones(size(t6));                    
y7 = -1*ones(size(t7));                    
y8 = 1*ones(size(t8));                    
y9 = 1*ones(size(t9));                     
y10 = -1*ones(size(t10));                     
y11 = -1*ones(size(t11)); 


yak = [y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11];

%plotting ak
subplot(3,1,2);
plot(t,yak); 
ylim([-1.5 1.5]);
title("ak signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on; 


%since mt and ak are same
ym = yak;

%plotting mt
subplot(3,1,3);
plot(t,ym); 
ylim([-1.5 1.5]);
title("message signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on; 
