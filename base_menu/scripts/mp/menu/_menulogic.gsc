#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\menu\_structure;

freezeMenuControls(state)
{
    if (state)
        self notify("disable_menu_controls");
    else
        self thread menuButtons();
}

menuButtons()
{
    self thread monitorOpen();
    self thread menuScrollUp();
    self thread menuScrollDown();
    self thread menuSliderLeft();
    self thread menuSliderRight();
    self thread dvarSliderLeft();
    self thread dvarSliderRight();
    self thread arrayLeft();
    self thread arrayRight();
    self thread bindLeft();
    self thread bindRight();
    self thread menuUse();
    self thread menuClose();
}

monitorOpen()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("menuOpen", "+actionslot 2");
    for (;;)
    {
        self waittill("menuOpen");
        if (self adsButtonPressed())
        {
            if (!self.menu.isopen)
            {
                self.menu.isopen = true;
                self LoadMenu("Main");
            }
        }
    }
}

menuScrollUp()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("menuUp", "+actionslot 1");
    self.menu.upCooldown = false;
    for (;;)
    {
        self waittill("menuUp");
        if (self.menu.isopen && self getPers("ufo") == "Off" && !self.menu.upCooldown)
        {
            self.menu.upCooldown = true;
            self.menu.scroll--;
            self UpdateScroll();
            wait 0.1;
            self.menu.upCooldown = false;
        }
    }
}

menuScrollDown()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("menuDown", "+actionslot 2");
    self.menu.downCooldown = false;
    for (;;)
    {
        self waittill("menuDown");
        if (self.menu.isopen && self getPers("ufo") == "Off" && !self.menu.downCooldown)
        {
            self.menu.downCooldown = true;
            self.menu.scroll++;
            self UpdateScroll();
            wait 0.1;
            self.menu.downCooldown = false;
        }
    }
}

menuSliderLeft()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("slideLeft", "+actionslot 3");
    for (;;)
    {
        self waittill("slideLeft");
        if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "slider" && self.menu.isopen)
        {
            pers = self.menu.pers[self.menu.current][self.menu.scroll];
            value = self getPers(pers);

            value -= self.menu.amount[self.menu.current][self.menu.scroll];
            if (value < self.menu.min[self.menu.current][self.menu.scroll])
                value = self.menu.max[self.menu.current][self.menu.scroll];

            self setPers(pers, value);
            self ExecuteFunction(self.menu.func[self.menu.current][self.menu.scroll], self getPers(pers));
            self LoadMenu(self.menu.current);
        }
    }
}

menuSliderRight()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("slideRight", "+actionslot 4");
    for (;;)
    {
        self waittill("slideRight");
        if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "slider" && self.menu.isopen)
        {
            pers = self.menu.pers[self.menu.current][self.menu.scroll];
            value = self getPers(pers);

            value += self.menu.amount[self.menu.current][self.menu.scroll];
            if (value > self.menu.max[self.menu.current][self.menu.scroll])
                value = self.menu.min[self.menu.current][self.menu.scroll];

            self setPers(pers, value);
            self ExecuteFunction(self.menu.func[self.menu.current][self.menu.scroll], self getPers(pers));
            self LoadMenu(self.menu.current);
        }
    }
}

dvarSliderLeft()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("dvarLeft", "+actionslot 3");
    for (;;)
    {
        self waittill("dvarLeft");
        if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "dvar" && self.menu.isopen)
        {
            dvar = self.menu.dvar[self.menu.current][self.menu.scroll];
            value = getDvarFloat(dvar);

            value -= self.menu.amount[self.menu.current][self.menu.scroll];
            if (value < self.menu.min[self.menu.current][self.menu.scroll])
                value = self.menu.max[self.menu.current][self.menu.scroll];

            setDvar(dvar, value);
            self ExecuteFunction(self.menu.func[self.menu.current][self.menu.scroll], getDvarFloat(dvar));
            self LoadMenu(self.menu.current);
        }
    }
}

