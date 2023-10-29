p1 = [1195, 650, 1];
p2 = [835, 1195, 1];
p3 = [435, 920, 1];
p5 = [1336, 230, 1];
p6 = [845, 875, 1];
p7 = [280, 530, 1];
p8 = [880, 51, 1];

% find the point at infinity on X axis (of the object)

line_p1p5 = cross(p1, p5);
line_p2p6 = cross(p2, p6);
line_p3p7 = cross(p3, p7);

x_ideal_ = [cross(line_p2p6, line_p1p5);
            cross(line_p2p6, line_p3p7);
            cross(line_p1p5, line_p3p7)];
x_ideal_avg = mean(x_ideal_);

line_p1p2 = cross(p1, p2);
line_p5p6 = cross(p5, p6);
line_p7p8 = cross(p7, p8);

% find the point at infinity on Y axis (of the object)

y_ideal_ = [cross(line_p5p6, line_p7p8);
            cross(line_p5p6, line_p1p2);
            cross(line_p1p2, line_p7p8)];

y_ideal_avg = mean(y_ideal_);

% find the X and Y axis (of the object)

x_line = cross(p8, x_ideal_avg);
y_line = cross(p3, y_ideal_avg);

p4 = cross(x_line, y_line);
p4_normalized = round(p4 / p4(3));

disp(p4_normalized);