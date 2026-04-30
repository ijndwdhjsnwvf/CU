#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\_functions;

init()
{
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    while (true)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    while (true)
    {
        self waittill("spawned_player");

        if (self isHost())
            self thread OverflowFixInit();

        if (!self.pers["isBot"])
        {
            self scripts\mp\menu\_setupmenu::SetupMenu();
            self freezeControls(false);
            self iPrintLn("[{+speed_throw}] & [{+actionslot 2}] to open menu");
            self thread functions_calls();
        }
    }
}
