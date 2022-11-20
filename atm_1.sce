// Radiosonde data and its interpretation in terms of atmospheric parameters using verticle profiles in different regions of the globe.

clear;
clc;
data00=fscanfMat('C:\Users\HP\Desktop\scilab_exp\atm_data\morning_data.txt')
data12=fscanfMat('C:\Users\HP\Desktop\scilab_exp\atm_data\evening_data.txt')

p00=data00(:,1);
h00=data00(:,2);
t00=data00(:,3);
lnp00=log(p00);

p12=data12(:,1);
h12=data12(:,2);
t12=data12(:,3);
lnp12=log(p12);

subplot(2,2,1);
plot(h00,p00);
plot(h12,p12,'-r');
title('Geopotential height vs Atmospheric Presure');
xlabel('Atmospheric Pressure');
ylabel('Geopotential height');

subplot(2,2,2);
plot(h00,t00);
plot(h12,t12,'-r');
title('Geopotential height vs Temperature');
xlabel('Temperature');
ylabel('Geopotential height');

subplot(2,2,3);
plot(p00,t00);
plot(p12,t12,'-r');
title('Atmospheric Pressure vs Temperature');
xlabel('Temperature');
ylabel('Atmospheric Presure');

subplot(2,2,4);
plot(lnp00,t00);
plot(lnp12,t12,'-r');
title('log(Presure) vs Temperature');
xlabel('Temperature');
ylabel('log(Presure)');
