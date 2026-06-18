/// @description Update Physics

// Get Input
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
downKey = keyboard_check(ord("S"));
upKey = keyboard_check(ord("W"));

// Player Movement
var _horizKey = rightKey - leftKey;
var _vertKey = downKey - upKey;
moveDir = point_direction(0,0,_horizKey,_vertKey);

// Get Speed
var _spd = 0;
var _inputLevel = point_distance(0,0,_horizKey,_vertKey);
_inputLevel = clamp(_inputLevel,0,1);
_spd = moveSpd * _inputLevel;

xSpd = lengthdir_x(_spd,moveDir);
ySpd = lengthdir_y(_spd,moveDir);

// Collision
if(place_meeting(x+xSpd,y,oWall))
{
	xSpd = 0;	
}
if(place_meeting(x,y+ySpd,oWall))
{
	ySpd = 0;	
}

// Move the Player
x += xSpd;
y += ySpd;