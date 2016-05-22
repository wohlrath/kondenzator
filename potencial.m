#!/usr/bin/octave -qf




##kondenzator potencial

clear

##cislovani bodu
## 3 6 9
## 2 5 8
## 1 4 7

global dimx=100; 
global dimy=100;

A = zeros(dimx*dimy,dimx*dimy);
b = zeros(dimx*dimy,1);

##okrajovy podminky
##
##

for x = 2:(dimx-1) ##horni, dolni okraj
A((x-1)*dimy+1,(x-1)*dimy+1)=1;  ##spodni deska
b((x-1)*dimy+1)=0;

A(x*dimy,x*dimy)=1;  ##horni deska
b(x*dimy)=1;
endfor;

for y = 1:dimy ##levej, pravej okraj
A(y,y)=1; ##levej okraj
A(y,y+dimy)=-1;
b(y)=0;

A((dimx-1)*dimy+y,(dimx-1)*dimy+y)=1; ##pravej okraj
A((dimx-1)*dimy+y,(dimx-2)*dimy+y)=-1;
b((dimx-1)*dimy+y)=0;
endfor;

##vnitrek

for x=1:(dimx-2)
for y=2:(dimy-1)
A(x*dimy+y,x*dimy+y)=4;
A(x*dimy+y,x*dimy+y+1)=-1;
A(x*dimy+y,x*dimy+y-1)=-1;
A(x*dimy+y,(x+1)*dimy+y)=-1;
A(x*dimy+y,(x-1)*dimy+y)=-1;
b(x*dimy+y)=0;
endfor;
endfor;


##strom
##v pulce do tretiny


x=floor((dimx-1)/2);
for y=2:floor((dimy)/2)
for cit=1:(dimx*dimy)
	A(x*dimy+y,cit)=0; ##vymazat radek
endfor;
A(x*dimy+y,x*dimy+y)=1;
b(x*dimy+y)=0;
endfor;


##reseni
##
##

phi=reshape(A\b,dimx,dimy);

save -ascii 'phi.dat' phi



##graf

imagesc(phi);