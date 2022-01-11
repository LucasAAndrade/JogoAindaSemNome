//colisão com o hook
if(place_meeting(x-hspeed, y,obj_block))
{
	x += hspeed;
}

if(place_meeting(x+hspeed, y,obj_block))
{
	x -= hspeed;
}

if(other.y <  y && !place_free(x, y+vspeed))
{
	move_contact_solid(90, 8);
	vspeed = 0;
}

if(place_meeting(x, y+vspeed,obj_block))
{
	vspeed = 0;
	move_contact_solid(270, 12);
}
