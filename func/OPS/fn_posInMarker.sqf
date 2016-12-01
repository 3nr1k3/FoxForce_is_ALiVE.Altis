private ["_pos","_marker", "_posx", "_posy", "_mpx", "_mpy", "_msx", "_msy", "_rpx", "_rpy", "_xmin", "_xmax", "_ymin", "_ymax", "_ma", "_res", "_ret"];

_pos	= (_this select 0); // pos
_marker	= (_this select 1); // marker

_posx = (_pos select 0);
_posy = (_pos select 1);


_mpx = ((getMarkerPos _marker) select 0);
_mpy = ((getMarkerPos _marker) select 1);

_msx = ((getMarkerSize _marker) select 0);
_msy = ((getMarkerSize _marker) select 1);

_ma		= (markerDir _marker);

_rpx = ((_px - _mpx) * cos(_ma)) + ((_py - _mpy) * sin(_ma)) + _mpx;
_rpy = (-(_px - _mpx) * sin(_ma)) + ((_py - _mpy) * cos(_ma)) + _mpy;

if ((markerShape _marker) == "RECTANGLE") then
{
	_xmin = _mpx - _msx;
	_xmax = _mpx + _msx;
	_ymin = _mpy - _msy;
	_ymax = _mpy + _msy;
	
	if (((_rpx > _xmin) && (_rpx < _xmax)) && ((_rpy > _ymin) && (_rpy < _ymax))) then
	{
		_ret = true;
	}
	else
	{
		_ret = false;
	};
}
else
{
	_res = (((_rpx-_mpx) ^ 2)/(_msx ^ 2)) + (((_rpy-_mpy) ^ 2)/(_msy ^ 2));

	if ( _res < 1 ) then
	{
		_ret = true;
	}
	else
	{
		_ret = false;
	};
};

_ret;
