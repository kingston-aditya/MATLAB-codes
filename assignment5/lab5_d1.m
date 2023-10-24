% question1(d)
clc;
close all;

Tb = .001;

% defining ck
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
t_1 = [t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11];

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

%plot of ck
figure(1);
subplot(3,1,1);
plot(t_1 ,yck); 
ylim([-1.5 1.5]);
title("ck");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on; 

% defining ak
Tb = .0005;

% defining time
t1 = 0:Tb/999:Tb;
t010 = 1*Tb:Tb/999:2*Tb;
t2 = 2*Tb:Tb/1999:3*Tb;
t20 = 3*Tb:Tb/999:4*Tb;
t3 = 4*Tb:Tb/1999:5*Tb;
t30 = 5*Tb:Tb/999:6*Tb;
t4 = 6*Tb:Tb/1999:7*Tb;
t40 = 7*Tb:Tb/999:8*Tb;
t5 = 8*Tb:Tb/1999:9*Tb;
t50 = 9*Tb:Tb/999:10*Tb;
t6 = 10*Tb:Tb/1999:11*Tb;
t60 = 11*Tb:Tb/999:12*Tb;
t7 = 12*Tb:Tb/1999:13*Tb;
t70 = 13*Tb:Tb/999:14*Tb;
t8 = 14*Tb:Tb/1999:15*Tb;
t80 = 15*Tb:Tb/999:16*Tb;
t9 = 16*Tb:Tb/1999:17*Tb;
t90 = 17*Tb:Tb/999:18*Tb;
t10 = 18*Tb:Tb/999:19*Tb;
tA0 = 19*Tb:Tb/1999:20*Tb;
t11 = 20*Tb:Tb/1999:21*Tb;
tB0 = 21*Tb:Tb/999:22*Tb;

%defining time 
t_2 = [t1 t010 t2 t20 t3 t30 t4 t40 t5 t50 t6 t60 t7 t70 t8 t80 t9 t90 t10 tA0 t11 tB0];

%defining ak
y1 = 1*ones(size(t1));             
Y10 = zeros(size(t010));
y2 = 0*ones(size(t2));                
Y20 = zeros(size(t20));
y3 = 1*ones(size(t3));                 
Y30 = zeros(size(t30));
y4 = 0*ones(size(t4));                 
Y40 = zeros(size(t40));
y5 = 0*ones(size(t5));              
Y50 = zeros(size(t50));
y6 = 0*ones(size(t6));                
Y60 = zeros(size(t60));
y7 = 0*ones(size(t7));               
Y70 = zeros(size(t70));
y8 = 0*ones(size(t8));                
Y80 = zeros(size(t80));
y9 = 1*ones(size(t9));                 
Y90 = zeros(size(t90));
y10 = 0*ones(size(t10));              
YA0 = zeros(size(tA0));
y11 = 0*ones(size(t11));               
YB0 = zeros(size(tB0));

%defining ak 
yak = [y1 Y10 y2 Y20 y3 Y30 y4 Y40 y5 Y50 y6 Y60 y7 Y70 y8 Y80 y9 Y90 y10 YA0 y11 YB0];

%plotting of ak
subplot(3,1,2);
plot(t_2 ,yak); 
ylim([-1.5 1.5]);
title("ak");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on;

% since ak = ym
ym = yak;
subplot(3,1,3);
plot(t_2 ,ym); 
ylim([-1.5 1.5]);
title("message signal");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on;

