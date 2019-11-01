function [surface] = diamondSquare(n,h,irange)
%Diamond square method
%   Detailed explanation goes here
    N=(2^n)+1;
    S = ones((2*N)-1,(2*N)-1);
    for i=1:N
        for j=1:N
            x=(N-1)/2+i;
            y=(N-1)/2+j;
            S(x,y)= 1;
        end
    end
    e = ((N-1)/2)+1;
    range = irange;
    for i=1:n
        x = 2^(n-i+1);
        d = 2^(n-i);
        for j=1:2^(i-1)
            for k=1:2^(i-1)
                x1 = ((j-1)*x)+e;
                y1 = ((k-1)*x)+e;
                S(x1+d,y1+d) = sumRand(x1+d,y1+d,d,S,range);
                if S(x1+d,y1)==1
                    S(x1+d,y1) = sumRand(x1+d,y1,d,S,range);
                end
                if S(x1+d,y1+x)==1
                    S(x1+d,y1+x) = sumRand(x1+d,y1+x,d,S,range);
                end
                if S(x1,y1+d)==1
                    S(x1,y1+d) = sumRand(x1,y1+d,d,S,range);
                end
                if S(x1+x,y1+d)==1
                    S(x1+x,y1+d) = sumRand(x1+x,y1+d,d,S,range);
                end
            end
        end
        range = range*h*2^(-h);
    end

    surface = S(e:N+e-1,e:N+e-1);
    figure()
    surf(surface)
    axis([0 size(surface,1) 0 size(surface,1) -size(surface,1) size(surface,1)])
    title(['n = ',num2str(n),'; h = ',num2str(h)])
