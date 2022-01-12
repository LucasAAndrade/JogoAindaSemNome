draw_self();
image_index = 0;

if(place_meeting(x, y, obj_player) and keyboard_check_pressed(ord("E")) and !global.jaabri1)
{
	macaneta2 = true;
	par_impar3++;
}

if(macaneta2 and par_impar3 mod 2 == 0){
	image_index = 1;
}