%%%%%%%%%  DLT 3D %%%%%%%%%%%%%%%%%%%%
% calcula os parametros do DLT
%
% para execut�-la, digite o comando abaixo
% [DLT]=camera_calibration(cp3d,cd2d)
% onde:
% DLT  = vetor linha com os parametros do DLT calculados
% [L1,L2,L3...L16]
%
% cp3d = matriz retangular com as coordenadas 3d (X,Y,Z) dos pontos (p) do
% calibrador
% Xp1 Yp1 Zp1
% Xp2 Yp2 Zp2
% Xp3 Yp3 Zp3
%  .   .   .
%  .   .   .
% Xpn Ypn Zpn
%
% cp2d = matriz retangular com as coordenadas de tela (x,y) dos pontos (p)
% do calibrador
% xp1 yp1
% xp2 yp2
% xp3 yp3
%  .   .
%  .   .
% xpn ypn
%
function [DLT] = DLT_calibration(cp3d,cp2d)

m=size(cp3d(:,1),1);
M=zeros(m*2,11);
N=zeros(m*2,1);
for i=1:m
    M(i*2-1,:)=[cp3d(i,1),cp3d(i,2),cp3d(i,3),1,0,0,0,0,-cp2d(i,1)*cp3d(i,1),-cp2d(i,1)*cp3d(i,2),-cp2d(i,1)*cp3d(i,3)];
    M(i*2,:)=[0,0,0,0,cp3d(i,1),cp3d(i,2),cp3d(i,3),1,-cp2d(i,2)*cp3d(i,1),-cp2d(i,2)*cp3d(i,2),-cp2d(i,2)*cp3d(i,3)];
    N((i*2-1):(i*2),1)=cp2d(i,:)';
end
DLT=(( inv( (M')*M ) ) * ((M')*N))';
end

