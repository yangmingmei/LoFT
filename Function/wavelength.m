function [ L ] = wavelength( T,d )
%Wavelength Calculator - based on period (T) and and depth (d)
% where L = wavelength(T,D)

g=9.81;

L0=(g*T^2)/(2*pi);
guess=L0;
L=(g*T^2)/(2*pi)*tanh((2*pi)*(d/guess));
diff=abs(L-guess);

while diff>0.01
diff=abs(L-guess);
guess=L+(0.5*diff);
L=(g*T^2)/(2*pi)*tanh((2*pi)*(d/guess));

end

end

