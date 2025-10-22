//======MOVIMENTAÇÃO=======
hspd = 0;
vspd = 0;
move_speed = 3;
jump_speed = -8;
gravity = 0.5;
max_fall = 10;

//======ROLL======
isRolling = false;
roll_timer = 0;
roll_speed = 5; //velocidade do impulso
roll_duration = 24; //frames (0.4s a 60 fps)

//======ATTACK=====
attack_lock = 0; //impede ações enquanto >0
attack_cooldown = 0; //impede iniciar novo ataque enquanto >0
attack_lock_duration = 10; //frames
attack_cooldown_duration = 20; //frames
