#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;

isInMenu()
{
    return self.menu.isopen;
}

CreateMenu(menu, parent)
{
    self.menu.text[menu] = [];
    self.menu.bool[menu] = [];
    self.menu.parent[menu] = parent;
}

AddOption(menu, text, func, bool, input, input2)
{
    index = self.menu.text[menu].size;
    if (isDefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::PlaceHolder;
    if (isDefined(bool))
        self.menu.bool[menu][index] = "[" + bool + "]";
    else
        self.menu.bool[menu][index] = "";
    if (isDefined(func) && func == ::LoadMenu)
        self.menu.bool[menu][index] = ">";
    self.menu.text[menu][index] = text;
    self.menu.input[menu][index] = input;
    self.menu.input2[menu][index] = input2;
    self.menu.slidertype[menu][index] = "none";
}

AddSlider(menu, text, func, pers, min, max, amount)
{
    index = self.menu.text[menu].size;
    if (isDefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::PlaceHolder;
    self.menu.text[menu][index] = text;
    self.menu.bool[menu][index] = "[" + self getPers(pers) + "]";
    self.menu.pers[menu][index] = pers;
    self.menu.min[menu][index] = min;
    self.menu.max[menu][index] = max;
    self.menu.amount[menu][index] = amount;
    self.menu.slidertype[menu][index] = "slider";
}

AddDvarSlider(menu, text, func, dvar, min, max, amount, player)
{
    index = self.menu.text[menu].size;
    if (isDefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::PlaceHolder;
    if (isDefined(player))
        self.menu.bool[menu][index] = "[" + player.name + "]";
    else
        self.menu.bool[menu][index] = "[" + getDvarFloat(dvar) + "]";
    self.menu.text[menu][index] = text;
    self.menu.dvar[menu][index] = dvar;
    self.menu.min[menu][index] = min;
    self.menu.max[menu][index] = max;
    self.menu.amount[menu][index] = amount;
    self.menu.slidertype[menu][index] = "dvar";
}

AddArraySlider(menu, text, func, array, arrayname, input)
{
    index = self.menu.text[menu].size;
    if (!isDefined(level.arrayscrolls))
        level.arrayscrolls = [];
    level.arrayscrolls[arrayname] = array;
    self.menu.array[menu][index] = array;
    self.menu.arrayname[menu][index] = arrayname;
    if (!isDefined(self getPers("arrayindex_" + arrayname)))
        self setPers("arrayindex_" + arrayname, 0);
    self.menu.bool[menu][index] = "[" + level.arrayscrolls[arrayname][int(self getPers("arrayindex_" + arrayname))] + "]";
    if (isDefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::PlaceHolder;
    self.menu.text[menu][index] = text;
    self.menu.input[menu][index] = input;
    self.menu.slidertype[menu][index] = "array";
}

AddBindSliders(menu, text, func, pers)
{
    index = self.menu.text[menu].size;
    if (isDefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::PlaceHolder;
    self.menu.text[menu][index] = text;
    if (self getPers(pers) != "[Off]")
        self.menu.bool[menu][index] = "[[{" + self getPers(pers) + "}]]";
    else
        self.menu.bool[menu][index] = self getPers(pers);
    self.menu.pers[menu][index] = pers;
    self.menu.slidertype[menu][index] = "bind";
}

LoadMenu(menu)
{
    self scripts\mp\menu\_structure::Structure();
    self.menu.smoothscroll = false;
    self.menu.lastscroll[self.menu.current] = self.menu.scroll;
    if (self isInMenu())
        self DestroyMenuHud();
    self.menu.current = menu;
    if (!isDefined(self.menu.lastscroll[self.menu.current]))
        self.menu.scroll = 0;
    else
        self.menu.scroll = self.menu.lastscroll[self.menu.current];
    self CreateMenuHud();
    self scripts\mp\menu\_menulogic::UpdateScroll();
    self UpdateMenuBackground();
    self.menu.smoothscroll = true;
}

ExecuteFunction(f, i1, i2)
{
    if (isDefined(i2))
        return self thread [[f]](i1, i2);
    else if (isDefined(i1))
        return self thread [[f]](i1);
    return self thread [[f]]();
}

DestroyMenuHud()
{
    self notify("endCordsUpdate");
    foreach (key, element in self.hud)
    {
        if (key != "text" && key != "bool_text")
            element destroy();
        else
        {
            foreach (text_element in self.hud[key])
                text_element destroy();
        }
    }
}

CreateMenuHud()
{
    self.hud = [];

    self.hud["background"] = self createRectangle("white", "TOP", "CENTER", 278, -150, 155, 200, self.menu.color["background"], 0, 0.84);
    self.hud["left_bar"] = self createRectangle("white", "TOP", "CENTER", 202, -150, 2, 200, self.menu.color["accent"], 3, 1);
    self.hud["header_box"] = self createRectangle("white", "TOP", "CENTER", 278, -132, 155, 1, self.menu.color["accent"], 1, 0.9);
    self.hud["middle_bar"] = self createRectangle("white", "TOP", "CENTER", 278, -150, 155, 0, self.menu.color["background"], 3, 0);
    self.hud["top_bar"] = self createRectangle("white", "TOP", "CENTER", 278, -150, 155, 1, self.menu.color["accent"], 5, 0.7);
    self.hud["right_bar"] = self createRectangle("white", "TOP", "CENTER", 356, -150, 1, 200, self.menu.color["white"], 5, 0.2);
    self.hud["bottom_bar"] = self createRectangle("white", "TOP", "CENTER", 278, 150, 155, 1, self.menu.color["white"], 5, 0.2);

    self.hud["left_bar"].foreground = true;
    self.hud["header_box"].foreground = true;
    self.hud["top_bar"].foreground = true;

    self.hud["title"] = self createText("bigfixed", 0.20, "CENTER", "CENTER", 278, -145, self.menu.color["white"], 5, 1, "B A S E   M E N U");
    self.hud["title"].fontStyle = 2;
    self.hud["title"].foreground = true;

    self.hud["subtitle"] = self createText("bigfixed", 0.17, "CENTER", "CENTER", 278, -137, self.menu.color["white"], 5, 0.88, "IW4x GSC Menu");
    self.hud["subtitle"].fontStyle = 2;
    self.hud["subtitle"].foreground = true;

    self.hud["footer_box"] = self createRectangle("white", "TOP", "CENTER", 278, 16, 155, 0, self.menu.color["background"], 1, 0);
    self.hud["footer"] = self createText("default", 0.01, "CENTER", "CENTER", 278, 24, self.menu.color["background"], 5, 0, " ");

    self.hud["scroll"] = self createRectangle("white", "CENTER", "CENTER", 278, -128, 151, 14, self.menu.color["accent"], 2, 0.10);
    self.hud["select_bar"] = self createRectangle("white", "CENTER", "CENTER", 204, -128, 3, 14, self.menu.color["accent"], 4, 1);
    self.hud["select_bar"].foreground = true;

    self.hud["cords"] = self createText("bigfixed", 0.35, "LEFT", "CENTER", -255, -190, self.menu.color["white"], 4, 1, " ");
    self.hud["instruc"] = self createText("bigfixed", 0.24, "CENTER", "CENTER", 0, 210, self.menu.color["white"], 4, 0.65, " ");
    self.hud["instruc"] setSafeText("Open [{+actionslot 2}]  Close [{+melee}]  Scroll [{+actionslot 1}][{+actionslot 2}]  Value [{+actionslot 3}][{+actionslot 4}]  Select [{+usereload}]");

    self.hud["text"] = [];
    self.hud["bool_text"] = [];

    for (i = 0; i < self.menu.maxsize; i++)
    {
        self.hud["text"][i] = self createText("bigfixed", 0.27, "LEFT", "CENTER", 209, -129 + (i * 15), self.menu.color["white"], 6, 1, "Option " + (i + 1));
        self.hud["bool_text"][i] = self createText("bigfixed", 0.27, "RIGHT", "CENTER", 349, -129 + (i * 15), self.menu.color["accent"], 6, 1, "[OFF]");
    }
}

updateBarColors()
{
    self endon("disconnect");
    self endon("death");
    hue = 0;
    for (;;)
    {
        if (self isInMenu())
        {
            rgb = getColorFromHue(hue, 1.0, 1.0);
            self.hud["header_box"].color = rgb;
            self.hud["top_bar"].color = rgb;
            self.hud["left_bar"].color = rgb;
            self.hud["scroll"].color = rgb;
            self.hud["select_bar"].color = rgb;
            self.hud["title"].color = rgb;
            for (i = 0; i < self.menu.maxsize; i++)
            {
                if (isDefined(self.hud["bool_text"][i]))
                    self.hud["bool_text"][i].color = rgb;
            }
            hue += 0.004;
            if (hue >= 1.0) hue -= 1.0;
        }
        wait 0.05;
    }
}

getColorFromHue(hue, saturation, value)
{
    hue = hue * 360;
    i = int(hue / 60) % 6;
    f = (hue / 60) - i;
    p = value * (1 - saturation);
    q = value * (1 - f * saturation);
    t = value * (1 - (1 - f) * saturation);

    switch (i)
    {
        case 0: return (value, t, p);
        case 1: return (q, value, p);
        case 2: return (p, value, t);
        case 3: return (p, q, value);
        case 4: return (t, p, value);
        case 5: return (value, p, q);
    }
    return (1, 1, 1);
}

cordsUpdate()
{
    self endon("endCordsUpdate");
    self endon("death");
    self endon("disconnect");
    while (self.menu.isopen)
    {
        self.hud["cords"] setSafeText(self getOrigin() + "\n" + self getPlayerAngles());
        wait 0.1;
    }
}

UpdateMenuBackground()
{
    amount = self.menu.text[self.menu.current].size;
    if (amount > self.menu.maxsize)
        amount = self.menu.maxsize;

    if (amount == 5 || amount == 7 || amount == 9)
        plusamount = 17;
    else
        plusamount = 16;

    totalHeight = plusamount + (15 * amount);

    self.hud["background"] setShader("white", 155, totalHeight);
    self.hud["left_bar"] setShader("white", 2, totalHeight);
    self.hud["right_bar"] setShader("white", 1, totalHeight);
    self.hud["bottom_bar"].y = -137 + (15 * amount);

    footerY = -150 + totalHeight;
    self.hud["footer_box"].y = footerY;
    self.hud["footer"].y = footerY + 8;
}
