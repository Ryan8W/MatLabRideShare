global key
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'uparrow'
            disp('Up arrow pressed');
            Brick.MoveMotor('AB',50);
            pause(0.1);

        case 'downarrow'
            disp('down arrow pressed');
            Brick.MoveMotor('AB',-50);
            pause(0.1);

        case 'leftarrow'
            disp('left arrow pressed');
            Brick.MoveMotor('A',50);
            Brick.MoveMotor('B',-50);
            pause(0.1);

        case 'rightarrow'
            disp('right arrow pressed');
            Brick.MoveMotor('A',-50);
            Brick.MoveMotor('B',50);
            pause(0.1);

        case 0 
            disp('no key pressed');
            Brick.StopMotor('AB');

        case 'q'
            break;
    end
end
CloseKeyboard();