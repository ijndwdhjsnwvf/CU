#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;

SetupMenu()
{
    self.menu = spawnStruct();
    self.menu.isopen = false;
    self.menu.smoothscroll = false;
    self.menu.color = [];
    self.menu.color["background"] = (0, 0, 0);
    self.menu.color["accent"] = (0.6, 0.0, 1.0);
    self.menu.color["white"] = (1, 1, 1);
    self.menu.maxsize = 10;
    self.menu.maxsizehalf = 6;

    self thread updateBarColors();
    self thread scripts\mp\menu\_menulogic::menuButtons();
    self thread closeOnDeath();
    self CreateNotifys();
}

CreateNotifys()
{
    foreach (value in strTok("+actionslot 1,+actionslot 2,+actionslot 3,+actionslot 4,+frag,+smoke", ","))
        self notifyOnPlayerCommand(value, value);
}

closeOnDeath()
{
    self endon("disconnect");
    for (;;)
    {
        self waittill("death");
        self thread scripts\mp\menu\_menuutils::DestroyMenuHud();
        self.menu.isopen = false;
        self.menu.built = false;
        self freezeControls(false);
    }
}
