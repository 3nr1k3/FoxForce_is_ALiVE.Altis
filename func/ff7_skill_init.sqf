/* ----------------------------------------------------------------------

	_null = [] execVM "ff7_skill_init.sqf";

---------------------------------------------------------------------- */

private ["_skillMod", "_modStarted", "_skillArray", "_skillFactions", "_initSkills", "_customSkills"];

// ---------- AI skill array

FF7_OP_skillArray =
[
	[0.6, 0.8],			// abilityMin
	[0.8, 1],			// abilityMax
	[0.32, 0.46],		// aimingAccuracy
	[0.34, 0.56],		// aimingShake
	[0.28, 0.48],		// aimingSpeed
	[0.6, 1],			// endurance
	[0.6, 1],			// spotDistance
	[0.6, 1],			// spotTime
	[0.8, 1],			// courage
	[0.28, 0.56],		// reloadSpeed
	[0.75, 1],			// commanding
	[0.75, 1]			// general
];


// ---------- AI skill array

FF7_OP_skillFactions =
[
	"IND_F",
	"IND_C_F",
	"IND_G_F",
	"OPF_F",
	"OPF_T_F",
	"OPF_G_F"
];

_skillMod = ((entities "ALiVE_sys_aiskill") select 0);

_modStarted = (_skillMod getVariable ["startupComplete", false]);

while {!_modStarted} do
{
	_modStarted = (_skillMod getVariable ["startupComplete", false]);
	sleep 1;
};

_customSkills = [];

{
	private ["_skillValue"];

	_skillValue	= (_x select 0);
	_customSkills pushBack _skillValue;
} forEach FF7_OP_skillArray;

_skillFactions = [] call ALIVE_fnc_hashCreate;

{
	[_skillFactions, _x, _customSkills] call ALIVE_fnc_hashSet;
} forEach FF7_OP_skillFactions;

_skillMod setVariable ["factionSkills", _skillFactions];


// ---------- PublicVariable eventhandler for AI skill change
/*
"FF7_OP_missionsCompleted" addPublicVariableEventHandler
{
	private ["_var", "_val"];

	_var = (_this select 0);
	_val = (_this select 1);

	//diag_log format ["FF7_OPS :: PublicVariableEventHandler fired for %1 with value %2", _var, _val];

	if (_val > 0) then
	{
		call OPS_fnc_updateALiVEskills;
	};
};
*/
