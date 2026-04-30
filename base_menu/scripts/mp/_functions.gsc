#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;

// =========================================================================
//  functions_calls()
//  Runs every time the player spawns. Initialize all pers values, dvars,
//  and bind sliders here.
//  GUIDE REF: Section 6 (_functions.gsc), Section 15 (Toggle), Section 18 (Bind)
// =========================================================================
functions_calls()
{
    // --- Toggle pers inits (Section 15: Simple Toggle) ---
    self setPersIfUni("god", "Off");
    self setPersIfUni("ufo", "Off");
    self setPersIfUni("speed", "Off");
    self setPersIfUni("maxammo", "Off");
    self setPersIfUni("esploop", "Off");

    // --- Dvar inits (Section 18: AddDvarSlider uses dvars) ---
    setDvarIfUni("g_speed", 190);
    setDvarIfUni("g_gravity", 800);
    setDvarIfUni("jump_height", 39);

    // --- Bind slider inits (Section 18: AddBindSliders) ---
    // setupBind checks if the pers is not "Off", and if so, starts the
    // bind function with the stored button. This re-activates binds after death.
    self setupBind("savelocbind", "Off", ::saveLocBind);
    self setupBind("refillbind", "Off", ::refillBind);
}


// =========================================================================
//  TOGGLE FUNCTIONS
//  GUIDE REF: Section 15 (Simple Toggle Function)
//  Pattern: check getPers -> flip state -> do action -> print status
// =========================================================================

// --- God Mode Toggle ---
// Menu option + cfg callable. Shows how a basic toggle works.
godmode()
{
    if (self getPers("god") == "Off")
    {
        self setPers("god", "On");
        self enableInvulnerability();
        self iPrintLn("God Mode: ^2On");
    }
    else
    {
        self setPers("god", "Off");
        self disableInvulnerability();
        self iPrintLn("God Mode: ^1Off");
    }
}

// --- UFO / Noclip Toggle ---
ufo()
{
    if (self getPers("ufo") == "Off")
    {
        self setPers("ufo", "On");
        self allowSpectateTeam("freelook", true);
        self.sessionstate = "spectator";
        self iPrintLn("UFO Mode: ^2On");
    }
    else
    {
        self setPers("ufo", "Off");
        self.sessionstate = "playing";
        self allowSpectateTeam("freelook", false);
        self iPrintLn("UFO Mode: ^1Off");
    }
}

// --- Speed Boost Toggle ---
speed()
{
    if (self getPers("speed") == "Off")
    {
        self setPers("speed", "On");
        setDvar("g_speed", 500);
        self iPrintLn("Speed: ^2On");
    }
    else
    {
        self setPers("speed", "Off");
        setDvar("g_speed", 190);
        self iPrintLn("Speed: ^1Off");
    }
}

// --- Unlimited Ammo Toggle (Looping Function) ---
// GUIDE REF: Section 17 (Looping Function)
// Uses the anti-stack pattern: notify stop -> endon stop
maxammo()
{
    if (self getPers("maxammo") == "Off")
    {
        self setPers("maxammo", "On");
        self iPrintLn("Max Ammo: ^2On");
        self thread maxammoLoop();
    }
    else
    {
        self setPers("maxammo", "Off");
        self notify("stop_maxammo");
        self iPrintLn("Max Ammo: ^1Off");
    }
}

maxammoLoop()
{
    self endon("disconnect");
    self endon("death");
    self notify("stop_maxammo");
    self endon("stop_maxammo");
    for (;;)
    {
        weapons = self getWeaponsList();
        for (i = 0; i < weapons.size; i++)
            self giveMaxAmmo(weapons[i]);
        wait 0.5;
    }
}


// =========================================================================
//  FUNCTIONS WITH INPUT
//  GUIDE REF: Section 16 (Function With Input)
//  One function, multiple menu options, each passing different input
// =========================================================================

