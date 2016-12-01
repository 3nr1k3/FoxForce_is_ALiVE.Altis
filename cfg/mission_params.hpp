// Misc.

class RespawnTime
{
	title    = "Respawn Delay";
	values[] = {0, 10, 15, 30, 60, 120, 300, 600};
	texts[]  = {"Direct", "10 sec.", "15 sec.", "30 sec.", "1 min.", "3 min.", "10 min."};
	default  = 15;
};

class ObjectiveLimit
{
	title    = "Number of objectives to complete";
	values[] = {5, 10, 15, 20, 25, 30};
	texts[]  = {"5", "10", "15", "20", "25", "30"};
	default  = 10;
};

class SupplyDropPeriod
{
	title    = "Supply Drop delay";
	values[] = {600, 900, 1200, 1800, 2700, 3600};
	texts[]  = {"10 min.", "15 min.", "20 min.", "30 min.", "45 min.", "60 min."};
	default  = 1800;
};

class HaloDropPeriod
{
	title    = "HALO Drop delay";
	values[] = {300, 600, 900, 1800, 2700, 3600};
	texts[]  = {"5 min.", "10 min.", "15 min.", "30 min.", "45 min.", "1 hour"};
	default  = 900;
};

class AirPatrolEnable
{
	title    = "Enable enemy air patrols";
	values[] = {0, 1};
	texts[]  = {"Disabled", "Enabled"};
	default  = 1;
};

class AirPatrolCount
{
	title    = "Number of Air patrols";
	values[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	texts[]  = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
	default  = 8;
};

class AirDefencesEnable
{
	title    = "Enable base air defences";
	values[] = {0, 1};
	texts[]  = {"Disabled", "Enabled"};
	default  = 1;
};


// Object cleanup

class CleanupBodies
{
	title    = "Dead bodies cleanup interval";
	values[] = {0, 60, 120, 180, 300, 600, 1800};
	texts[]  = {"Disabled", "1 min.", "2 min.", "3 min.", "5 min.", "10 min.", "30 min."};
	default  = 600;
};

class CleanupVehicles
{
	title    = "Destroyed vehicles cleanup interval";
	values[] = {0, 300, 600, 900, 1800, 2700, 3600};
	texts[]  = {"Disabled", "5 min.", "10 min.", "15 min.", "30 min.", "45 min.", "1 hour"};
	default  = 900;
};

class CleanupAbandoned
{
	title    = "Abandoned vehicles cleanup interval";
	values[] = {0, 300, 600, 900, 1800, 2700, 3600};
	texts[]  = {"Disabled", "5 min.", "10 min.", "15 min.", "30 min.", "45 min.", "1 hour"};
	default  = 900;
};

class CleanupWeapons
{
	title    = "Dropped weapons cleanup interval";
	values[] = {0, 60, 120, 180, 300, 600, 1800};
	texts[]  = {"Disabled", "1 min.", "2 min.", "3 min.", "5 min.", "10 min.", "30 min."};
	default  = 600;
};

class CleanupDemos
{
	title    = "Explosives cleanup interval";
	values[] = {0, 60, 120, 180, 300, 600, 900, 1800, 3600};
	texts[]  = {"Disabled", "1 min.", "2 min.", "3 min.", "5 min.", "10 min.", "15 min.", "30 min.", "1 hour"};
	default  = 1800;
};

class CleanupOther
{
	title    = "Misc. cleanup interval";
	values[] = {0, 60, 120, 180, 300, 600, 900, 1800, 3600};
	texts[]  = {"Disabled", "1 min.", "2 min.", "3 min.", "5 min.", "10 min.", "15 min.", "30 min.", "1 hour"};
	default  = 600;
};
