life = 6 //dura 6 frames
damage = 1;

//Contagem regressiva
life --;
if (life <= 0) {
	instance_destroy();
}