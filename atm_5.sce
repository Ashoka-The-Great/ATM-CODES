// Plot the graph between brunt vaisala frequency and height

clc
clear

g=9.8065
p0=1013
c=0.281

data=fscanfMat("C:\Users\HP\Desktop\scilab_exp\atm_data\morning_data.txt")

p=data(:,1)//Pressure
z=data(:,2)//Height
t=data(:,3)//Temperature(In kelvin)
tc=t+273.15//Temperature(In degree celsius)


[n,m]=size(p)
theta=zeros(n,1)    //For Calculated Potential Temperature

p1=p./p0
p2=p.^c
theta=tc./p2        //Potential Temperature

//For dp/dz
presgrad=zeros(n,1)
presgrad(1,1)=(p(2,1)-p(1,1))/(z(2,1)-z(1,1))
presgrad(n,1)=(p(n,1)-p(n-1,1))/(z(n,1)-z(n-1,1))

for i=2:n
    presgrad(i,1)=(p(i,1)-p(i-1,1))/(z(i,1)-z(i-1,1))
end

//For dtheta/dp
dthetadp=zeros(n,1)
dthetadp(1,1)=(theta(2,1)-theta(1,1))/(p(2,1)-p(1,1))
dthetadp(n,1)=(theta(n,1)-theta(n-1,1))/(p(n,1)-p(n-1,1))

for i=2:n
    dthetadp(i,1)=(theta(i,1)-theta(i-1,1))/(p(i,1)-p(i-1,1))
end

dthetadz=presgrad.*dthetadp

temp1=(theta).^(-1)
temp=g.*temp1
N2=temp.*dthetadz

disp(N2)
plot(N2,z/1000)
xlabel("Brunt-Vaisala Frequency")
ylabel("Height(in KM)")
