brick.SetColorMode(1,4);

color = brick.ColorRGB(1);
green = 10;
yellow = 60;
r = color(1);
g = color(2);
b = color(3);
if ((abs(abs(r-g))<=60) && ~(abs(abs(g-b))<=green )) 
    disp("yellow"); %yellow was returning red during the color testing 
    % (10/26/26). what I can suggest for improvements is yellow be
    % determined based off percent values. 
    % 
    % Google AI (what percentage of blue can be present, out of all RGB 
    % values, to ensure that the color will be yellow? "To ensure that an 
    % RGB color is perceived as yellow, the blue component must be kept 
    % very low relative to red and green, typically less than 35% of the 
    % total brightness of the color, and ideally closer to 0% to 15% for a 
    % vibrant, true yellow." so yea. This could possibly influence the
    % other color determining functions.
elseif ((r>g) && (r>b))
    disp("red");
elseif (abs(abs(g-b))<=green)
    disp("green"); 
elseif ((b>r) && (b>g))
    disp("blue"); %blue was returning green during the color testing 
    % (10/26/26)
else
    disp("No color recognized");
end