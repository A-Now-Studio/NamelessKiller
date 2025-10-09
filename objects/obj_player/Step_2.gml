// Pegar camera atual da view
var cam = view_camera[0];

// Posição da camera
var cam_x = x - camera_get_view_width(cam) / 2;
var cam_y = y - camera_get_view_height(cam) / 2;

// Suavização (dando atraso na camera para deixar fluido e imersivo)
var lerp_factor = 0.1; // 0.1 = suave, 1.0 = instantaneo
var new_x = lerp(camera_get_view_x(cam), cam_x, lerp_factor);
var new_y = lerp(camera_get_view_y(cam), cam_y, lerp_factor);

// Atualiza a posição da camera
camera_set_view_pos(cam, new_x, new_y);