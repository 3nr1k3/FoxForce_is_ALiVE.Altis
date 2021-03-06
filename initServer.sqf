/////////////////////////////////////////////
// ---------- Begin server init ---------- //
/////////////////////////////////////////////

FF7_Global_Debug = true;

_null = [60] spawn (compile (preprocessFileLineNumbers "func\ff7_serverDiag.sqf"));


// ---------- Difficulty setup, sync with ALiVE_sys_aiskills module

//_null = [] execVM "func\ff7_skill_init.sqf";

FF7_OPS_aimingAccuracy	= 0.42;
FF7_OPS_aimingShake		= 0.28;
FF7_OPS_aimingSpeed		= 0.72;
FF7_OPS_endurance		= 1;
FF7_OPS_spotDistance	= 0.68;
FF7_OPS_spotTime		= 1;
FF7_OPS_courage			= 1;
FF7_OPS_reloadSpeed		= 0.46;
FF7_OPS_commanding		= 1;
FF7_OPS_general			= 1;


// ---------- Clean up Maintenance
/*
_cleanBody	= "CleanupBodies" call BIS_fnc_getParamValue;
_cleanVehic	= "CleanupVehicles" call BIS_fnc_getParamValue;
_cleanAband	= "CleanupAbandoned" call BIS_fnc_getParamValue;
_cleanWeap	= "CleanupWeapons" call BIS_fnc_getParamValue;
_cleanDemo	= "CleanupDemos" call BIS_fnc_getParamValue;

[
	_cleanBody,		// seconds to delete dead bodies (0 means don't delete)
	_cleanVehic,	// seconds to delete dead vehicles (0 means don't delete)
	_cleanAband,	// seconds to delete immobile vehicles (0 means don't delete)
	_cleanWeap,		// seconds to delete dropped weapons (0 means don't delete)
	_cleanDemo		// seconds to deleted planted explosives (0 means don't delete)
] execVM "src\repetitive_cleanup19.sqf";
*/

_null = [] execVM "src\repetitive_cleanup20.sqf";


// ---------- Init global variables

FF7_Supplydrop = true;
publicVariable "FF7_Supplydrop";

FF7_ALiVE_version = ((configfile >> "CfgPatches" >> "ALiVE_main" >> "versionStr") call BIS_fnc_GetCfgData);
publicVariable "FF7_ALiVE_version";


// ---------- Nighttime acceleration script

_null = [19.5, 4.5, 4] execVM "func\ff7_timeKeeper.sqf";


// ---------- Fog/mist controller

_null = [900, 0.2] execVM "func\ff7_weatherMan.sqf";


// ---------- Base air befences init

if (("AirDefencesEnable" call BIS_fnc_getParamValue) == 1) then
{
	_null = ["mkr_defence_aa_"] spawn (compile (preprocessFileLineNumbers "func\ff7_setupBaseAA.sqf"));
};


// ---------- Air patrol init

if (("AirPatrolEnable" call BIS_fnc_getParamValue) == 1) then
{
	_null = ["init"] spawn OPS_fnc_airPatrol;
};


// ---------- AI distributor

_null = [] spawn (compile (preprocessFileLineNumbers "func\ff7_aiDistributor.sqf"));


// ---------- TFAR setup

if (("task_force_radio" in activatedAddons)) then
{
	call (compile (preprocessFileLineNumbers "func\ff7_tfar_setup.sqf"));
}
else
{
	["initServer", "TFAR not active ...."] call FF7_fnc_debugLog;
};


// ---------- Mission control script

_null = [] execVM "src\mission_exec\controller.sqf";


///////////////////////////////////////////
// ---------- End server init ---------- //
///////////////////////////////////////////
