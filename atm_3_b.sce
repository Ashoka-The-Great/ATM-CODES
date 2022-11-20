clear 
clc

//Lapse rate using Temperature and Pressure Coordinates
i=2
temp=0

//Defining Constants:
R=8.314
g=9.8065

//Read the data table
d=fscanfMat('C:\Users\HP\Desktop\scilab_exp\atm_data\morning_data.txt')

//Pressure(in hPa) 
p=d(:,1)

//Temperature(in kelvin)
t=d(:,3)+273.15

lnp=log(p)
lnt=log(t)

[n,m]=size(d)
term=zeros(n,1)
dtdz=zeros(n,1)


term(1,1)=(lnt(2,1)-lnt(1,1))/(lnp(2,1)-lnp(1,1))
dtdz(1,1)=(g/R)*term(1,1)
term(n,1)=(lnt(n,1)-lnt(n-1,1))/(lnp(n,1)-lnp(n-1,1))
dtdz(n,1)=(g/R)*term(n,1)

for i=2:n-1
    temp=(lnt(i+1,1)-lnt(i,1))/(lnp(i+1,1)-lnp(i,1))
    term(i,1)=(term(i-1,1)+temp)/2
    dtdz(i,1)=(g/R)*term(i,1)
end

title("Pressure vs Lapse Rate")
plot(dtdz,p)
ylabel("Pressure(in hPa)")
xlabel("Lapse Rate(in kelvin/metre)")
