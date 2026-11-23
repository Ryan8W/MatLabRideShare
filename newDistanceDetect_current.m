brick.SetColorMode(1,4);

RTurnRange = 20; %replace with whatever dist is the min to be able to turn
prevbumps = 0;

while 1

    distance = brick.UltrasonicDist(3);
    bump = brick.TouchPressed(2);
    if (distance>=RTurnRange)
        turnRight(brick);
    elseif (bump > prevbumps)
        turnLeft(brick);
        prevbumps = bump;
    end
    brick.MoveMotor('AB',-50);
    %brick.MoveMotor('B',-50);
    pause(0.5); %adjust time if the if-else statement is slow to run
    brick.StopAllMotors();
    colorDetect(brick);

end

function turnLeft(brick)
    brick.MoveMotor('AB', 50);
    pause(1);
    brick.MoveMotor('A',-40);
    brick.MoveMotor('B',40);
    pause(1);
   
end

function turnRight(brick)
    brick.MoveMotor('A',40);
    brick.MoveMotor('B',-40);
    pause(1);
    brick.MoveMotor('AB', -50);
    pause(2);
    brick.StopAllMotors();
   
end



function detectedColor = colorDetect(brick)
%detectedColor = "";
color = brick.ColorRGB(1);
r = color(1);
g = color(2);
b = color(3);

if ((r > 200) && (r > g) && (g > b))
    detectedColor = "Yellow";
    disp("Yellow");
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