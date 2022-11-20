clear 
clc

//Lapse Rate using Temperature and Height Coordinates
i=2
temp=0

//Defining Constants:
R=8.314
g=9.8065

//Read the data table
d=fscanfMat('C:\Users\HP\Desktop\scilab_exp\atm_data\morning_data.txt')

//Pressure(in hPa)
p=d(:,1)
//Height(in metre)
z=d(:,2)

//Calculating Temperature at various heights
t=d(:,3)+273.15
[n,m]=size(d)

l_rate=zeros(n,1)
//Lapse Rate 1(Using Forward Difference Method):
l_rate(1,1)=(t(2,1)-t(1,1))/(z(2,1)-z(1,1))
//Lapse Rate n(Using Backward Difference Method):
l_rate(n,1)=(t(n,1)-t(n-1,1))/(z(n,1)-z(n-1,1))

//l_rate between 1 and n(Using Central Difference Method): 
for i=2:n-1
    temp=(t(i+1,1)-t(i,1))/(z(i+1,1)-z(i,1))
    l_rate(i,1)=(l_rate(i-1,1)+temp)/2
end

title("Height vs Lapse Rate")
plot(l_rate,z/1000)
ylabel("Height(in KM)")
xlabel("Lapse Rate(kelvin per kilo-metre)")
