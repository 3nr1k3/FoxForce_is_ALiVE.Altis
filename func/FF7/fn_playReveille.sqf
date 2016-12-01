private ["_obj", "_objpos", "_sndpos", "_posx", "_posy", "_posz", "_snd", "_root"];

_obj = missionNamespace getVariable [(_this select 0) , objNull];
_objpos = getPosASL _obj;

_posx = (_objpos select 0);
_posy = (_objpos select 1);
_posz = (_objpos select 2);

_sndpos = [_posx, _posy, (_posz + 7.5)];

_root = call FF7_fnc_getMissionRoot;

_snd = _root + "snd\reveille.ogg";

playSound3D [
	_snd,				// filename: String
	_obj,				// soundSource: Object - the object emitting the sound. If "sound position" is specified this param is ignored
	false,				// isInside: Boolean (optional) Default: false
	_sndpos,			// soundPosition: PositionASL (optional) - position for sound emitter, will override "sound source" position. Default: [0,0,0]
	2,					// volume: Number (optional) Default: 1
	0.88,					// soundPitch: Number (optional) - 1: Normal, 0.5: Darth Vader, 2: Chipmunks, etc. Default: 1
	150					// distance: Number (optional) - How far is sound audible (0 = no max distance) Default: 0
];
