function main()
% Initialiate
init = [13, 30];

% initial plot
init_plot()

% Create fuzzy controller
f = create_fuzzy_controller();

% Main process
d_xy = [init(1), 2];
d_phi = init(2);
err_x = 99;
err_phi = 99;
draw_arrow(d_xy, d_phi);	% draw initial arrow
while (err_x > 0.5) || (err_phi > 2.5)
    % fuzzy control
    d_theta = evalfis([d_phi, d_xy(1)], f);     
    % simulate drive
    [d_xy, d_phi] = simulate_drive(d_xy, d_phi, d_theta);   
    
    % draw arrow
    draw_arrow(d_xy, d_phi);                    
    
    % update errors
    err_x = abs(d_xy(1) - 10);
    err_phi = abs(d_phi - 90);
end

% output error information
err_x, err_phi


% Draw Arror Function
function draw_arrow(pos, angle)
len = 2;
ra = angle * pi / 180;
p2(1) = pos(1) + len * cos(ra);
p2(2) = pos(2) + len * sin(ra);
arrow(pos, p2, 0.7, 1.5)

% Initial Plot Function
function init_plot()
figure
grid on
%axis equal
axis([0 20 0 20])
set(gca, 'XTick', [0 10 20]);
set(gca, 'YTick', []);
draw_annotation()

% Draw Annotation Function
function draw_annotation()
xa = [.2 .2];
ya = [.9 .75];
annotation('arrow',xa,ya, 'LineWidth', 1.5)
xl = [.28 .28];
yl = [.9 .75];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.36 .36];
yl = [.9 .75];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.28 .36];
yl = [.9 .9];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.28 .36];
yl = [.75 .75];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.27 .27];
yl = [.8 .76];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.37 .37];
yl = [.8 .76];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.27 .29];
yl = [.9 .86];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.35 .37];
yl = [.9 .86];
annotation('line',xl,yl, 'LineWidth', 1.5)