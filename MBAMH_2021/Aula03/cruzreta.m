function [cr] = cruzreta(c1, p1, c2, p2)
% % % ? reta r: y = a1x + b1
% % % ? reta s: y = a2x + b2
% % % ? o ponto de intersecao por exemplo quando yr = ys
% % % ? yr = ys
% % % ? a1x + b1 = a2x + b2
% % % ? (a1 - a2)x = (b2 - b1)
% % % ? x = (b2 - b1)/(a1 - a2)
% % % ? y = a1x + b1 = a1( (b2 - b1)/(a1 - a2) ) + b1
% % % ? y = (a1.b2 - b1.a2)(a1 - a2)
% function [cr] = cruzreta(xc1,yc1,xp1,yp1,xc2,yc2,xp2,yp2)

if nargin == 0;
    c1 = [2.1, 1.2];
    c2 = [1.2, 2.1];
    p1 = [0.1, 1.2];
    p2 = [1.3, 0.];
end

xc1 = c1(1); yc1 = c1(2);
xp1 = p1(1); yp1 = p1(2);

xc2 = c2(1); yc2 = c2(2);
xp2 = p2(1); yp2 = p2(2);

% c1 = [xc1,yc1];
% p1 = [xp1,yp1];
% c2 = [xc2,yc2];
% p2 = [xp2,yp2];

r1 = [c1; p1];
r2 = [c2; p2];

horiz = input('nome do eixo na horizontal:   ','s');
vert = input('nome do eixo vertical:   ','s');

mr1 = (yp1 - yc1) / (xp1 - xc1) % coeficiente angular de r1
mr2 = (yp2 - yc2) / (xp2 - xc2) % coeficiente angular de r2

br1 = -1 * (mr1 * xc1 - yc1) % coeficiente linear de r1
br2 = -1 * (mr2 * xc2 - yc2) % coeficiente linear de r2

% br1 = yc1 - mr1*xc1 % coeficiente linear de r1
% br2 = yc2 - mr2*xc2 % coeficiente linear de r2


% y - yc1 = mr1(x - xc1) equa�ao da reta 1
% y - yc2 = mr2(x - xc2) equa�ao da reta 2


x = (-(mr2*xc2) + yc2 + (mr1*xc1) - yc1) / (mr1 - mr2); % x do cruzamento

y = (mr1*x)  - (mr1*xc1) + yc1; % y do cruzamento

 

figure
grid on
plot(r1(:,1),r1(:,2),r2(:,1),r2(:,2))
grid on
xlabel(horiz)
ylabel(vert)
legend('r1','r2')
%[x,y]=ginput(1);
hold on
plot(x,y,'+r')
%pause

cr=[x,y];
disp(cr)

