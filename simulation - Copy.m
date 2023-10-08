% initialis variables

b =  1 ;
g = 9.81;
k = 1 ;
c =1 ;
x=1;
s=tf('s');

figure;

subplot(3,1,1)
title('G(s)');
G_s = (1/(s+b));
step(G_s);

%subplot(3,1,2)
%title('open loop');
%G_open_loop = (k*c-9.81/s)* G_s;
%step(G_open_loop);

%subplot(3,1,2)
%title('close loop position');
%G_open_loop = (1/s)*(((k*c)*G_s )/(1+(k*c)*G_s/s));
%step(G_open_loop);

%subplot(3,1,3)
%title('close loop velocity');
%G_open_loop = ((k*c)*G_s )/(1+(k*c)*G_s/s);
%step(G_open_loop);


%figure;

%G_v = ((G_s*1/s) / (1+c*G_s*(1/s)*k)) ;

%t = 1:0.1:100;

%[y_v, ~] = step(G_v, t);


%y_v = y_v * g;


%[y_cl, ~] = step(G_open_loop, t);

%y_cl = y_cl * x;

%y = y_cl + y_v;
%plot(t, y);
%title("G_o_u_t(s)");

