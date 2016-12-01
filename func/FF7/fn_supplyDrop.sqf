private ["_pos", "_posx", "_posy", "_posz", "_crate", "_crates", "_chute", "_chutes", "_smoke", "_smokes", "_light", "_lights", "_delay"];

if (FF7_Global_Debug) then
{
	["FF7_fnc_supplyDrop", "Running function"] call FF7_fnc_debugLog;
};

_delay = "SupplyDropPeriod" call BIS_fnc_getParamValue;

FF7_Supplydrop = false;
publicVariable "FF7_Supplydrop";

_pos = (_this select 0);

_posx = (_pos select 0);
_posy = (_pos select 1);
_posz = (_pos select 2);

_chutes	= ["B_Parachute_02_F", "O_Parachute_02_F", "I_Parachute_02_F"];
_crates	= ["Box_IND_AmmoVeh_F", "Box_NATO_AmmoVeh_F", "Box_East_AmmoVeh_F"];
_smokes	= ["SmokeShellRed", "SmokeShellOrange", "SmokeShellPurple"];
_lights	= ["Chemlight_green", "Chemlight_yellow", "Chemlight_red"];

_smoketype = (_smokes call BIS_fnc_selectRandom);
_lighttype = "Chemlight_yellow";

_chute = createVehicle ["B_Parachute_02_F", [_posx, _posy, _posz + 100], [], 0, "NONE"];

_crate = createVehicle [(_crates call BIS_fnc_selectRandom), position _chute, [], 0, "NONE"];
_crate attachTo [_chute, [0, 0, -0.7]];
_crate allowdamage false;
_crate setVariable ["gc_persist", true];

_smoke = createVehicle [_smoketype, position _chute, [], 0, "NONE"];
_smoke attachTo [_chute, [0, 0, 0.45]];

if ((daytime > 19) || (daytime < 5)) then
{
	_light = createVehicle [_lighttype, position _chute, [], 0, "NONE"];
	_light attachTo [_chute, [0, 0, 0.45]];
};

clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

// Arsenal action
[
	_crate,
	["arsenal", "DD1111", "Virtual Arsenal"] call FF7_fnc_formatAddAction,
	{["Open", true] spawn BIS_fnc_arsenal},
	[],
	100,
	true,
	true,
	"",
	"((_target distance _this) < 5)"
] remoteExec ["FF7_fnc_addGlobalAction", 0, true];

// Save gear action
[
	_crate,
	["saw", "11DD11", "Quicksave Gear"] call FF7_fnc_formatAddAction,
	{call FF7_fnc_saveGear},
	[],
	99,
	true,
	true,
	"",
	"((_target distance _this) < 5)"
] remoteExec ["FF7_fnc_addGlobalAction", 0, true];

[
	_crate,
	["loadgear", "4169E1", "Quickload Gear"] call FF7_fnc_formatAddAction,
	{call FF7_fnc_getGear},
	[],
	98,
	true,
	true,
	"",
	"((_target distance _this) < 5) && (!isNil 'FF7_Gear')"
] remoteExec ["FF7_fnc_addGlobalAction", 0, true];


// Disable ACE cargo
_crate setVariable ["ace_cargo_size", -1];

// Disable ACE dragging
[_crate, false] call ace_dragging_fnc_setDraggable;

// Disable ACE carrying
[_crate, false] call ace_dragging_fnc_setCarryable;

// Disable ACE cargo loading
_crate setVariable ["ace_cargo_canLoad", 0];

_crate setVariable["gc_persist", true];

["SUPPLY", "Supply depot", "Supplycrate is in the air ...."] remoteExec ["FF7_fnc_globalHintStruct", 0];

waitUntil {(((position _crate) select 2) < 2) || (isNull _chute)};

detach _crate;

if !(isNil "_light") then
{
	detach _light;
};

detach _smoke;

sleep (_delay/2);

deleteVehicle _crate;

sleep (_delay/2);

//["<t align='center'><t size='2.0' color='#00EEB2'>Supply depot</t><br/>________________________________________<br/><br/><t size='1.3' color='#00B2EE'>Supplydrop is now available ....</t>", 10] remoteExec ["FF7_fnc_globalHint", 0];

["SUPPLY", "Supply depot", "Supplydrop now available ...."] remoteExec ["FF7_fnc_globalHintStruct", 0];

FF7_Supplydrop = true;
publicVariable "FF7_Supplydrop";
