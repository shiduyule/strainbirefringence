%% dd
clear;clc;
 
[x,y] = meshgrid(0:0.1:10,0:0.1:10);  % x,y form matrix

fimplicit(f)
mesh(x,y,z);
xlabel('x');
ylabel('y');
zlabel('z');

%% 这是折射率xy 平面
no = 1.511; ne = 1.470;
beta11 = 1/no^2; % 主轴折射率
beta22 = 1/no^2; % 主轴折射率
p66 = -0.064;    % 应变弹光系数
S21 = 7.50995;   % 设定的应变大小 唯一的输入变量
%S21 = linspace(0,0.00008,40000);
beta21 = p66.*S21; 
f = @(x,y) beta11*x.^2 + 100 * beta22 *y.^2  + 2*beta21*x.*y - 1;
fimplicit(f)
xlabel('nx');
ylabel('ny'); 
%title('理想状态下的折射率xy平面');
title('存在σ21下的折射率xy平面');
axis equal