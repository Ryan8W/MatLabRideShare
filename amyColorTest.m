brick.SetColorMode(1,4);

color = brick.ColorRGB(1);
green = 10;
yellow = 60;
r = color(1);
g = color(2);
b = color(3);

if (r > g && r > b)
    disp("red");
elseif(g>r && g>b)
    disp("green");
elseif(r > b && g > b)
    disp("yelllow");
elseif(b > r && b > g)
    disp("blue");
else
    disp("No color recognized");
end 