// --- Give Weapon ---
// The 5th param of AddOption (input) is passed as first argument here.
giveWeap(weapon)
{
    self giveWeapon(weapon + "_mp");
    self switchToWeapon(weapon + "_mp");
    self giveMaxAmmo(weapon + "_mp");
    self iPrintLn("Gave: " + weapon);
}

// --- Set Killstreak Count ---
setKillstreak(count)
{
    self.killstreakcount = count;
    self iPrintLn("Killstreak set to: " + count);
}


// =========================================================================
//  SIMPLE ACTION FUNCTIONS (no toggle, just do once)
// =========================================================================

// --- Refill Ammo ---
refillAmmo()
{
    weapons = self getWeaponsList();
    for (i = 0; i < weapons.size; i++)
        self giveMaxAmmo(weapons[i]);
    self iPrintLn("Ammo Refilled");
}

// --- Suicide ---
doSuicide()
{
    self suicide();
}

// --- Full Heal ---
fullHeal()
{
    self.health = self.maxhealth;
    self iPrintLn("Health Restored");
}

// --- Save Position ---
savePosition()
{
    self.pers["saved_origin"] = self getOrigin();
    self.pers["saved_angles"] = self getPlayerAngles();
    self iPrintLn("Position ^2Saved");
}

// --- Load Position ---
loadPosition()
{
    if (isDefined(self.pers["saved_origin"]))
    {
        self setOrigin(self.pers["saved_origin"]);
        self setPlayerAngles(self.pers["saved_angles"]);
        self iPrintLn("Position ^2Loaded");
    }
    else
        self iPrintLn("^1No saved position");
}

// --- Take All Weapons ---
stripWeapons()
{
    self takeAllWeapons();
    self iPrintLn("Weapons Stripped");
}


// =========================================================================
//  SLIDER CALLBACK FUNCTIONS
//  GUIDE REF: Section 18 (AddSlider)
//  These receive the new value when the slider changes
// =========================================================================

// --- Speed Slider Callback ---
// Called by AddDvarSlider - receives the new dvar value automatically
// (no function body needed if you just want the dvar to change)
// But if you want to also print feedback:
onSpeedChange(value)
{
    self iPrintLn("Speed: " + int(value));
}

onGravityChange(value)
{
    self iPrintLn("Gravity: " + int(value));
}

onJumpChange(value)
{
    self iPrintLn("Jump: " + int(value));
}


// =========================================================================
//  ARRAY SLIDER CALLBACKS
//  GUIDE REF: Section 18 (AddArraySlider)
//  Called with the currently selected array value when user presses select
// =========================================================================

changeMap(map)
{
    self iPrintLn("Next map: " + map);
    setDvar("sv_maprotation", "gametype war map " + map);
}

changeGametype(gametype)
{
    self iPrintLn("Gametype: " + gametype);
    setDvar("g_gametype", gametype);
}


// =========================================================================
//  BIND SLIDER FUNCTIONS
//  GUIDE REF: Section 18 (AddBindSliders)
//  These are started when the player selects a button for the bind.
//  Parameters: button = the +command string, pers = the pers key name
// =========================================================================

// --- Save Location Bind ---
// Player picks a button (e.g. +smoke), then pressing that button saves position.
saveLocBind(button, pers)
{
    self endon("disconnect");
    self endon("death");
    self notify("stop" + pers);
    self endon("stop" + pers);
    self notifyOnPlayerCommand("dosaveLoc", button);
    for (;;)
    {
        self waittill("dosaveLoc");
        self.pers["saved_origin"] = self getOrigin();
        self.pers["saved_angles"] = self getPlayerAngles();
        self iPrintLn("Position ^2Saved");
    }
}

// --- Refill Ammo Bind ---
// Player picks a button, pressing it refills ammo.
refillBind(button, pers)
{
    self endon("disconnect");
    self endon("death");
    self notify("stop" + pers);
    self endon("stop" + pers);
    self notifyOnPlayerCommand("doRefill", button);
    for (;;)
    {
        self waittill("doRefill");
        self thread refillAmmo();
    }
}


