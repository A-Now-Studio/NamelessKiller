
// Fazer os botão do menu main sairem da tela
with(obj_play) { x_target = -sprite_width; }
with(obj_options) { x_target = -sprite_width; }
with(obj_quit) { x_target = -sprite_width; }

// Fazer os obj do options se mover para dentro da tela
obj_fullscreen.x_target = room_width / 50;
obj_back.x_target = room_width / 50;
obj_volume_down.x_target = room_width / 5.8
obj_volume_up.x_target = room_width / 3
obj_volume_display.x_target = room_width / 4.5
obj_volume_text.x_target = room_width / 50

