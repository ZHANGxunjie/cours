function [A,G] = Ak (m)
    A = zeros (m+1);
    [xi,N,dN]=forme (m);
    G = zeros( 1 , length(xi) );
    for i = 1: (m+1)
      for j = 1: (m+1)
        for q = 1: m+1
          G(q) = (xi(q)+1)*dN(i,q)*dN(j,q)
        end
        
        A(i,j)=trapz(xi,G)
      end
    end
endfunction