// =========================================================================
//  ESP / WALLHACK (Looping function example with visual feedback)
// =========================================================================

espToggle()
{
    if (self getPers("esploop") == "Off")
    {
        self setPers("esploop", "On");
        self iPrintLn("ESP: ^2On");
        self thread espLoop();
    }
    else
    {
        self setPers("esploop", "Off");
        self notify("stop_esp");
        self iPrintLn("ESP: ^1Off");
    }
}

espLoop()
{
    self endon("disconnect");
    self endon("death");
    self notify("stop_esp");
    self endon("stop_esp");
    for (;;)
    {
        players = getEntArray("player", "classname");
        for (i = 0; i < players.size; i++)
        {
            if (isDefined(players[i]) && isAlive(players[i]) && players[i] != self)
                players[i] setClientDvar("waypointIconHeight", 20);
        }
        wait 0.5;
    }
}


// =========================================================================
//  CFG LISTENER FUNCTIONS
//  GUIDE REF: Section 20 (Setting Up a +Command in GSC)
//             Section 21 (Making a Menu Function Also Work as a +Command)
//             Section 22 (Making a Bind Callable With a +Command)
//
//  PATTERN: Each cfg listener does 3 things:
//    1. notifyOnPlayerCommand - registers the +command
//    2. waittill - waits for the +command to fire
//    3. thread the actual function
//
//  These are threaded in _main.gsc onPlayerSpawned().
//  The player binds them in a .cfg file: bind G "+godmode"
// =========================================================================

// --- God Mode via +godmode ---
// .cfg: bind G "+godmode"
godmodeCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_godmode", "+godmode");
    for (;;)
    {
        self waittill("cfg_godmode");
        self thread godmode();
    }
}

// --- UFO via +ufo ---
// .cfg: bind U "+ufo"
ufoCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_ufo", "+ufo");
    for (;;)
    {
        self waittill("cfg_ufo");
        self thread ufo();
    }
}

// --- Speed via +speed ---
// .cfg: bind H "+speed"
speedCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_speed", "+speed");
    for (;;)
    {
        self waittill("cfg_speed");
        self thread speed();
    }
}

// --- Max Ammo via +maxammo ---
// .cfg: bind J "+maxammo"
maxammoCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_maxammo", "+maxammo");
    for (;;)
    {
        self waittill("cfg_maxammo");
        self thread maxammo();
    }
}

// --- Refill Ammo via +refill (one-shot, not a toggle) ---
// .cfg: bind R "+refill"
refillCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_refill", "+refill");
    for (;;)
    {
        self waittill("cfg_refill");
        self thread refillAmmo();
    }
}

// --- Save Position via +save ---
// .cfg: bind F5 "+save"
saveCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_save", "+save");
    for (;;)
    {
        self waittill("cfg_save");
        self thread savePosition();
    }
}

// --- Load Position via +load ---
// .cfg: bind F6 "+load"
loadCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_load", "+load");
    for (;;)
    {
        self waittill("cfg_load");
        self thread loadPosition();
    }
}

// --- Suicide via +die ---
// .cfg: bind K "+die"
suicideCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_suicide", "+die");
    for (;;)
    {
        self waittill("cfg_suicide");
        self thread doSuicide();
    }
}

// --- ESP via +esp ---
// .cfg: bind F1 "+esp"
espCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_esp", "+esp");
    for (;;)
    {
        self waittill("cfg_esp");
        self thread espToggle();
    }
}

// --- Full Heal via +heal ---
// .cfg: bind F2 "+heal"
healCfg()
{
    self endon("disconnect");
    self endon("death");
    self notifyOnPlayerCommand("cfg_heal", "+heal");
    for (;;)
    {
        self waittill("cfg_heal");
        self thread fullHeal();
    }
}
