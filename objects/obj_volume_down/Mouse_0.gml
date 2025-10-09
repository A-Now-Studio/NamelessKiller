global.volume_musica -= 0.01
if (global.volume_musica < 0) global.volume_musica = 0; // Mínimo de 0%

audio_master_gain(global.volume_musica)