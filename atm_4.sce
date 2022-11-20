
// Find the potential temperature

clc
clear

//Reading the Text File
D=fscanfMat("C:\Users\HP\Desktop\scilab_exp\atm_data\morning_data.txt")

pres=D(:,1) //Presuure(in hPa) Data
h=D(:,2)    //Height Data(in metres)
temp=D(:,3)+273.15 //Temperature Data(in kelvin))
theta_g=D(:,9) //Given Potential Temperature(in kelvin)
p0=1013
c=0.281

[n,m]=size(pres)
theta_c=zeros(n,1)

pres1=pres./p0
pres2=pres1.^c
theta_c=temp./pres2

disp("Calculated Values:",theta_c,"Data-Based Values:",theta_g)
plot(theta_c,h/1000)
plot(theta_g,h/1000,'-r')
xlabel("Potential Temperature (in Kelvin)")
ylabel("Height (in KM)")
legend(['Calculated Curve';'Data-Based Curve'],2)
