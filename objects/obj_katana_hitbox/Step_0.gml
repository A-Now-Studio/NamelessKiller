//decrementa vida
life -= 1;
if (life <= 0) {
	instance_destroy();
	exit; //garante saída imediata
}

// checa colisão com inimigo
var inst = intance_place(x, y, obj_enemy);
if (inst != noone) {
	//destruir/matar o inimigo
	with (inst) {
		// aqui faz oq quiser ao inimigo(efeito, som, animação)
		instance_destroy();
	}
	//destroi a hitbox ao acertar
	instance_destroy();
	exit;
}
