#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

PlaceHolder()
{
}

setPers(key, value)
{
    self.pers[key] = value;
}

getPers(key)
{
    return self.pers[key];
}

setPersIfUni(key, value)
{
    if (!isDefined(self.pers[key]))
        self.pers[key] = value;
}

setDvarIfUni(dvar, value)
{
    if (!isDefined(getDvar(dvar)) || getDvar(dvar) == "")
        setDvar(dvar, value);
}

setupBind(pers, value, func)
{
    self setPersIfUni(pers, value);

    if (self getPers(pers) != "Off")
        self thread [[func]](self getPers(pers), pers);
}

OverflowFixInit()
{
    level.strings = [];
    level.overflowElem = createServerFontString("default", 1.5);
    level.overflowElem setSafeText("overflow");
    level.overflowElem.alpha = 0;
    level thread overflowFixMonitor();
}

overflowFixMonitor()
{
    for (;;)
    {
        level waittill("string_added");
        if (level.strings.size >= 45)
        {
            level.overflowElem clearAllTextAfterHudElem();
            level.strings = [];
            level notify("overflow_fixed");
        }
        wait 0.05;
    }
}

addString(string)
{
    level.strings[level.strings.size] = string;
    level notify("string_added");
}

fixString()
{
    self notify("new_string");
    self endon("new_string");
    while (isDefined(self))
    {
        level waittill("overflow_fixed");
        self setSafeText(self.string);
    }
}

setSafeText(text)
{
    self.string = text;
    self setText(text);
    self thread fixString();
    self addString(text);
}

createText(font, fontscale, align, relative, x, y, color, sort, alpha, text)
{
    textElem = createFontString(font, fontscale);
    textElem setPoint(align, relative, x, y);
    textElem.sort = sort;
    textElem.type = "text";
    textElem setSafeText(text);
    textElem.color = color;
    textElem.alpha = alpha;
    textElem.hideWhenInMenu = true;
    textElem.foreground = true;
    textElem.archived = true;
    return textElem;
}

createRectangle(shader, align, relative, x, y, width, height, color, sort, alpha)
{
    barElem = newClientHudElem(self);
    barElem.elemType = "icon";
    if (!level.splitScreen)
    {
        barElem.x = -2;
        barElem.y = -2;
    }
    barElem.width = width;
    barElem.height = height;
    barElem.align = align;
    barElem.relative = relative;
    barElem.xOffset = 0;
    barElem.yOffset = 0;
    barElem.children = [];
    barElem.color = color;
    if (isDefined(alpha))
        barElem.alpha = alpha;
    else
        barElem.alpha = 1;
    barElem setShader(shader, width, height);
    barElem.hidden = false;
    barElem.sort = sort;
    barElem setPoint(align, relative, x, y);
    barElem.foreground = true;
    barElem.archived = false;
    return barElem;
}

vectorScale(vector, scale)
{
    return (vector[0] * scale, vector[1] * scale, vector[2] * scale);
}
