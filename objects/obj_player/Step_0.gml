var dir = keyboard_check(ord("D")) - keyboard_check(ord("A"));
hspd = dir * move_speed;

vspd = min(vspd + gravity, max_fall);

if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, obj_solid))
    vspd = jump_speed;

/////////Movimento horizontal////////
if (place_meeting(x + hspd, y, obj_solid)) {
    while (!place_meeting(x + sign(hspd), y, obj_solid))
        x += sign(hspd);
    hspd = 0;
}
x += hspd;

///////DIREÇÃO VISUAL///////
if (hspd != 0) {
	image_xscale = sign(hspd);
}

////////Movimento vertical//////
if (place_meeting(x, y + vspd, obj_solid)) {
    while (!place_meeting(x, y + sign(vspd), obj_solid))
        y += sign(vspd);
    vspd = 0;
}
y += vspd;

////////ATAQUE/////////
if (keyboard_check_pressed(ord("K"))) {
	var atk_dir = image_xscale;
	var offset_x = 16 * atk_dir;
	var offset_y = 0;
	
	instance_create_layer(x + offset_x, y + offset_y, layer, obj_katana_hitbox)
}