
if (global.freeze_timer > 0) exit; // pausa total

// ===== TIME SCALE GLOBAL ======
var ts = global.time_scale;

// =======TIMERS ATTACK=======
if (attack_lock > 0) attack_lock -= 1 * ts;
if (attack_cooldown > 0) attack_cooldown -= 1 * ts;

// ======= ATTACK ==========
if (keyboard_check_pressed(ord("K")) && attack_cooldown <= 0 && !isRolling) {
	// bloquear ações por attack_lock_duration frames
	attack_lock = attack_lock_duration;
	// aplica cooldown
	attack_cooldown = attack_cooldown_duration;
	
	// difine direção e offsets(ajustar conforme sprite)
	var atk_dir = image_xscale // = -1 ou 1
	var offset_x = 20 * atk_dir;
	var offset_y = 0;
	
	//cria hitbox na layer do player
	var hb = instance_create_layer(x + offset_x, y + offset_y, layer, obj_katana_hitbox);
	var hbs = instance_create_layer(x + offset_x, y + offset_y, layer, obj_slash_effect);

	with (hb) {
		life = 4;		//vida curta para durar pouco tempo
		damage = 1;
		owner = id;		//opcional, é referencia de quem atacou
		image_xscale = atk_dir;
	}
	with (hbs) {
		life = 6;		//vida curta para durar pouco tempo
		damage = 1;
		owner = id;		//opcional, é referencia de quem atacou
		image_xscale = atk_dir;
	}
}
		

//======= INPUT ROLL ==========
if (!isRolling && place_meeting(x, y + 1, obj_solid)) {
	var dir_input = 0;
	
	if (keyboard_check(vk_shift)) {
		if (keyboard_check(ord("A"))) dir_input = -1;
		if (keyboard_check(ord("D"))) dir_input = 1;
	}
	
	if (dir_input != 0) {
			isRolling = true;
			roll_timer = roll_duration;
			image_xscale = dir_input;
			hspd = dir_input * roll_speed;
			vspd = 0;
	}
}

// ======= COMPORTAMENTO DURANTE O ROLL ========
if (isRolling) {
	roll_timer -= 1 * ts;

	// Movimento com colisão
	if (!place_meeting(x + hspd, y, obj_solid)) {
		x += hspd;
	} else {
		// Cancela se bater na parede
		isRolling = false;
		hspd = 0;
	}
	//Fim do Roll
	if (roll_timer <= 0) {
		isRolling = false;
		hspd = 0;
	}
	
	//Cancela input normal enquanto rola
	exit;
}

//==========INPUT MOVIMENTAÇÃO=========
var dir = keyboard_check(ord("D")) - keyboard_check(ord("A"));
hspd = dir * move_speed;

vspd = min(vspd + gravity * ts, max_fall);

if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, obj_solid))
    vspd = jump_speed * ts;

/////////Movimento horizontal////////
if (place_meeting(x + hspd * ts, y, obj_solid)) {
    while (!place_meeting(x + sign(hspd) * ts, y, obj_solid))
        x += sign(hspd) * ts;
    hspd = 0;
}
x += hspd * ts;

///////DIREÇÃO VISUAL///////
if (hspd != 0) {
	image_xscale = sign(hspd);
}

////////Movimento vertical//////
if (place_meeting(x, y + vspd * ts, obj_solid)) {
    while (!place_meeting(x, y + sign(vspd) * ts, obj_solid))
        y += sign(vspd) * ts;
    vspd = 0;
}
y += vspd * ts;