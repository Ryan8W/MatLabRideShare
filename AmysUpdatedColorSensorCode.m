brick.SetColorMode(1,4);

color = brick.ColorRGB(1);

r = color(1);
g = color(2);
b = color(3);

%red should be between 1.2 and 1.4 times greater than green for it to be
%brown
%green should be between 2 and 3 times greater than blue
%red should be between 2.7 and 4 times greater than blue

if(r + g + b < 8)
    disp("No color recognized");
elseif(r >= 1.2*g && r <= 1.4*g && g >= 2*b && g <= 3*b && r >= 2.7*b && r <= 4*b)
     disp("No color recognized");
elseif ((r > 1.45*b) && (g > 1.45*b) && (r < 2*g) && (g < 2*r))
    disp("yellow");
elseif ((r > 1.8*g) && (r > 1.5*b))
    disp("red");
elseif((g > 1.5*r) && (g > 1.5*b))
    disp("green");
elseif(b > 1.5*r)
    disp("blue");
else
    disp("No color recognized");
end