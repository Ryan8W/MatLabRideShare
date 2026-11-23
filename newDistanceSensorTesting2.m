brick.SetColorMode(1,4);

%testing for the autonomous moving for the program



%check the distance
%if it passes, move forward
%keep checking distance
%if it is too close, reverse until it is not too close and then turn (right or left)
%repeat

while 1
    distance = brick.UltrasonicDist(3);
    distanceDetect(brick, distance);
    moveForward(brick, distance);
    pause(1);
    brick.StopAllMotors();
    %distanceDetect(brick, distance);

end

function turnLeft(brick)
    brick.MoveMotor('A',50);
    brick.MoveMotor('B',-50);
    pause(1);
   % distance = newDist(brick, distance);
    %distance = brick.UltrasonicDist(3);
end
function turnRight(brick, distance)
    brick.MoveMotor('A',-50);
    brick.MoveMotor('B',50);
    pause(1);
    brick.StopAllMotors();
    newDist(brick, distance);
    
end
function reverse(brick, distance)
    brick.MoveMotor('AB',-50);
    brick.MoveMotor('AB',-50);
    pause(0.1);
    distanceDetect(brick, distance);
end

function moveForward(brick, distance)
    brick.MoveMotor('AB',-50);
    pause(0.1);
    colorDetect(brick);
    distanceDetect(brick, distance);
end


function distanceDetect = newDist(brick, dist) 
newDist = dist;

bump = brick.TouchPressed(2);

if bump

    turnLeft(brick, distance);

end

while newDist < 30
    brick.StopAllMotors();
    reverse(brick, dist);
    turnRight(brick, distance);
    %turnRight(brick, distance);
    newDist = brick.UltrasonicDist(3);
    %return newDist;
end
end



function detectedColor = colorDetect(brick)
%detectedColor = "";
color = brick.ColorRGB(1);
r = color(1);
g = color(2);
b = color(3);
%previousColor;
if ((r > 200) && (r > g) && (g > b))
    detectedColor = "Yellow";
    disp("yellow");
elseif(b < g && b < r)
    detectedColor = "Brown";
    disp("Brown");
elseif ((r > 1.8*g) && (r > 1.5*b))
    detectedColor = "Red";
    disp("Red");
    colorResponse(detectedColor, brick);
    %previousColor = detectedColor;
elseif((g > 1.5*r) && (g > 1.5*b))
    detectedColor = "Green";
    disp("Green");
    colorResponse(detectedColor, brick);
elseif(b > 1.5*r)
    detectedColor = "Blue";
    disp("Blue");
    colorResponse(detectedColor, brick);
else
    disp("No color recognized");
    detectedColor = "NoColor";
end
end
%prevColor
function colorResponse(color, brick)
if (color == prevColor)
   return;
elseif(color == "Green")
    brick.StopAllMotors();
    brick.beep();
    pause(0.3);
    brick.beep();
    pause(0.3);
    brick.beep();
    brick.MoveMotor('AB',-50);
    pause(1);
elseif(color == "Blue")
    brick.StopAllMotors();
    brick.beep();
    pause(0.3);
    brick.beep();
elseif(color == "Red")
    brick.StopAllMotors();
    pause(2);
    brick.MoveMotor('AB',-50);
    pause(0.1);
end
end