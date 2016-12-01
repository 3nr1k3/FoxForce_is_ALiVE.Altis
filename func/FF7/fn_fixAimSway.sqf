_ticks  = _this select 0;
_stand  = _this select 1;
_crouch = _this select 2;
_prone  = _this select 3;


while {true} do
{
	_stance = stance player;

	switch (_stance) do
	{
		case "STAND": {player setCustomAimCoef _stand;};
		case "CROUCH": {player setCustomAimCoef _crouch;};
		case "PRONE": {player setCustomAimCoef _prone;};
	};

	sleep _ticks;
};
