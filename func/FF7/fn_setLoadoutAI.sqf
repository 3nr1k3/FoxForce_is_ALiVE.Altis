private ["_unit"];

_unit = _this select 0;
if (!local _unit) exitwith {};

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;


//_uniforms	= ["TRYK_U_B_3CD_Ranger_BDU", "TRYK_U_B_woodtan_CombatUniform", "TRYK_U_B_3CD_BLK_BDUTshirt"];
_uniforms	= ["U_B_CombatUniform_mcam_vest", "U_B_CTRG_3", "U_B_CTRG_2", "U_B_CombatUniform_mcam_tshirt"];
//_vests		= ["TRYK_V_ArmorVest_tan", "TRYK_V_ArmorVest_coyo2", "TRYK_V_ArmorVest_tan2", "TRYK_V_PlateCarrier_coyo"];
_vests		= ["V_PlateCarrier2_rgr", "V_PlateCarrier1_blk", "V_PlateCarrier2_rgr", "V_PlateCarrier1_rgr"];
//_backpacks	= ["TRYK_B_AssaultPack_MARPAT_Desert", "TRYK_B_Kitbag_Base", "B_Kitbag_cbr", "B_AssaultPack_rgr"];
_backpacks	= ["B_Kitbag_cbr", "B_AssaultPack_rgr", "B_AssaultPack_cbr", "B_Kitbag_rgr"];
//_headgear	= ["TRYK_H_Booniehat_3CD", "TRYK_H_PASGT_COYO", "TRYK_H_Helmet_3C"];
_headgear	= ["H_Booniehat_tan", "H_Booniehat_grn", "H_Booniehat_oli", "H_HelmetB_snakeskin", "H_HelmetB_sand", "H_HelmetB_black"];
//_facewear	= ["TRYK_Shemagh_G", "TRYK_Shemagh_ESS_G", "TRYK_Shemagh", "TRYK_Beard_BK4", "TRYK_Shemagh_shade_G"];
_facewear	= ["G_Balaclava_lowprofile", "G_Combat", "G_Lowprofile", "G_Aviator", "G_Tactical_Black"];
_weapons	= ["rhs_weap_m16a4", "rhs_weap_m249_pip_L", "rhs_weap_m4a1_carryhandle", "rhs_weap_m14ebrri"];
_scopes		= ["rhsusf_acc_eotech_552", "rhsusf_acc_ACOG", "optic_Hamr"];
_nvgs		= ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"];

_unit forceAddUniform (_uniforms call BIS_fnc_selectRandom);

_unit addVest (_vests call BIS_fnc_selectRandom);
_unit addItemToVest "rhs_mag_9x19_17";
_unit addItemToVest "HandGrenade";

_unit addBackpack (_backpacks call BIS_fnc_selectRandom);
_unit addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";
_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";
_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";

_unit addHeadgear (_headgear call BIS_fnc_selectRandom);
_unit addGoggles (_facewear call BIS_fnc_selectRandom);
_unit addWeapon (_weapons call BIS_fnc_selectRandom);

_unit addPrimaryWeaponItem (_scopes call BIS_fnc_selectRandom);

_unit addWeapon "rhs_weap_pya";

_unit addWeapon "Binocular";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
//_unit linkItem "tf_anprc152_2";
_unit linkItem "ItemGPS";
_unit linkItem (_nvgs call BIS_fnc_selectRandom);

_unit addEventHandler ["Fired", {(_this select 0) setVehicleAmmo 1}];

_unit disableAI "MOVE";
_unit disableAI "AIMINGERROR";
_unit disableAI "SUPPRESSION";
