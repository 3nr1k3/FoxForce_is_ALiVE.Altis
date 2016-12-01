params ["_marker", "_radius"];

private ["_pos", "_objs"];

_pos = getMarkerPos _marker;

_objs = _pos nearObjects ["Land_Hangar_F", _radius];

{
	_x allowDamage false;
} forEach _objs;
