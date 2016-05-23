#!/usr/bin/octave -qf


clear

load 'phi.dat'
dim = size(phi);

##19 bodu

xpoc=zeros(19,2);
xpoc(:,1)=5:5:95;
xpoc(:,2)=98*ones(19,1);

m=0.1 
disp('a=-m*grad(phi)');

maxt=1000;
t=1;



for cit=1:19
x=xpoc(cit,:);
v=zeros(1,2);
clear hist;
t=1;
hist(1,:)=[1 x];

while (x(1)>1 && x(2)>1 && x(1)<dim(1) && x(2)<dim(2) && t<=maxt)
t+=1;

grad=[  phi(round(x(2)),floor(x(1))+1)-phi(round(x(2)),floor(x(1)))  ,   phi(floor(x(2))+1, round(x(1)))-phi(floor(x(2)),round(x(1))) ];
v+=-m*grad;
x+=v;
hist(t,:)=[t x];

endwhile;

save(sprintf("data/naboj%03d.dat",cit), 'hist', '-ascii')

endfor