dvarSliderRight()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("dvarRight", "+actionslot 4");
    for (;;)
    {
        self waittill("dvarRight");
        if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "dvar" && self.menu.isopen)
        {
            dvar = self.menu.dvar[self.menu.current][self.menu.scroll];
            value = getDvarFloat(dvar);

            value += self.menu.amount[self.menu.current][self.menu.scroll];
            if (value > self.menu.max[self.menu.current][self.menu.scroll])
                value = self.menu.min[self.menu.current][self.menu.scroll];

            setDvar(dvar, value);
            self ExecuteFunction(self.menu.func[self.menu.current][self.menu.scroll], getDvarFloat(dvar));
            self LoadMenu(self.menu.current);
        }
    }
}

arrayLeft()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("arrayLeft", "+actionslot 3");
    for (;;)
    {
        self waittill("arrayLeft");
        if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "array" && self.menu.isopen)
        {
            array = self.menu.array[self.menu.current][self.menu.scroll];
            arrayname = self.menu.arrayname[self.menu.current][self.menu.scroll];
            index = int(self getPers("arrayindex_" + arrayname));

            index--;
            if (index < 0)
                index = array.size - 1;

            self setPers("arrayindex_" + arrayname, index);
            self LoadMenu(self.menu.current);
        }
    }
}

arrayRight()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("arrayRight", "+actionslot 4");
    for (;;)
    {
        self waittill("arrayRight");
        if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "array" && self.menu.isopen)
        {
            array = self.menu.array[self.menu.current][self.menu.scroll];
            arrayname = self.menu.arrayname[self.menu.current][self.menu.scroll];
            index = int(self getPers("arrayindex_" + arrayname));

            index++;
            if (index >= array.size)
                index = 0;

            self setPers("arrayindex_" + arrayname, index);
            self LoadMenu(self.menu.current);
        }
    }
}

bindLeft()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("bindLeft", "+actionslot 3");
    for (;;)
    {
        self waittill("bindLeft");
        if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "bind" && self.menu.isopen)
        {
            pers = self.menu.pers[self.menu.current][self.menu.scroll];
            self notify("stop" + pers);

            switch (self getPers(pers))
            {
                case "Off":
                    self setPers(pers, "+smoke");
                    break;
                case "+smoke":
                    self setPers(pers, "+frag");
                    break;
                case "+frag":
                    self setPers(pers, "+actionslot 4");
                    break;
                case "+actionslot 4":
                    self setPers(pers, "+actionslot 3");
                    break;
                case "+actionslot 3":
                    self setPers(pers, "+actionslot 2");
                    break;
                case "+actionslot 2":
                    self setPers(pers, "+actionslot 1");
                    break;
                case "+actionslot 1":
                    self setPers(pers, "Off");
                    break;
            }

            if (self getPers(pers) != "Off")
                self ExecuteFunction(self.menu.func[self.menu.current][self.menu.scroll], self getPers(pers), pers);
            self LoadMenu(self.menu.current);
        }
    }
}

bindRight()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("bindRight", "+actionslot 4");
    for (;;)
    {
        self waittill("bindRight");
        if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "bind" && self.menu.isopen)
        {
            pers = self.menu.pers[self.menu.current][self.menu.scroll];
            self notify("stop" + pers);

            switch (self getPers(pers))
            {
                case "Off":
                    self setPers(pers, "+actionslot 1");
                    break;
                case "+actionslot 1":
                    self setPers(pers, "+actionslot 2");
                    break;
                case "+actionslot 2":
                    self setPers(pers, "+actionslot 3");
                    break;
                case "+actionslot 3":
                    self setPers(pers, "+actionslot 4");
                    break;
                case "+actionslot 4":
                    self setPers(pers, "+frag");
                    break;
                case "+frag":
                    self setPers(pers, "+smoke");
                    break;
                case "+smoke":
                    self setPers(pers, "Off");
                    break;
            }

            if (self getPers(pers) != "Off")
                self ExecuteFunction(self.menu.func[self.menu.current][self.menu.scroll], self getPers(pers), pers);
            self LoadMenu(self.menu.current);
        }
    }
}

