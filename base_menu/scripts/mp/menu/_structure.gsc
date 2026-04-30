#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\_functions;

Structure()
{
    self CreateMenu("Main", "exit");
    self AddOption("Main", "Submenu 1", ::LoadMenu, undefined, "Submenu 1");
    self AddOption("Main", "Submenu 2", ::LoadMenu, undefined, "Submenu 2");
    self AddOption("Main", "Submenu 3", ::LoadMenu, undefined, "Submenu 3");
    self AddOption("Main", "Submenu 4", ::LoadMenu, undefined, "Submenu 4");
    self AddOption("Main", "Submenu 5", ::LoadMenu, undefined, "Submenu 5");
    self AddOption("Main", "Submenu 6", ::LoadMenu, undefined, "Submenu 6");
    self AddOption("Main", "Submenu 7", ::LoadMenu, undefined, "Submenu 7");
    self AddOption("Main", "Submenu 8", ::LoadMenu, undefined, "Submenu 8");

    self CreateMenu("Submenu 1", "Main");

    self CreateMenu("Submenu 2", "Main");

    self CreateMenu("Submenu 3", "Main");

    self CreateMenu("Submenu 4", "Main");

    self CreateMenu("Submenu 5", "Main");

    self CreateMenu("Submenu 6", "Main");

    self CreateMenu("Submenu 7", "Main");

    self CreateMenu("Submenu 8", "Main");
}
