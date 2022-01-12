#macro GRAVIDADE .3

function screenshake(_shake){

	var screen = instance_create_layer(0, 0, "Player", obj_screenshake)
	screen.shake = _shake
}

