brick.SetColorMode(1,4);

color = brick.ColorRGB(1);
green = 10;
yellow = 60;
r = color(1);
g = color(2);
b = color(3);
if ((abs(abs(r-g))<=60) && ~(abs(abs(g-b))<=green ))
    disp("yellow");
elseif ((r>g) && (r>b))
    disp("red");
elseif (abs(abs(g-b))<=green)
    disp("green");
elseif ((b>r) && (b>g))
    disp("blue");
else
    disp("No color recognized");
end