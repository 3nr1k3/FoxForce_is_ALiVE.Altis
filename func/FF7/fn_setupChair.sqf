private ["_chair"];
_chair = (_this select 0);

// Add action to object
_chair addAction ["<t color='#AD4416'>Sit Down</t>", QS_fnc_SitDown, [], 1, true, false, "", "(!(player getVariable 'QS_seated')) && ((speed player) < 1) && ((speed player) > -1) && ((_target distance _this) < 2)"];

// Disable ACE dragging
[_chair, false] call ace_dragging_fnc_setDraggable;

// Disable ACE carrying
[_chair, false] call ace_dragging_fnc_setCarryable;
