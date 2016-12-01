private ["_where", "_radius", "_buildings", "_building", "_buildpos", "_pos", "_bfound", "_pfound"];

_where	= (_this select 0);
_radius	= (_this select 1);
_pos = [];

while {(count _pos) == 0} do
{
	_buildings = (nearestObjects [_where, ["house"], _radius]);

	//diag_log format ["Buildings found: %1", str count _buildings];

	if (count _buildings > 0) then
	{
		_building = (_buildings call BIS_fnc_selectRandom);
		
		_buildpos = (_building call BIS_fnc_buildingPositions);

		//diag_log format ["Positions found: %1", str count _buildpos];

		if (count _buildpos >= 5) then
		{
			_pos = (_buildpos call BIS_fnc_selectRandom);
			//diag_log format ["Selected position: %1", _pos];
		};
	};
};

_pos;
