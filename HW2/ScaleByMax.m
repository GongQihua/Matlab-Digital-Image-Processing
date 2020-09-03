function [output]=ScaleByMax(img)
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
Rmax=max(max(R));
Gmax=max(max(G));
Bmax=max(max(B));

Cmax=min([Rmax,Gmax,Bmax]);

% calculate the pix,which larger than Cmax
Nr=sum(R(:)>=Cmax);
Ng=sum(G(:)>=Cmax);
Nb=sum(B(:)>=Cmax);

% find the largest N for Nr Ng Nb
Nmax=max([Nr,Ng,Nb]);

% for each of the find the number of element which is larger than Rmax;
for pix=Rmax:-1:0  % R
    Lr=R>=pix; 
    nr=sum(Lr(:));
    if nr>=Nmax
        Rth=pix;
        break
    end
end

for pix=Gmax:-1:0   % G
    Lr=G>=pix;
    nr=sum(Lr(:));
    if nr>=Nmax
        Gth=pix;
        break
    end
end

for pix=Bmax:-1:0 % B
    Lr=B>=pix;
    nr=sum(Lr(:));
    if nr>=Nmax
        Bth=pix;
        break
    end
end
result(:,:,1) = Cmax/Rth*R;
result(:,:,2) = Cmax/Gth*G;
result(:,:,3) = Cmax/Bth*B;
[output] = result;