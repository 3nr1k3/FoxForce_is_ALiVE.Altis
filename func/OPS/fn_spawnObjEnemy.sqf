private ["_posObj", "_numInf", "_numSnip", "_numStatic", "_numMech", "_numArmr", "_randomPos", "_objEnemies", "_infTeam", "_rndStatic", "_rndVehicle", "_rndCrew", "_sniperTeam", "_facSide", "_side", "_fact", "_teamSnip", "_empUnit"];

if (FF7_Global_Debug) then
{
	["OPS_fnc_spawnObjEnemy", "Running function"] call FF7_fnc_debugLog;
};


params
[
	"_posObj",
	"_faction",
	["_numInf", 8],
	["_numSnip", 3],
	["_numStatic", 3],
	["_numMech", 3],
	["_numArmr", 2],
	["_radius", 400]
];


/*
_posObj		= (_this select 0);
_faction	= (_this select 1);
_numInf		= (_this select 2);
_numSnip	= (_this select 3);
_numStatic	= (_this select 4);
_numMech	= (_this select 5);
_numArmr	= (_this select 6);
*/

_objEnemies	= [grpNull];

_INF_TEAMS	= [];
_VEH_MECH	= [];
_VEH_ARM	= [];
_EMP_STATIC	= [];

switch (_faction) do
{
	case "CSAT":
	{
		_INF_TEAMS 	= ["OI_reconPatrol", "OI_reconSentry", "OI_reconTeam", "OIA_InfAssault", "OIA_InfSentry", "OIA_InfSquad", "OIA_InfSquad_Weapons", "OIA_InfTeam", "OIA_InfTeam_AA", "OIA_InfTeam_AT", "OIA_ReconSquad", "OI_ViperTeam"];
		_VEH_MECH	= ["O_APC_Wheeled_02_rcws_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F"];
		_VEH_ARM	= ["O_MBT_02_cannon_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F", "O_MBT_02_arty_F"];
		_EMP_STATIC	= ["O_HMG_01_F", "O_HMG_01_high_F", "O_GMG_01_F", "O_GMG_01_high_F", "O_Mortar_01_F", "O_static_AA_F", "O_static_AT_F"];

		_facSide	= east;
		_side		= "East";
		_fact		= "OPF_F";
		_teamSnip	= "OI_SniperTeam";
		_empUnit	= "O_engineer_F";
	};

	case "CSAT_P":
	{
		_INF_TEAMS 	= ["O_T_InfSentry", "O_T_InfSquad", "O_T_InfSquad_Weapons", "O_T_InfTeam", "O_T_InfTeam_AA", "O_T_InfTeam_AT", "O_T_reconPatrol", "O_T_reconSentry", "O_T_reconTeam", "O_T_ViperTeam"];
		_VEH_MECH	= ["O_T_APC_Wheeled_02_rcws_ghex_F", "O_T_MRAP_02_gmg_ghex_F", "O_T_MRAP_02_hmg_ghex_F", "O_T_LSV_02_armed_F"];
		_VEH_ARM	= ["O_T_MBT_02_cannon_ghex_F", "O_T_APC_Tracked_02_cannon_ghex_F", "O_T_APC_Tracked_02_AA_ghex_F", "O_T_MBT_02_arty_ghex_F"];
		_EMP_STATIC	= ["O_HMG_01_F", "O_HMG_01_high_F", "O_GMG_01_F", "O_GMG_01_high_F", "O_Mortar_01_F", "O_static_AA_F", "O_static_AT_F"];

		_facSide	= east;
		_side		= "East";
		_fact		= "OPF_T_F";
		_teamSnip	= "O_T_SniperTeam";
		_empUnit	= "O_T_Engineer_F";
	};

	case "AAF":
	{
		_INF_TEAMS	= ["HAF_InfTeam", "HAF_InfTeam_AA", "HAF_InfTeam_AT", "HAF_InfSentry", "HAF_InfSquad", "HAF_InfSquad_Weapons"];
		_VEH_MECH	= ["I_APC_Wheeled_03_cannon_F", "I_MRAP_03_gmg_F", "I_MRAP_03_hmg_F"];
		_VEH_ARM	= ["I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F"];
		_EMP_STATIC	= ["I_HMG_01_F", "I_HMG_01_high_F", "I_GMG_01_F", "I_GMG_01_high_F", "I_Mortar_01_F", "I_static_AA_F", "I_static_AT_F"];

		_facSide	= resistance;
		_side		= "Indep";
		_fact		= "IND_F";
		_teamSnip	= "HAF_SniperTeam";
		_empUnit	= "I_engineer_F";
	};

	case "FIA":
	{
		_INF_TEAMS	= ["IRG_InfAssault", "IRG_InfSentry", "IRG_InfSquad", "IRG_InfSquad_Weapons", "IRG_InfTeam", "IRG_InfTeam_AT", "IRG_ReconSentry"];
		_VEH_MECH	= ["O_G_Offroad_01_armed_F"];
		_VEH_ARM	= ["rhsusf_m113d_usarmy_M240", "rhsusf_m113_usarmy_M240"];
		_EMP_STATIC	= ["RHS_M2StaticMG_D"];

		_facSide	= east;
		_side		= "West";
		_fact		= "Guerilla";
		_teamSnip	= "IRG_SniperTeam_M";
		_empUnit	= "O_G_engineer_F";
	};

	case "SYND":
	{
		_INF_TEAMS	= ["BanditCombatGroup", "BanditFireTeam", "BanditShockTeam", "ParaCombatGroup", "ParaFireTeam", "ParaShockTeam"];
		_VEH_MECH	= ["I_G_Offroad_01_armed_F"];
		_VEH_ARM	= ["rhsusf_m113d_usarmy_M240", "rhsusf_m113_usarmy_M240"];
		_EMP_STATIC	= ["RHS_M2StaticMG_D"];

		_facSide	= resistance;
		_side		= "Indep";
		_fact		= "IND_C_F";
		_teamSnip	= "IRG_SniperTeam_M";
		_empUnit	= "I_C_Soldier_Para_8_F";
	};
};


