/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();



if(ativo)
{
	draw_line(x, y, mx, my);
}

/// @description 

var multiplicar = 0;

var xx = 40; 

//desenhando a nossa vida
repeat(vida){
	draw_sprite_ext(spr_vida, 0, x - 300 + xx * multiplicar , y - 500, 0.7, 0.7, 0, c_white, aphaa);
	multiplicar++;	

}


