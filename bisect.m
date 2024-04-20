%bisection method
clear all
close all
tic

a=1.0; %left boundary of the interval
b=2.0; %right boundary of the interval

tol = 1e-6; %tolerance
Nmax = 100; %max number of iterations

f=@(x) x^6-x-1; %function for which we want to find a zero

i = 1; %initialize iteration counter
success = 0; %until we converge success = 0

while (i<=Nmax) && (success==0) %while the max number of iterations is not reached and success is 0
    midpoint=(a+b)/2; %set midpoint
    mid(i)=midpoint; %save current midpoint in a vector
    fmid = f(midpoint); %find the value of f at midpoint
    if (abs(fmid)<tol) %if tolerance is reached, set success=1
        success = 1;
    else
        i=i+1; %else increase iteration number
        fa=f(a); %compute f at left boundary of current interval
        if (sign(fa)*sign(fmid)<0) %update the interval based on sign of f(a)*f(mid)
            b=midpoint;
        else
            a=midpoint;
        end
    end
end

if (success == 1)
    disp('success!');
else
    disp('did not converge');
end

i %print number of iterations needed to converge
format long
display(midpoint) %print approximated solution
toc

tic
format long
numericalsolution=fzero(@(x) x^6-x-1,1.0) %use fzero to find the "exact" numerical solution
toc

