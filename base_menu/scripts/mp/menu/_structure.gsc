#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\_functions;

// =========================================================================
//  Structure()
//  GUIDE REF: Section 10 (_structure.gsc)
//  Called every time a menu is opened (via LoadMenu).
//  Rebuilds all menu data fresh so toggle states update in real time.
//
//  This example shows:
//    - Main menu linking to submenus (Section 13: Adding New Submenus)
//    - AddOption with toggles (Section 12, 15)
//    - AddOption with input (Section 16)
//    - AddDvarSlider (Section 18)
//    - AddArraySlider (Section 18)
//    - AddBindSliders (Section 18)
//    - Nested submenus (Section 14)
// =========================================================================
Structure()
{
    // =================================================================
    //  MAIN MENU
    //  GUIDE REF: Section 13 (Adding New Submenus)
    //  CreateMenu("Main", "exit") -> close menu entirely on back
    //  Each option uses ::LoadMenu to open a submenu
    // =================================================================
    self CreateMenu("Main", "exit");
    self AddOption("Main", "Player", ::LoadMenu, undefined, "Player");
    self AddOption("Main", "Weapons", ::LoadMenu, undefined, "Weapons");
    self AddOption("Main", "Settings", ::LoadMenu, undefined, "Settings");
    self AddOption("Main", "Teleport", ::LoadMenu, undefined, "Teleport");
    self AddOption("Main", "Binds", ::LoadMenu, undefined, "Binds");

    // =================================================================
    //  PLAYER SUBMENU
    //  Shows: AddOption with toggle (bool display), simple actions
    //  GUIDE REF: Section 12 (Adding Options), Section 15 (Toggle)
    // =================================================================
    self CreateMenu("Player", "Main");
    //                menu       text            function      bool (right side)
    self AddOption("Player", "God Mode",      ::godmode,    self getPers("god"));
    self AddOption("Player", "UFO Mode",      ::ufo,        self getPers("ufo"));
    self AddOption("Player", "Speed Boost",   ::speed,      self getPers("speed"));
    self AddOption("Player", "Max Ammo",      ::maxammo,    self getPers("maxammo"));
    self AddOption("Player", "ESP",           ::espToggle,  self getPers("esploop"));
    self AddOption("Player", "Refill Ammo",   ::refillAmmo);
    self AddOption("Player", "Full Heal",     ::fullHeal);
    self AddOption("Player", "Suicide",       ::doSuicide);

    // =================================================================
    //  WEAPONS SUBMENU
    //  Shows: AddOption with input param (Section 16: Function With Input)
    //  Same function (::giveWeap), different input for each option
    // =================================================================
    self CreateMenu("Weapons", "Main");
    //                menu        text                function    bool  input
    self AddOption("Weapons", "Intervention",     ::giveWeap, undefined, "cheytac");
    self AddOption("Weapons", "Barrett .50",      ::giveWeap, undefined, "barrett");
    self AddOption("Weapons", "AK-47",            ::giveWeap, undefined, "ak47");
    self AddOption("Weapons", "M4A1",             ::giveWeap, undefined, "m4");
    self AddOption("Weapons", "UMP45",            ::giveWeap, undefined, "ump45");
    self AddOption("Weapons", "SPAS-12",          ::giveWeap, undefined, "spas12");
    self AddOption("Weapons", "Desert Eagle",     ::giveWeap, undefined, "deserteaglegold");
    self AddOption("Weapons", "RPG",              ::giveWeap, undefined, "rpg");
    self AddOption("Weapons", "Strip Weapons",    ::stripWeapons);

    // =================================================================
    //  SETTINGS SUBMENU
    //  Shows: AddDvarSlider and nested submenu
    //  GUIDE REF: Section 18 (AddDvarSlider), Section 14 (Nesting)
    //
    //  AddDvarSlider(menu, text, func, dvar, min, max, step)
    //  Left/right changes the dvar directly. func is called with new value.
    //  Pass undefined as func if you just want the dvar to change silently.
    // =================================================================
    self CreateMenu("Settings", "Main");
    //                     menu         text           func              dvar         min  max   step
    self AddDvarSlider("Settings", "Speed",        ::onSpeedChange,   "g_speed",    100, 1000, 50);
    self AddDvarSlider("Settings", "Gravity",      ::onGravityChange, "g_gravity",  50,  1500, 50);
    self AddDvarSlider("Settings", "Jump Height",  ::onJumpChange,    "jump_height", 19, 999,  10);
    // Nested submenu for killstreaks
    self AddOption("Settings", "Killstreaks", ::LoadMenu, undefined, "Killstreaks");
    // Array slider for map selection
    self AddArraySlider("Settings", "Next Map", ::changeMap, strTok("mp_afghan,mp_rust,mp_terminal,mp_highrise,mp_favela,mp_quarry", ","), "mapselect");
    self AddArraySlider("Settings", "Gametype", ::changeGametype, strTok("war,dm,dom,sd,sab,koth", ","), "gtselect");

    // =================================================================
    //  KILLSTREAKS NESTED SUBMENU
    //  Shows: Section 14 (Nesting Submenus)
    //  Parent is "Settings" so back goes to Settings, not Main.
    //  Shows: Function with input (Section 16)
    // =================================================================
    self CreateMenu("Killstreaks", "Settings");
    self AddOption("Killstreaks", "Set 3 Kills",  ::setKillstreak, undefined, 3);
    self AddOption("Killstreaks", "Set 5 Kills",  ::setKillstreak, undefined, 5);
    self AddOption("Killstreaks", "Set 7 Kills",  ::setKillstreak, undefined, 7);
    self AddOption("Killstreaks", "Set 11 Kills", ::setKillstreak, undefined, 11);
    self AddOption("Killstreaks", "Set 25 Kills", ::setKillstreak, undefined, 25);

    // =================================================================
    //  TELEPORT SUBMENU
    //  Shows: Simple action functions
    // =================================================================
    self CreateMenu("Teleport", "Main");
    self AddOption("Teleport", "Save Position",  ::savePosition);
    self AddOption("Teleport", "Load Position",  ::loadPosition);

    // =================================================================
    //  BINDS SUBMENU
    //  Shows: AddBindSliders (Section 18: AddBindSliders)
    //  Player picks which button activates each bind.
    //  Cycles through: Off, +smoke, +frag, +actionslot 4, 3, 2, 1
    // =================================================================
    self CreateMenu("Binds", "Main");
    //                      menu      text              function        pers key
    self AddBindSliders("Binds", "Save Location", ::saveLocBind,  "savelocbind");
    self AddBindSliders("Binds", "Refill Ammo",   ::refillBind,   "refillbind");
}
