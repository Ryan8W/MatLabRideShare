global key
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'uparrow'
            disp('Up arrow pressed');
            brick.MoveMotor('AB',50);
            pause(0.1);

        case 'downarrow'
            disp('down arrow pressed');
            brick.MoveMotor('AB',-50);
            pause(0.1);

        case 'leftarrow'
            disp('left arrow pressed');
            brick.MoveMotor('A',50);
            brick.MoveMotor('B',-50);
            pause(0.1);

        case 'rightarrow'
            disp('right arrow pressed');
            brick.MoveMotor('A',-50);
            brick.MoveMotor('B',50);
            pause(0.1);

        case 0 
            disp('no key pressed');
            brick.StopMotor('AB');

        case 'q'
            break;
    end
end
CloseKeyboard();