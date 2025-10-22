
//========= CONTROLE DO TEMPO GLOBAL ========

// Atualiza timers
if (global.freeze_timer > 0) {
	global.freeze_timer -= 1;
}

if (global.slowmotion_timer > 0) {
	global.slowmotion_timer -= 1;
}

// Define a escala do tempo
if (global.freeze_timer > 0) {
	global.time_scale = 0.05; // quase parado
}
else if (global.slowmotion_timer > 0) {
	global.time_scale = 0.05; //slowmotion ativo
} else {
	// volta suavemente ao normal
	global.time_scale = lerp(global.time_scale, 1.0, 0.1);
}

// === CAMERA FOLLOW ===

// Se o player existir, ele é o alvo
if (instance_exists(obj_player)) {
    global.camera_target = obj_player;
}

// Atualiza posição da camera com suavização
if (global.camera_target != noone) {
    var cam = view_camera[0];
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);

    var target_x = global.camera_target.x - cam_w / 2;
    var target_y = global.camera_target.y - cam_h / 2;

    cam_x = lerp(cam_x, target_x, lerp_factor);
    cam_y = lerp(cam_y, target_y, lerp_factor);

    camera_set_view_pos(cam, cam_x, cam_y);
}

// ===== CONTROLE DE SHAKE =====
if (global.shake > 0) {
	global.shake -= 1;
	var sx = random_range(-1, 1);
	var sy = random_range(-1, 1);
	camera_set_view_pos(cam, cam_x + sx, cam_y + sy);
}

// === DEBUG TEMPORÁRIO ===
draw_set_color(c_white);
draw_text(cam_x + 10, cam_y + 10, 
    "Freeze: " + string(global.freeze_timer) +
    "\nSlowmotion: " + string(global.slowmotion_timer) +
    "\nTime Scale: " + string(global.time_scale)
);

// === TESTE DE TIME SCALE E FREEZE ===

// 1. Congelamento instantâneo (teste do impacto)
if (keyboard_check_pressed(ord("F"))) {
    global.freeze_timer = 10; // 10 frames de freeze (0.16s)
}

// 2. Slowmotion manual
if (keyboard_check_pressed(ord("Q"))) {
    global.slowmotion = !global.slowmotion;
}

// 3. Suavização do slowmotion
if (global.slowmotion) {
    global.time_scale = lerp(global.time_scale, 0.05, 0.1); // entra no slowmotion
} else {
    global.time_scale = lerp(global.time_scale, 1.0, 0.1); // volta ao normal
}

// 4. Contador de freeze
if (global.freeze_timer > 0) {
    global.freeze_timer -= 1;
    global.time_scale = 0; // pausa total durante o freeze
}
