%milestone 2 testing
%This is the script dedicated toward the 
% Milestone 2 Completion

global key
InitKeyboard();

brick.SetColorMode(1,4);
color = brick.ColorRGB(1);
red = color(1);
green = color(2);
blue = color(3);

while 1
    pause(0.1);
    switch key
        case 'uparrow'
            disp('Up arrow pressed');
            brick.MoveMotor('AB',-50);
            pause(0.1);
            colorDetect(brick);
        case 'downarrow'
            disp('down arrow pressed');
            brick.MoveMotor('AB',50);
            pause(0.1);
            colorDetect(brick);
        case 'leftarrow'
            disp('left arrow pressed');
            brick.MoveMotor('A',-50);
            brick.MoveMotor('B',50);
            pause(0.1);
            colorDetect(brick);
        case 'rightarrow'
            disp('right arrow pressed');
            brick.MoveMotor('A',50);
            brick.MoveMotor('B',-50);
            pause(0.1);
            colorDetect(brick);
        case 0 
            brick.StopMotor('AB');
        case 'q'
            break;
    end
end
CloseKeyboard();

function detectedColor = colorDetect(brick)
%detectedColor = "";
color = brick.ColorRGB(1);
r = color(1);
g = color(2);
b = color(3);

if ((r > 200) && (r > g) && (g > b))
    detectedColor = "Yellow";
    disp("yellow");
    colorResponse(detectedColor, brick);
elseif(b < g && b < r)
    detectedColor = "Brown";
    disp("Brown");
elseif ((r > 1.8*g) && (r > 1.5*b))
    detectedColor = "Red";
    disp("Red");
    colorResponse(detectedColor, brick);
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

if(color == "Green")
    brick.StopAllMotors();
    brick.beep();
    pause(0.3);
    brick.beep();
    pause(0.3);
    brick.beep();
    brick.MoveMotor('AB',-50);
    pause(1);

end
if(color == "Blue")
    brick.StopAllMotors();
    brick.beep();
    pause(0.3);
    brick.beep();
end
if(color == "Red")
    brick.StopAllMotors('Coast');
    pause(2);
    brick.MoveMotor('AB',-50);
    pause(0.1);


end
end