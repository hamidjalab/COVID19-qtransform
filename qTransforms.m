function D=qTransforms(I,q)
%%%%%%%******Feature extraction***********%%%%%%%%%%%
d=1;
   [rr cc]=size(I);
   for i=1:rr
       for j=1:cc
 J=(I(i,j));
   J=(J+1);
   QQ=uint8(1-q);
   S=double(pi*2*J);
   V=cos(S);
    W=double((2*(((J ^QQ)-1)/QQ))*V);
   M(d)=sqrt(W);
   d=d+1;
       end
   end
   D=sum(M);