private ["_running", "_caller", "_pas", "_lead"];

_running = missionNamespace getVariable "FF7_briefing";
_lead  = missionNamespace getVariable "FF7_caller";

if (_running) exitWith {hintSilent format ["Briefing already called by %1, keep your pantyhose on !", _lead]};

_pas    = (_this select 3);
_caller = (_this select 1);

_lead = name _caller;

missionNamespace setVariable ["FF7_briefing", true];
missionNamespace setVariable ["FF7_caller", _lead];

{
	[_x] spawn FF7_fnc_playReveille;
} forEach _pas;

sleep 30;

missionNamespace setVariable ["FF7_caller", "No one"];
missionNamespace setVariable ["FF7_briefing", false];
