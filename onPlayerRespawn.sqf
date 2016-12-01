private ["_iRespawn"];

// Run only on player ....
if (!hasInterface) exitWith {};

player disableConversation true;
enableSentences false;

_iRespawn = "RespawnTime" call BIS_fnc_getParamValue;
setPlayerRespawnTime _iRespawn;

//player setVariable ["QS_seated", false];

player setCustomAimCoef 0.5;

call FF7_fnc_getGear;

/*
player addAction
[
	["terrain", "DD1111", "Viewdistance"] call FF7_fnc_formatAddAction,
	CHVD_fnc_openDialog,
	[],
	-99,
	false,
	true
];

player addAction
[
	["supply", "11DDDD", "Supply drop"] call FF7_fnc_formatAddAction,
	{call FF7_fnc_reqSupplyDrop},
	[],
	-100,
	false,
	true
];
*/

player switchMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";

if (!isNil "FF7_Gear") then
{
	call FF7_fnc_getGear;
}
else
{
	call FF7_fnc_getGearRole;
};


["Preload"] call BIS_fnc_arsenal;
