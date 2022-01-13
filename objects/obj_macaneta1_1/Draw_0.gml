draw_self();
image_index = 0;

if(place_meeting(x, y, obj_player) and keyboard_check_pressed(ord("E")) and !global.jaabri2 )
{
	macaneta1 = true;
	par_impar2++;
}

if(macaneta1 and par_impar2 mod 2 == 0){
	image_index = 1;

}