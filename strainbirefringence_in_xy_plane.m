%% 这是折射率xy 平面
no = 1.511; ne = 1.470;
beta11 = 1/no^2; % 主轴折射率
beta22 = 1/no^2; % 主轴折射率
p66 = -0.064;    % 应变弹光系数
q66 = -10.5*10^14
S21 = 3.38;   % 设定的应变大小 唯一的输入变量   应变0.38 对应光轴倾角 84度
S21 = linspace(-0.002,0.002,40000);
sigma21 = 15
deltabeta21 = p66.*S21; 
%deltabeta21 = q66 .* sigma21
f = @(x,y) beta11*x.^2 + beta22 *y.^2  + 2*deltabeta21*x.*y - 1;
fimplicit(f)
xlabel('nx');
ylabel('ny');
%title('理想状态下的折射率xy平面');
title('存在σ21下的折射率xy平面');
axis equal

%% 计算椭圆主值  P206
beta11 = beta11 + deltabeta21;  % beta11 是应力施加后的长轴介电隔离率
beta22 = beta11 - deltabeta21;  % beta22 是应力施加后的短轴介电隔离率
n11 = beta11.^(-1/2);    % 折射率 n11 
n22 = beta22.^(-1/2);    % 折射率 n22 

%% 计算光轴倾角 正光性双轴晶  P133
x = ((n22.^2 - n11.^2)/(ne^2 - n22.^2)).^(1/2);
omega = atan(ne*((n22.^2 - n11.^2)./(ne^2 - n22.^2)).^(1/2)./n11);   % 按照晶体物理计算的光轴倾角
theta = 180*omega/ pi;   % 弧度制转为角度制
%fprintf('n11=%f n22=%f ne=%f \n应变是%f\n光轴倾角是%f',n11,n22,ne,S21,theta);

plot(S21,theta);
%plot(theta,S21);
title( "应变和光轴倾角之间的关系" );
xlabel( 'S21' );
ylabel( 'theta' );
grid on