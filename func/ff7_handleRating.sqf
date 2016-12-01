params ["_unit"];

private ["_rateLimit"];

_rateLimit = (rating _unit);

_null = [_unit, _rateLimit] spawn
{
	params ["_player", "_limit"];

	private ["_currRate", "_rateAdd"];

	while {true} do
	{
		if ((rating _player) < _limit) then
		{
			["Client", (format ["Rating below default (%1), adjusting .....", _limit])] call FF7_fnc_debugLog;

			_currRate = rating _player;

			_rateAdd = (_limit - _currRate);

			_player addRating _rateAdd;
		};

		sleep 15;
	};
};
