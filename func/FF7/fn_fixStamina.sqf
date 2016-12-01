_ticks 	= _this select 0;
_factor = _this select 1;

while {true} do
{
	_stamina = getStamina player;

	//hint format ["Player stamina: %1", _stamina];

	if ((speed player) > 0) then
	{
		player SetStamina (_stamina + _factor);
	}
	else
	{
		player SetStamina (_stamina + 0.25);
	};

	sleep _ticks;
};
