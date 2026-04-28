#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;

IsInMenu() {
    return self.menu.isopen;
}

CreateMenu(menu, parent) {
    self.menu.text[menu] = [];
    self.menu.bool[menu] = [];
    self.menu.parent[menu] = parent;
}

AddOption(menu, text, func, bool, input, input2) {
    index = self.menu.text[menu].size;
    if(isdefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::PlaceHolder;
    if(isdefined(bool))
        self.menu.bool[menu][index] = "[" + bool + "]";
    else
        self.menu.bool[menu][index] = "";
    if(isdefined(func) && func == ::LoadMenu)
        self.menu.bool[menu][index] = ">";
    self.menu.text[menu][index] = text;
    self.menu.input[menu][index] = input;
    self.menu.input2[menu][index] = input2;
    self.menu.slidertype[menu][index] = "none";
}

AddSlider(menu, text, func, pers, min, max, amount) {
    index = self.menu.text[menu].size;
    if(isdefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::Placeholder;
    self.menu.text[menu][index] = text;
    self.menu.bool[menu][index] = "[" + self GetPers(pers) + "]";
    self.menu.pers[menu][index] = pers;
    self.menu.min[menu][index] = min;
    self.menu.max[menu][index] = max;
    self.menu.amount[menu][index] = amount;
    self.menu.slidertype[menu][index] = "slider";
}

AddDvarSlider(menu, text, func, dvar, min, max, amount, player) {
    index = self.menu.text[menu].size;
    if (isdefined(func)) {
        self.menu.func[menu][index] = func;
    } else {
        self.menu.func[menu][index] = ::Placeholder;
    }
    if (isdefined(player)) {
        self.menu.bool[menu][index] = "[" + player.name + "]";
    } else {
        self.menu.bool[menu][index] = "[" + GetDvarFloat(dvar) + "]";
    }
    self.menu.text[menu][index] = text;
    self.menu.dvar[menu][index] = dvar;
    self.menu.min[menu][index] = min;
    self.menu.max[menu][index] = max;
    self.menu.amount[menu][index] = amount;
    self.menu.slidertype[menu][index] = "dvar";
}

AddArraySlider(menu, text, func, array, arrayname, input) {
    index = self.menu.text[menu].size;
    if(!isdefined(level.arrayscrolls))
        level.arrayscrolls = [];
    level.arrayscrolls[arrayname] = array;
    self.menu.array[menu][index] = array;
    self.menu.arrayname[menu][index] = arrayname;
    if(!isdefined(self GetPers("arrayindex_" + arrayname)))
        self SetPers("arrayindex_" + arrayname, 0);
    self.menu.bool[menu][index] = "[" + level.arrayscrolls[arrayname][Int(self GetPers("arrayindex_" + arrayname))] + "]";
    if(isdefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::Placeholder;
    self.menu.text[menu][index] = text;
    self.menu.input[menu][index] = input;
    self.menu.slidertype[menu][index] = "array";
}

AddBindSliders(menu, text, func, pers) {
    index = self.menu.text[menu].size;
    if(isdefined(func))
        self.menu.func[menu][index] = func;
    else
        self.menu.func[menu][index] = ::Placeholder;
    self.menu.text[menu][index] = text;
    if(self GetPers(pers) != "[Off]")
        self.menu.bool[menu][index] = "[[{" + self GetPers(pers) + "}]]";
    else
        self.menu.bool[menu][index] = self GetPers(pers);
    self.menu.pers[menu][index] = pers;
    self.menu.slidertype[menu][index] = "bind";
}

LoadMenu(menu) {
    self scripts\mp\menu\_structure::Structure();
    self.menu.smoothscroll = false;
    self.menu.lastscroll[self.menu.current] = self.menu.scroll;
    if(self IsInMenu())
        self DestroyMenuHud();
    self.menu.current = menu;
    if(!isdefined(self.menu.lastscroll[self.menu.current]))
        self.menu.scroll = 0;
    else
        self.menu.scroll = self.menu.lastscroll[self.menu.current];
    self CreateMenuHud();

    self scripts\mp\menu\_menulogic::UpdateScroll();
    self UpdateMenuBackground();
    self.menu.smoothscroll = true;

}



ExecuteFunction(f, i1, i2) { 
    if(isdefined( i2 ))
        return self thread [[ f ]]( i1, i2 );
    else if(isdefined( i1 ))
        return self thread [[ f ]]( i1 );

    return self thread [[ f ]]();
}

DestroyMenuHud() {
    self notify("endCordsUpdate");
    foreach(key, element in self.hud) {
        if(key != "text" && key != "bool_text") {
            element Destroy();
        }
        else {
            foreach(text_element in self.hud[key]) {
                text_element Destroy();
            }
        }
    }
}

CreateMenuHud() {

    self.hud = [];

    self.hud["background"] = self CreateRectangle("white", "TOP", "CENTER", 278, -150, 155, 200, self.menu.color["backgorund"], 0, 0.84);

    self.hud["left_bar"] = self CreateRectangle("white", "TOP", "CENTER", 202, -150, 2, 200, self.menu.color["black"], 3, 1);

    self.hud["header_box"] = self CreateRectangle("white", "TOP", "CENTER", 278, -132, 155, 1, self.menu.color["black"], 1, 0.9);

    self.hud["middle_bar"] = self CreateRectangle("white", "TOP", "CENTER", 278, -150, 155, 0, self.menu.color["backgorund"], 3, 0);

    self.hud["top_bar"]    = self CreateRectangle("white", "TOP", "CENTER", 278, -150, 155, 1, self.menu.color["black"], 5, 0.7);
    self.hud["right_bar"]  = self CreateRectangle("white", "TOP", "CENTER", 356, -150, 1, 200, self.menu.color["white"], 5, 0.2);
    self.hud["bottom_bar"] = self CreateRectangle("white", "TOP", "CENTER", 278, 150,  155, 1, self.menu.color["white"], 5, 0.2);

    self.hud["left_bar"].foreground   = true;
    self.hud["header_box"].foreground = true;
    self.hud["top_bar"].foreground    = true;

    self.hud["title"] = self createText("bigfixed", 0.20, "CENTER", "CENTER", 278, -145, self.menu.color["white"], 5, 1, "C O U N T E R   U A V");
    self.hud["title"].fontStyle = 2;
    self.hud["title"].foreground = true;

    self.hud["subtitle"] = self createText("bigfixed", 0.17, "CENTER", "CENTER", 278, -137, self.menu.color["white"], 5, 0.88, "@killstreak_uav");
    self.hud["subtitle"].fontStyle = 2;
    self.hud["subtitle"].foreground = true;

    self.hud["footer_box"] = self CreateRectangle("white", "TOP", "CENTER", 278, 16, 155, 0, self.menu.color["backgorund"], 1, 0);
    self.hud["footer"] = self createText("default", 0.01, "CENTER", "CENTER", 278, 24, self.menu.color["backgorund"], 5, 0, " ");

    self.hud["scroll"] = self CreateRectangle("white", "CENTER", "CENTER", 278, -128, 151, 14, self.menu.color["black"], 2, 0.10);

    self.hud["select_bar"] = self CreateRectangle("white", "CENTER", "CENTER", 204, -128, 3, 14, self.menu.color["black"], 4, 1);
    self.hud["select_bar"].foreground = true;

    self.hud["cords"]   = self createText("bigfixed", 0.35, "LEFT", "CENTER", -255, -190, self.menu.color["white"], 4, 1, " ");
    self.hud["instruc"] = self createText("bigfixed", 0.24, "CENTER", "CENTER", 0, 210, self.menu.color["white"], 4, 0.65, " ");
    self.hud["instruc"] setSafeText("Open [{+actionslot 2}]  Close [{+melee}]  Scroll [{+actionslot 1}][{+actionslot 2}]  Value [{+actionslot 3}][{+actionslot 4}]  Select [{+usereload}]");

    self.hud["text"]      = [];
    self.hud["text2"]     = [];
    self.hud["bool_text"] = [];

    for (i = 0; i < self.menu.maxsize; i++) {
        self.hud["text"][i]      = self CreateText("bigfixed", 0.27, "LEFT",  "CENTER", 209, -129 + (i * 15), self.menu.color["white"], 6, 1,    "Option " + (i + 1));
        self.hud["bool_text"][i] = self CreateText("bigfixed", 0.27, "RIGHT", "CENTER", 349, -129 + (i * 15), self.menu.color["black"], 6, 1,    "[OFF]");
    }
}

updateBarColors() {
    self endon("disconnect");
    self endon("death");
    hue = 0;
    for (;;) {
        if (self IsInMenu()) {
            rgb = getColorFromHue(hue, 1.0, 1.0);
            self.hud["header_box"].color = rgb;
            self.hud["top_bar"].color    = rgb;
            self.hud["left_bar"].color   = rgb;
            self.hud["scroll"].color     = rgb;
            self.hud["select_bar"].color = rgb;
            self.hud["title"].color      = rgb;
            for (i = 0; i < self.menu.maxsize; i++) {
                if (isdefined(self.hud["bool_text"][i]))
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
    i = int(hue / 60) % 6; // Determine la section de la roue des couleurs
    f = (hue / 60) - i;     // Fraction de la couleur
    p = value * (1 - saturation); // Couleur minimum
    q = value * (1 - f * saturation); // Couleur intermediaire
    t = value * (1 - (1 - f) * saturation); // Couleur intermediaire

    switch (i) {
        case 0: return (value, t, p); // 0 deg a 60 deg (Rouge)
        case 1: return (q, value, p); // 60 deg a 120 deg (Vert)
        case 2: return (p, value, t); // 120 deg a 180 deg (Cyan)
        case 3: return (p, q, value); // 180 deg a 240 deg (Bleu)
        case 4: return (t, p, value); // 240 deg a 300 deg (Magenta)
        case 5: return (value, p, q); // 300 deg a 360 deg (Rouge)
    }

    return (1, 1, 1); 
}

cordsUpdate()
{
    self endon("endCordsUpdate");
    self endon("death");
    self endon("disconnect");
    while(self.menu.isopen)
    {
        self.hud["cords"] setSafeText(self getOrigin() + "\n" + self getPlayerAngles() + "\nScript One: " + self getPers("scriptonescript") + "\nScript Two: " + self getPers("scripttwoscript"));
        wait 0.1;
    }
}
//"\nScroll: [{+actionslot 1}] / [{+actionslot 2}] - Change Value [{+actionslot 3}] / [{+actionslot 4}] - Select [{+usereload}]"
UpdateMenuBackground() {
    amount = self.menu.text[self.menu.current].size;
    if(amount > self.menu.maxsize) {
        amount = self.menu.maxsize;
    }

    if(amount == 5 || amount == 7 || amount == 9)
        plusamount = 17;
    else 
        plusamount = 16;

    totalHeight = plusamount + (15 * amount);

    self.hud["background"] SetShader("white", 155, totalHeight);
    self.hud["left_bar"]   SetShader("white", 2,   totalHeight);
    self.hud["right_bar"]  SetShader("white", 1,   totalHeight);
    self.hud["bottom_bar"].y = -137 + (15 * amount);

    footerY = -150 + totalHeight;
    self.hud["footer_box"].y = footerY;
    self.hud["footer"].y = footerY + 8;
}