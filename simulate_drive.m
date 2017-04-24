function [xy_n, p_n] = simulate_drive(xy_o, p_o, theta)
% Simulate driving model
b = 4;
p = p_o * pi / 180;
t = theta * pi / 180;
% xy_n(1) = xy_o(1) + cos(p + t) + sin(t) * sin(p);
% xy_n(2) = xy_o(2) + sin(p + t) - sin(t) * sin(p);
% p_n = p_o - 1 / sin(2 * sin(t) / b);

xy_n(1) = xy_o(1) + cos(p) * cos(t);
xy_n(2) = xy_o(2) + sin(p) * cos(t);
p_n = p_o - theta;