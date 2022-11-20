// Plot the data points on scilab using height expressed as a function of pressure and compare the calculated and given data curve.
clc
clear

R=287.04
g=9.8065

D=fscanfMat("C:\Users\HP\Desktop\scilab_exp\atm_data\morning_data.txt")
p=D(:,1)
t=D(:,3)
t=t+273.15
h=D(:,2)

Z=-1*(((R*t)/g).*log(p/1013))
disp("Height (in Km):",Z/1000)

title("Height Expressed as a Function of Pressure")
xlabel("Pressure(in hPa)")
ylabel("Height(in Km)")
plot(p,Z/1000)
plot(p,h/1000,'-r')
legend(['Calculated Curve','Theoretical Curve'],1)
