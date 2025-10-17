if (global.freeze_timer > 0) {
    if (object_index == obj_enemy || object_index == obj_player) {
        exit; // pausa apenas lógica de jogo
    }
}
