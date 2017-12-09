close all;
clear;

% リンク1の回転軸から重心までの長さ (m)
lg1 = 1.2;
% リンク1の回転軸から先端までの長さ (m)
l1 = 2.0;
% リンク2の回転軸から重心までの長さ (m)
lg2 = 0.5;
% リンク2の回転軸から先端までの長さ (m)
l2 = 1.0;

% リンク1の質量 (kg)
m1 = 1.0;
% リンク2の質量 (kg)
m2 = 1.0;
% リンク1の慣性モーメント (kg.m^2)
J1 = 1.0;
% リンク2の慣性モーメント (kg.m^2)
J2 = 1.0;

% 重力加速度 (N/m^2)
g = 9.8;

sim( 'DoublePendulum' );

%% 描画

figure(1); hold on;
x_pre = l1 * sin( MaximaOut(1,2) ) + l2 * sin( MaximaOut(1,2) + MaximaOut(1,3) );
y_pre = l1 * cos( MaximaOut(1,2) ) + l2 * cos( MaximaOut(1,2) + MaximaOut(1,3) );

for cnt = 1:length( MaximaOut )
%     clf;
    th1 = MaximaOut(cnt,2);
    th2 = MaximaOut(cnt,3);
    
    x = [
        0;    
        l1 * sin( th1 );
        l1 * sin( th1 ) + l2 * sin( th1 + th2 );
    ];

    y = [
        0;    
        l1 * cos( th1 );
        l1 * cos( th1 ) + l2 * cos( th1 + th2 );
    ];

    plot( x, y, 'Color', [ 0, 0, 0 ] ); hold on;
    scatter( x, y, 'MarkerFaceColor', [ 0, 0, 0 ], 'MarkerEdgeColor', [ 0, 0, 0 ] );
    
    plot( [ x_pre;x(3); ], [ y_pre;y(3); ], 'Color', [ 1, 0, 0 ] );
    x_pre = x(3);
    y_pre = y(3);
    
    axis equal;
    axis( [ -3, 3, -3, 3 ] );
    pause( 0.1 );
end