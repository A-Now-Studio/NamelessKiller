global.volume_musica += 0.01
if (global.volume_musica > 1) global.volume_musica = 1

audio_master_gain(global.volume_musica); // Aplica o volume
