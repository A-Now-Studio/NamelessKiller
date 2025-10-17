

//decrementa vida
life -= 1;
if (life <= 0) {
	instance_destroy();
	exit; //garante saída imediata
}

// verifica colisão com inimgios
with (obj_enemy) {
	// verifica se esta colidindo com a hitbox atual
	if (place_meeting(x, y, other)) {
		// verifica se o inimigo JA foi atingido
		var already_hit = false;
		for (var i = 0; i < array_length(other.hit_list); i++) {
			if (other.hit_list[i] == id) {
				already_hit = true;
				break;
			}
		}
		
		// se ainda não foi atingido
		if (!already_hit) {
			// registra esse inimigo na lista de atingidos
			array_push(other.hit_list, id);
			
			// aplica dano(ou destroi o inimigo)
			instance_destroy(); //inimigo morre imediatamente
			//se for dano, substituir por: hp -= other.damage;
			
			// hit	pause e shake via controller global
			global.freeze_timer = 3; //freeze base(3 frames: 0.3s)
			obj_time_controller.shake = 6;	//intensidade de shake(implementa no controller)
	
			//opcional: spawn hit effect
		instance_create_layer(other.x, other.y, other.layer, obj_slash_effect);
	
		// destroi a hitbox
		instance_destroy();
		exit;
		}
	}
}