%%% Script for the second case:%%%  f(r) = f0*H(r-r0)clear all;close all;clfclc%%% Choose Polynomial degree for the approximate solution:m = 5;xi = linspace(-1,1,m+1);xr = linspace(0,1,m+1);r = linspace(0,1,100);xx = linspace(-1,1,100);Uh = zeros(1,m+1);%%% Construir les matrices :A = Ak (m);B = B2k (m);%%% conditions aux limites :B(m+1) = 0;for i = 1:m+1  if i==m+1    A(m+1,i) = 1;  else    A(m+1,i) = 0;  endend%%% Trouver la solution approchee:Uh = transpose(A\B);%%% Filling out the approximate solution (for a more continuous look)ph = polyfit(xr,Uh,m);Uhh = polyval(ph,r);%%% La solution exacte:r0 = 0.47;f0 = 94;Uex = zeros(1,length(xi));for i = 1:length(r)%% compute heaviside  if abs(r(i)-r0)<=0.5    heaviside = 1;  else    heaviside = 0;  end    Uex(i) = 47*(r(i)**2-1)*heaviside/2;end %%% Plotting solutions:hold on;plot(xr,Uh,'r .','markersize',10)plot(r,Uhh,'r -.')plot(r,Uex,'b')title("Deuxieme Cas - Second Membre Heaviside", 'fontsize', 12)xlabel("r", 'fontsize', 12)ylabel("U(r) & Uh(r)", 'fontsize', 12)h=legend("Uh*","Uh-smooth","U-exact",'location','southeast')set(h,"fontsize",12)