//---------- Infantry
for "_x" from 1 to _numInf do
{
	_infTeam	= createGroup _facSide;
	_randomPos	= [_posObj, 25, _radius, 10, 0, 10, 0] call BIS_fnc_findSafePos;
	_infTeam	= [_randomPos, _facSide, (configfile >> "CfgGroups" >> _side >> _fact >> "Infantry" >> (selectRandom _INF_TEAMS))] call BIS_fnc_spawnGroup;

	[_infTeam, _randomPos, 250 + (random 150)] call BIS_fnc_taskPatrol;
	//[_infTeam, _posObj, (_radius * 1.5), 8] call CBA_fnc_taskPatrol;

	//[_infTeam, 0.32, 0.7, 0.08] call OPS_fnc_setGroupSkill;

	_objEnemies = _objEnemies + [_infTeam];

	{
		[_x] call FF7_fnc_addToCurator;
	} foreach units _infTeam;

	_infTeam = nil;
	sleep 0.1;
};

sleep 1;

//---------- Overwatch
if (_numSnip > 0) then
{
	for "_x" from 1 to _numSnip do
	{
		private ["_tmpDir"];
	
		_tmpDir = (random 360);
	
		_sniperTeam	= createGroup _facSide;

		_sniperTeam setVariable ["ALiVE_CombatSupport", true];

		_randomPos	= [_posObj, 800, 100, 5] call BIS_fnc_findOverwatch;
		_sniperTeam	= [_randomPos, _facSide, (configfile >> "CfgGroups" >> _side >> _fact >> "Infantry" >> _teamSnip)] call BIS_fnc_spawnGroup;

		_sniperTeam setFormDir _tmpDir;

		//[_sniperTeam, 0.7, 0.75, 0.15] call OPS_fnc_setGroupSkill;

		_objEnemies = _objEnemies + [_sniperTeam];

		{
			//[_x] doWatch _posObj;
			_x setDir _tmpDir;
			_x setUnitPos "DOWN";
		} foreach units _sniperTeam;

		_sniperTeam setBehaviour "COMBAT";
		_sniperTeam setCombatMode "RED";

		{
			[_x] call FF7_fnc_addToCurator;
		} foreach units _sniperTeam;

		_sniperTeam = nil;
		sleep 0.1;
	};
};

sleep 1;

