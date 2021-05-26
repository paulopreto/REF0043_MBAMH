%%%%%%%%%  RECONSTRUÇÃO 3D %%%%%%%%%%%%%%%%%%   
function [cc3d] = rec3d(DLT, cc2d)

% reconstrução 3d para um ponto
%
%
% cc3d = coordenadas 3d (X,Y,Z) do ponto reconstruido
%
% DLT = matriz com os parametros (L) do dlt de calibração das cameras (c)
% cada linha é relativa a uma camera e as colunas aos parametros 
% L1c1 L2c1 L3c1 ... L11c1
% L1c2 L2c1 L3c2 ... L11c2
%   .    .    .        .
%   .    .    .        .
%   .    .    .        .
% L1cn L2c1 L3cn ... L11cn
%
%
% cc2d = coordenadas de tela (x,y) do ponto a ser recosntruido em cada
% camera. cada linha é relativa a cada camera, coluna 1 coordenada x e
% coluna 2 coordenada y
% xc1 yc1
% xc2 yc2
% xc3 yc3
%  .   .
%  .   .
%  .   .
% xcn ycn

m=length(DLT(:,1));
M=zeros(2*m,3);
N=zeros(2*m,1);
for i=1:m
    M(i*2-1,:)=[(DLT(i,1)-DLT(i,9)*cc2d(i,1)),(DLT(i,2)-DLT(i,10)*cc2d(i,1)),(DLT(i,3)-DLT(i,11)*cc2d(i,1))];
    M(i*2,:)=[(DLT(i,5)-DLT(i,9)*cc2d(i,2)),(DLT(i,6)-DLT(i,10)*cc2d(i,2)),(DLT(i,7)-DLT(i,11)*cc2d(i,2))];
    N((i*2-1):(i*2),1)=cc2d(i,:)'-[DLT(i,4);DLT(i,8)];
end
cc3d = ( inv( (M')*M ) ) * ((M')*N);
end

% %%%%%%%%%  PROJEÇÃO DO PONTO 3D NO PLANO 2D DA CÂMERA %%%%%%%
% function [cc2d]=p2d(DLT,cc3d)
% 
% % projeção de um ponto 3d na imagem 2d da câmera
% % [cc2d]=p2d(DLT,cc3d)
% %
% % cc3d = coordenadas 3d (X,Y,Z) do ponto reconstruido
% %
% % DLT = matriz linha com os parametros (L) do dlt de calibração da camera
% % cada coluna é relativa a um parâmetro de calibração 
% % L1 L2 L3 ... L11
% %
% %
% % cc2d = matriz linha com as coordenadas de tela (x,y) do ponto. 
% % coluna 1 coordenada x e coluna 2 coordenada y
% % [x y]
% 
% cc2d(1,1)=(DLT(1)*cc3d(1)+DLT(2)*cc3d(2)+DLT(3)*cc3d(3)+DLT(4))/(DLT(9)*cc3d(1)+DLT(10)*cc3d(2)+DLT(11)*cc3d(3)+1);
% cc2d(1,2)=(DLT(5)*cc3d(1)+DLT(6)*cc3d(2)+DLT(7)*cc3d(3)+DLT(8))/(DLT(9)*cc3d(1)+DLT(10)*cc3d(2)+DLT(11)*cc3d(3)+1);
% end