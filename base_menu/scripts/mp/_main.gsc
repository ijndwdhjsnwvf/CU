#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\_functions;

// =========================================================================
//  init()
//  GUIDE REF: Section 4 (_main.gsc), Section 9 (init Entry Point)
//  Called once by the engine when the match starts.
//  "self" here is the level, NOT a player.
// =========================================================================
init()
{
    // =================================================================
    //  PRECACHING
    //  GUIDE REF: SETUP_GUIDE Section 19 (Precaching Resources)
    //
    //  Precaching MUST happen in init(), BEFORE onPlayerConnect.
    //  You cannot precache mid-game. If you try, you get:
    //    "precacheItem: can only be called during level load"
    //
    //  Precache anything you plan to give/spawn/display:
    //    precacheItem()   - weapons
    //    precacheShader() - images, textures (for HUD or .iwd custom art)
    //    precacheModel()  - 3D models (from stock or .iwd)
    //    precacheString() - strings for some HUD functions
    //
    //  If the asset is in a .iwd file, precache it the same way.
    //  The engine finds it automatically from any loaded .iwd.
    // =================================================================

    // --- Weapon precaching ---
    // Uncomment any weapon you want to use with giveWeapon()
    // precacheItem("cheytac_mp");
    // precacheItem("deserteaglegold_mp");
    // precacheItem("ak47_mp");
    // precacheItem("m4_mp");
    // precacheItem("ump45_mp");
    // precacheItem("spas12_mp");
    // precacheItem("rpg_mp");
    // precacheItem("barrett_mp");

    // --- Shader precaching ---
    // Stock shaders (already in game, but precache if you use them in HUD):
    // precacheShader("white");
    // precacheShader("minimap_scanlines");
    //
    // Custom shaders from .iwd files:
    // precacheShader("my_custom_image");
    // The image file must be at images/my_custom_image.iwi inside your .iwd

    // --- Model precaching ---
    // precacheModel("com_plasticcase_friendly");
    // For custom models in .iwd: precacheModel("my_model");
    // The model file must be at xmodel/my_model inside your .iwd

    level thread onPlayerConnect();
}

// =========================================================================
//  onPlayerConnect()
//  GUIDE REF: Section 4, SETUP_GUIDE Section 9
//  Loops forever on level. Catches "connected" event for each player.
// =========================================================================
onPlayerConnect()
{
    while (true)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

// =========================================================================
//  onPlayerSpawned()
//  GUIDE REF: Section 4, SETUP_GUIDE Section 9
//  Loops forever on each player. Runs every time they spawn/respawn.
//  This is where you:
//    1. Set up the menu system
//    2. Call functions_calls() to init pers/dvars/binds
//    3. Thread all cfg listeners so +commands work
// =========================================================================
onPlayerSpawned()
{
    while (true)
    {
        self waittill("spawned_player");

        // Only the host runs the overflow fix (prevents string crashes)
        if (self isHost())
            self thread OverflowFixInit();

        // Skip bots - they don't need menus or cfg listeners
        if (!self.pers["isBot"])
        {
            // --- Menu Setup ---
            // GUIDE REF: Section 7 (_setupmenu.gsc)
            self scripts\mp\menu\_setupmenu::SetupMenu();
            self freezeControls(false);
            self iPrintLn("[{+speed_throw}] & [{+actionslot 2}] to open menu");

            // --- Initialize all pers, dvars, and binds ---
            // GUIDE REF: Section 6 (_functions.gsc)
            self thread functions_calls();

            // =============================================================
            //  CFG LISTENERS
            //  GUIDE REF: Section 20 (Setting Up a +Command)
            //             Section 21 (Menu Function Also as +Command)
            //             Section 22 (Bind Callable With +Command)
            //
            //  Each cfg listener is threaded here so it starts on every
            //  spawn. They die on death (endon "death") and restart here.
            //
            //  To add a new cfg command:
            //    1. Write the function in _functions.gsc
            //    2. Write a cfg listener (xxxCfg) in _functions.gsc
            //    3. Thread it here: self thread xxxCfg();
            //    4. Bind in .cfg: bind KEY "+commandname"
            // =============================================================

            // Toggle commands (menu function + cfg command)
            self thread godmodeCfg();     // bind G "+godmode"
            self thread ufoCfg();         // bind U "+ufo"
            self thread speedCfg();       // bind H "+speed"
            self thread maxammoCfg();     // bind J "+maxammo"
            self thread espCfg();         // bind F1 "+esp"

            // Action commands (one-shot, not toggles)
            self thread refillCfg();      // bind R "+refill"
            self thread saveCfg();        // bind F5 "+save"
            self thread loadCfg();        // bind F6 "+load"
            self thread suicideCfg();     // bind K "+die"
            self thread healCfg();        // bind F2 "+heal"
        }
    }
}