menuUse()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("menuUse", "+usereload");
    for (;;)
    {
        self waittill("menuUse");
        if (self.menu.isopen)
        {
            if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "none")
            {
                self ExecuteFunction(self.menu.func[self.menu.current][self.menu.scroll], self.menu.input[self.menu.current][self.menu.scroll], self.menu.input2[self.menu.current][self.menu.scroll]);
                self LoadMenu(self.menu.current);
            }
            else if (self.menu.slidertype[self.menu.current][self.menu.scroll] == "array")
            {
                arrayname = self.menu.arrayname[self.menu.current][self.menu.scroll];
                self ExecuteFunction(self.menu.func[self.menu.current][self.menu.scroll], level.arrayscrolls[arrayname][int(self getPers("arrayindex_" + arrayname))]);
                self LoadMenu(self.menu.current);
            }
        }
    }
}

menuClose()
{
    self endon("disconnect");
    self endon("disable_menu_controls");
    self endon("death");
    self notifyOnPlayerCommand("menuClose", "+melee");
    for (;;)
    {
        self waittill("menuClose");
        if (self.menu.isopen && self getPers("ufo") == "Off")
        {
            if (self.menu.parent[self.menu.current] == "exit")
            {
                self DestroyMenuHud();
                self.menu.isopen = false;
                self freezeControls(false);
            }
            else
                self LoadMenu(self.menu.parent[self.menu.current]);
        }
    }
}

UpdateScroll()
{
    if (self.menu.scroll < 0)
        self.menu.scroll = self.menu.text[self.menu.current].size - 1;

    if (self.menu.scroll > self.menu.text[self.menu.current].size - 1)
        self.menu.scroll = 0;

    if (!isDefined(self.menu.text[self.menu.current][self.menu.scroll - self.menu.maxsizehalf]) || self.menu.text[self.menu.current].size <= self.menu.maxsize)
    {
        for (i = 0; i < self.menu.maxsize; i++)
        {
            if (isDefined(self.menu.text[self.menu.current][i]))
                self.hud["text"][i] setSafeText(self.menu.text[self.menu.current][i]);
            else
                self.hud["text"][i] setSafeText("");
            self.hud["bool_text"][i] setSafeText(self.menu.bool[self.menu.current][i]);
        }
        self.hud["scroll"].y = -128 + (15 * self.menu.scroll);
        self.hud["select_bar"].y = -128 + (15 * self.menu.scroll);
    }
    else if (isDefined(self.menu.text[self.menu.current][self.menu.scroll + self.menu.maxsizehalf]))
    {
        index = 0;
        for (i = self.menu.scroll - self.menu.maxsizehalf; i < self.menu.scroll + self.menu.maxsizehalf; i++)
        {
            if (isDefined(self.menu.text[self.menu.current][i]))
                self.hud["text"][index] setSafeText(self.menu.text[self.menu.current][i]);
            else
                self.hud["text"][index] setSafeText("");
            self.hud["bool_text"][index] setSafeText(self.menu.bool[self.menu.current][i]);
            index++;
        }
        self.hud["scroll"].y = -128 + (15 * self.menu.maxsizehalf);
        self.hud["select_bar"].y = -128 + (15 * self.menu.maxsizehalf);
    }
    else
    {
        for (i = 0; i < self.menu.maxsize; i++)
        {
            self.hud["text"][i] setSafeText(self.menu.text[self.menu.current][self.menu.text[self.menu.current].size + i - self.menu.maxsize]);
            self.hud["bool_text"][i] setSafeText(self.menu.bool[self.menu.current][self.menu.bool[self.menu.current].size + i - self.menu.maxsize]);
        }
        self.hud["scroll"].y = -128 + (15 * (self.menu.scroll - self.menu.text[self.menu.current].size + self.menu.maxsize));
        self.hud["select_bar"].y = -128 + (15 * (self.menu.scroll - self.menu.text[self.menu.current].size + self.menu.maxsize));
    }
}
