
if (window_get_fullscreen()) {
	window_set_fullscreen(false)
	image_index = 0
	display_set_gui_maximize(false)
} else {
	window_set_fullscreen(true)
	image_index = 1
	display_set_gui_maximize(true)
}