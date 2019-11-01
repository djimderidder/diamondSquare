function [output] = sumRand(x,y,d,S,range)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
r = (2*range*rand)-range;
if S(x-d,y-d)~=0 && S(x-d,y+d)~=0 && S(x+d,y-d)~=0 && S(x+d,y+d)~=0
    output = 1/4*(S(x-d,y-d)+S(x-d,y+d)+S(x+d,y-d)+S(x+d,y+d))+r;
else
    output = 1/3*(S(x-d,y-d)+S(x-d,y+d)+S(x+d,y-d)+S(x+d,y+d))+r;
end
end

