/* ----------------------------------------------------------------------

	Usage :	In ALiVE_Require module init.

	_null = [] execVM "ff7_ALiVE_staticData.sqf";

---------------------------------------------------------------------- */

//waitUntil {!isNil "ALiVE_STATIC_DATA_LOADED"};


// ---------- CQB unit blacklist

ALiVE_MIL_CQB_CUSTOM_UNITBLACKLIST =
[
	"C_journalist_F",
	"C_scientist_F",
	"C_man_w_worker_F",
	"C_Nikos",
	"C_Nikos_aged",
	"C_Orestes",
	"C_man_hunter_1_F",

	"O_Survivor_F",
	"O_Soldier_unarmed_F",
	"O_Story_CEO_F",
	"O_Story_Colonel_F",

	"O_T_Diver_F",
	"O_T_Diver_Exp_F",
	"O_T_Diver_TL_F",
	"O_T_Helicrew_F",
	"O_T_Helipilot_F",
	"O_T_Crew_F",

	"O_G_Survivor_F",
	"O_G_Soldier_unarmed_F",
	"O_G_Soldier_universal_F",

	"O_V_Soldier_Viper_hex_F",
	"O_V_Soldier_Viper_F",

	"I_Survivor_F",
	"I_Soldier_unarmed_F",

	"I_G_Survivor_F",
	"I_G_Soldier_unarmed_F",

	"I_C_Helipilot_F",
	"I_C_Pilot_F"
];


// ---------- Unit placemant blacklist

ALiVE_PLACEMENT_CUSTOM_UNITBLACKLIST =
[

	"C_journalist_F",
	"C_scientist_F",
	"C_man_w_worker_F",
	"C_Nikos",
	"C_Nikos_aged",
	"C_Orestes",
	"C_man_hunter_1_F",

	"O_diver_F",
	"O_diver_exp_F",
	"O_diver_TL_F",
	"O_Survivor_F",
	"O_Story_CEO_F",
	"O_Story_Colonel_F",
	"O_Soldier_unarmed_F",
	"O_helicrew_F",
	"O_helipilot_F",
	"O_Pilot_F",
	"O_crew_F",

	"O_T_Diver_F",
	"O_T_Diver_Exp_F",
	"O_T_Diver_TL_F",
	"O_T_Helicrew_F",
	"O_T_Helipilot_F",
	"O_T_Pilot_F",
	"O_T_Crew_F",

	"O_G_Survivor_F",
	"O_G_Soldier_unarmed_F",
	"O_G_Soldier_universal_F",

	"O_V_Soldier_Viper_hex_F",
	"O_V_Soldier_Viper_F",

	"I_diver_F",
	"I_diver_exp_F",
	"I_diver_TL_F",
	"I_Survivor_F",
	"I_Story_Colonel_F",
	"I_Soldier_unarmed_F",
	"I_pilot_F",
	"I_helipilot_F",
	"I_helicrew_F",
	"I_crew_F",

	"I_G_Survivor_F",
	"I_G_Soldier_unarmed_F",

	"I_C_Soldier_Camo_F"
];


// ---------- Vehicle placemant blacklist

ALiVE_PLACEMENT_CUSTOM_VEHICLEBLACKLIST =
[
	"ivory_m3_testgrid",
	"ivory_m3_gts_csathdfw",
	"ivory_m3",
	"ivory_m3_candyred",
	"ivory_m3_crispyblue",
	"ivory_m3_icywhite",
	"ivory_m3_gts",

	"ivory_lp560",
	"ivory_lp560_blueruthless",
	"ivory_lp560_carbon",
	"ivory_lp560_csathdfw",
	"ivory_lp560_galaxy",
	"ivory_lp560_italia",
	"ivory_lp560_redsavage",
	"ivory_lp560_testgrid",
	"ivory_gt500_testgrid",
	"ivory_gt500_blackgray",
	"ivory_gt500_grayblack",
	"ivory_gt500_redwhite",
	"ivory_gt500",
	"ivory_gt500_whiteblue",

	"ivory_wrx_testgrid",
	"ivory_wrx_cop_slicktop",
	"ivory_wrx_blackgray",
	"ivory_wrx_candy",
	"ivory_wrx_csathdfw",
	"ivory_wrx_med_ems",
	"ivory_wrx_graystripe",
	"ivory_wrx_redblack",
	"ivory_wrx_civ_utility",
	"ivory_wrx_cop_marked",
	"ivory_wrx_cop_unmarked",
	"ivory_wrx",
	"ivory_wrx_white"
];


// ---------- Group placemant blacklist

ALiVE_PLACEMENT_CUSTOM_GROUPBLACKLIST =
[
	"OIA_SPGPlatoon_Scorcher",
	"OIA_TankPlatoon",
	"OIA_TankPlatoon_AA",

	"OIA_PO30_Squadron",
	"OIA_PO30_Transport",

	"O_T_PO30_Squadron",
	"O_T_VTOL_Transport",

	"O_T_SPGPlatoon_Scorcher",
	"O_T_TankPlatoon",
	"O_T_TankPlatoon_AA",

	"HAF_TankPlatoon",
	"HAF_TankPlatoon_AA"
];
