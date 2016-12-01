/*
	GrenadeStop v0.8 for ArmA 3 Alpha by Bake
	
	DESCRIPTION:
	Stops players from throwing grenades in safety zones.
	
	INSTALLATION:
	Move grenadeStop.sqf to your mission's folder. Then add the
	following line to your init.sqf file (create one if necessary):
	execVM "grenadeStop.sqf";
	
	CONFIGURATION:
	Edit the #defines below.
*/

#define MESSAGE			"At base, no pew pew\n\nBye bye ...."

waitUntil {!isNull player};

player addEventHandler ["Fired", {
	if (["base_protect", player] call bis_fnc_intrigger) then
	{
		deleteVehicle (_this select 6);
		titleText [MESSAGE, "PLAIN", 2];

		removeHeadgear player:
		removeGoggles player;
		removeVest player;
		removeBackpack player;
		removeUniform player;
		removeAllWeapons player:
		removeAllAssignedItems player;
		setPlayerRespawnTime 3600;
		player setDamage 1;
	};
}];
