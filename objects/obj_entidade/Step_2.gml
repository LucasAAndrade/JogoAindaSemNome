//passando o mid velh para o velh enquanto ele for menor do que o limite
if(abs(velh) <= max_velh)
{
	velh += mid_velh;
}
else
{
	velh = 0;
}

//sistema de colisão e movimentação
var _velv = sign(velv);
var _velh = sign(velh);

//horizontal
repeat(abs(velh))
{
	if(place_meeting(x + _velh, y, obj_block))
	{
		velh = 0;
		break;
	}
	x += _velh;
}
repeat(abs(velv))
{
	if(place_meeting(x, y + _velv, obj_block))
	{
		pulos = pulos_max;
		velv = 0;
		break;
	}
	y += _velv;
}