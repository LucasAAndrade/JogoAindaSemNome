draw_self();
image_index = 0;


if(place_meeting(x, y, obj_player) and keyboard_check_pressed(ord("E")))
{
	hannaMontana = true;
	par_impar++;
}

if(hannaMontana and par_impar mod 2 == 0){
	image_index = 1;
	obj_player.dash_ativo = true;
}
