// Troca de frame
if (window_get_fullscreen()) {
	image_index = 1
} else {
	image_index = 0
}

x_start = room_width; // Começa fora da tela
x_target = -room_width; // Posição final (centro da tela)
move_speed = 3;