//---------- Statics
if (_numStatic > 0) then
{
	for "_x" from 1 to _numStatic do
	{
		private ["_tmpDir"];

		_tmpDir = (random 360);

		_rndCrew	= createGroup _facSide;

		_rndCrew setVariable ["ALiVE_CombatSupport", true];

		//_randomPos	= [_posObj, 250, 100, 5] call BIS_fnc_findOverwatch;
		_randomPos	= [_posObj, 75, 400, 2, 0, 1, 0] call BIS_fnc_findSafePos;

		_rndStatic	= (selectRandom _EMP_STATIC) createVehicle _randomPos;
		_rndStatic enableSimulationGlobal false;
		_rndStatic setDir _tmpDir;
		_rndStatic setVectorUp [0, 0, 1];

		waitUntil
		{
			!isNull _rndStatic;
		};

		_empUnit createUnit [_randomPos, _rndCrew];

		_rndCrew setFormDir _tmpDir;
		((units _rndCrew) select 0) setDir _tmpDir;
	
		((units _rndCrew) select 0) assignAsGunner _rndStatic;
		((units _rndCrew) select 0) moveInGunner _rndStatic;

		_rndCrew setBehaviour "COMBAT";
		_rndCrew setCombatMode "RED";
		_rndStatic lock 3;
		_rndStatic enableSimulationGlobal true;
		
		//[_rndCrew, 0.3, 0.7, 0.05] call OPS_fnc_setGroupSkill;

		_objEnemies = _objEnemies + [_rndStatic];
		_objEnemies = _objEnemies + [_rndCrew];

		[_rndStatic] call FF7_fnc_addToCurator;

		{
			[_x] call FF7_fnc_addToCurator;
		} foreach units _rndCrew;

		_rndStatic = nil;
		sleep 0.1;
	};
};

sleep 1;
	
//---------- Mechanized
if (_numMech > 0) then
{
	for "_x" from 1 to _numMech do
	{
		_rndCrew	= createGroup _facSide;

		_rndCrew setVariable ["ALiVE_CombatSupport", true];

		_randomPos	= [_posObj, 50, 300, 6, 0, 4, 0] call BIS_fnc_findSafePos;
		_rndVehicle	= (selectRandom _VEH_MECH) createVehicle _randomPos;

		waitUntil
		{
			sleep 1;
			!isNull _rndVehicle;
		};

		[_rndVehicle, _rndCrew, false, "", _empUnit] call BIS_fnc_spawnCrew;

		[_rndCrew, _randomPos, 250 + (random 250)] call BIS_fnc_taskPatrol;
		//[_rndCrew, _posObj, (_radius * 1.25), 6] call CBA_fnc_taskPatrol;

		_rndVehicle lock 3;

		//[_rndCrew, 0.3, 0.75, 0.05] call OPS_fnc_setGroupSkill;

		_objEnemies = _objEnemies + [_rndVehicle];
		_objEnemies = _objEnemies + [_rndCrew];

		[_rndVehicle] call FF7_fnc_addToCurator;

		{
			[_x] call FF7_fnc_addToCurator;
		} foreach units _rndCrew;

		_rndVehicle = nil;
		sleep 0.1;
	};
};

sleep 1;

//---------- Armor
if (_numArmr > 0) then
{
	for "_x" from 1 to _numArmr do
	{
		_rndCrew	= createGroup _facSide;

		_rndCrew setVariable ["ALiVE_CombatSupport", true];

		_randomPos	= [_posObj, 50, 250, 10, 0, 8, 0] call BIS_fnc_findSafePos;
		_rndVehicle	= (selectRandom _VEH_ARM) createVehicle _randomPos;

		waitUntil
		{
			sleep 1;
			!isNull _rndVehicle;
		};

		[_rndVehicle, _rndCrew] call BIS_fnc_spawnCrew;
		
		[_rndCrew, _randomPos, 200 + (random 150)] call BIS_fnc_taskPatrol;
		//[_rndCrew, _posObj, _radius, 6] call CBA_fnc_taskPatrol;

		_rndVehicle lock 3;

		//[_rndCrew, 0.3, 0.75, 0.05] call OPS_fnc_setGroupSkill;

		_objEnemies = _objEnemies + [_rndVehicle];
		_objEnemies = _objEnemies + [_rndCrew];

		[_rndVehicle] call FF7_fnc_addToCurator;

		{
			[_x] call FF7_fnc_addToCurator;
		} foreach units _rndCrew;

		_rndVehicle = nil;
		sleep 0.1;
	};
};


//---------- Return array
_objEnemies;
