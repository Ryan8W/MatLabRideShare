function Turn(Brick)
    Brick.MoveMotor('A',40);
    Brick.Movemotor('B',-40);
    pause(1);
    Brick.StopMotor('AB');
end