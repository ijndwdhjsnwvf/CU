#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\perks\_perkfunctions;


#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\_functions;
#include scripts\mp\_aimbot;
#include scripts\mp\_binds;
#include scripts\mp\_presets;


Structure()
{
    self CreateMenu("COUNTER UAV", "exit");
    self AddOption("COUNTER UAV", "Misc", ::LoadMenu, undefined, "Misc");
    self AddOption("COUNTER UAV", "Teleport", ::LoadMenu, undefined, "Teleport");
    self AddOption("COUNTER UAV", "Aimbot", ::LoadMenu, undefined, "Aimbot");
    self AddOption("COUNTER UAV", "Binds", ::LoadMenu, undefined, "Binds");
    self AddOption("COUNTER UAV", "Weapon", ::LoadMenu, undefined, "Weapon");
    self AddOption("COUNTER UAV", "Killstreaks", ::LoadMenu, undefined, "Killstreaks");
    self AddOption("COUNTER UAV", "Game Profile", ::LoadMenu, undefined, "Game Profile");
    self AddOption("COUNTER UAV", "Game Settings", ::LoadMenu, undefined, "Game");
    self AddOption("COUNTER UAV", "Bots", ::LoadMenu, undefined, "Bots");
    self AddOption("COUNTER UAV", "Players", ::LoadMenu, undefined, "Players");
    self AddOption("COUNTER UAV", "Quick Start", ::LoadMenu, undefined, "Quick Start");
    self AddOption("COUNTER UAV", "Clip Cutting", ::LoadMenu, undefined, "Clip Cutting");
    self AddOption("COUNTER UAV", "CFG", ::LoadMenu, undefined, "CFG");
    self AddOption("COUNTER UAV", "Animations", ::LoadMenu, undefined, "Animations");
    self AddOption("COUNTER UAV", "Weap Defs", ::LoadMenu, undefined, "Weap Defs");

    self CreateMenu("Misc", "COUNTER UAV");
    self addOption("Misc", "UFO", ::noclipToggle, getPers("noclip"));
    self AddOption("Misc", "God Mode", ::godmode, getPers("god"));
    self addOption("Misc", "Killcam Timer", ::killcamTimer, getPers("killcamtimer"));
    self AddDvarSlider("Misc", "Killcam Length", undefined, "scr_killcam_time", 1, 10, 1);
    self AddOption("Misc", "Killcam Lag", ::KillcamLagTog, getDvar("function_killcamlag"));
    self AddOption("Misc", "Killcam Softland", ::KillcamSoftTog, getDvar("killcam_softland"));
    self AddOption("Misc", "Precam Softland", ::PrecamSoftTog, getDvar("function_precamsoft"));
    self AddOption("Misc", "Ammo Menu", ::LoadMenu, undefined, "Ammo Menu");
    self AddOption("Misc", "One Man Army Menu", ::LoadMenu, undefined, "One Man Army");
    self AddOption("Misc", "On Class Change", ::LoadMenu, undefined, "Class Change");
    self AddOption("Misc", "Clip Cutting", ::LoadMenu, undefined, "Clip Cutting");
    self AddOption("Misc", "Easy Ele", ::quickElev4, getPers("quickElev4"));
    self AddOption("Misc", "BO2 Instaswaps", ::instaswaps, getPers("instaswaps"));
    self addOption("Misc", "Unlimited Equipment", ::unlimknifetoggle, getPers("unlimitedeq"));
    self AddOption("Misc", "Good Nade", ::goodfrag1, getPers("goodnade"));
    self addOption("Misc", "Load Saved Game for: [^1" + getDvar("ui_mapname") + "^7]", ::presetload);

    self addoption("Misc", "Suicide", ::suicideTU6);


    self createMenu("Clip Cutting", "COUNTER UAV");
    self AddOption("Clip Cutting", "Green Screen", ::greenScreen, getPers("greenscreen"));
    self AddOption("Clip Cutting", "Blue Screen", ::blueScreen, getPers("bluescreen"));
    self AddOption("Clip Cutting", "Red Screen", ::redScreen, getPers("redscreen"));
    self AddOption("Clip Cutting", "Black Screen", ::BlackScreen, getPers("blackscreen"));
    self AddOption("Clip Cutting", "+greenscreen (cfg toggle)", ::cfgCmdExec, "+greenscreen");
    self AddOption("Clip Cutting", "+black (black flash)", ::cfgCmdExec, "+black");
    self AddOption("Clip Cutting", "Fast Restart", ::_fastRestart);
    self AddOption("Clip Cutting", "Drop Current Weapon", ::dropdagun);
    self AddOption("Clip Cutting", "Kill Enemy Bot", ::LoadMenu, undefined, "KillBotMenu");
    self AddOption("Clip Cutting", "+startcopy (copycat loadout)", ::cfgCmdExec, "+startcopy");
    self AddOption("Clip Cutting", "+hitmarker (hitmarker sfx)", ::cfgCmdExec, "+hitmarker");

    self CreateMenu("Ammo Menu", "Misc");
    self AddOption("Ammo Menu", "Save Current Ammo", ::setammo);
    self AddOption("Ammo Menu", "Set Saved Ammo", ::setsavedammo);
    self AddBindSliders("Ammo Menu", "Set Ammo Bind", ::ammobind, "ammobind");
    self AddOption("Ammo Menu", "Primary: ", ::setammo, getDvar("primary_weapon"));
    self AddOption("Ammo Menu", "Clip: ", ::setammo, getDvar("primary_clip"));
    self AddOption("Ammo Menu", "Stock: ", ::setammo, getDvar("primary_stock"));
    self AddOption("Ammo Menu", "Secondary: ", ::setammo, getDvar("secondary_weapon"));
    self AddOption("Ammo Menu", "Clip: ", ::setammo, getDvar("secondary_clip"));
    self AddOption("Ammo Menu", "Stock: ", ::setammo, getDvar("secondary_stock"));

    self createMenu("One Man Army", "Misc");
    self AddDvarSlider("One Man Army", "One Man Army Charge Time", undefined, "scr_oma_usetime", 0, 10, 1);
    self AddOption("One Man Army", "One Man Army Nac", ::omaNac, getPers("omanac"));
    self AddOption("One Man Army", "One Man Army Sprint", ::omaSprint, getPers("omasprint"));
    self AddOption("One Man Army", "Sprint on Second Bar", ::omaSprintSecond, getPers("omasprintsecond"));
    self AddOption("One Man Army", "Double One Man Army", ::doubleOma, getPers("doubleoma"));


    self createMenu("Class Change", "Misc");
    self AddOption("Class Change", "Class Change Adelia", ::classchangeadelia, getPers("classchangeadelia"));
    self AddOption("Class Change", "Infinite Sprint", ::classinfsprint, getPers("classinfsprint"));
    self AddOption("Class Change", "Knife", ::classmelee, getPers("classmelee"));
    self AddOption("Class Change", "Lunge", ::classlunge, getPers("classlunge"));
    self AddOption("Class Change", "Drop Anim", ::classdrop, getPers("classdrop"));
    self AddOption("Class Change", "Canswap", ::classcanswap, getPers("classcanswap"));
    self AddOption("Class Change", "Max Ammo on Class Change", ::maxammotog, getPers("maxammo"));

    self createMenu("Fake Bounces", "Misc");
    self addOption("Fake Bounces", "Spawn Bounce", ::spawn_fake_bounce);
    self addOption("Fake Bounces", "Remove Bounces", ::delbounce);

    self CreateMenu("Teleport", "COUNTER UAV");
    self AddDvarSlider("Teleport", "Save Point:", undefined, "function_savepoint", 1, 5, 1);
    self AddOption("Teleport", "Save Location", ::savepos);
    self AddOption("Teleport", "Load Location", ::loadpos);
    self AddDvarSlider("Teleport", "Spawn Point:", undefined, "function_spawnsavepoint", 1, 5, 1);
    self AddBindSliders("Teleport", "Save Location Bind", ::saveLocBind, "saveloc");
    self AddBindSliders("Teleport", "Load Location Bind", ::loadLocBind, "loadloc"); 
    self AddOption("Teleport", "Custom Locations", ::LoadMenu, undefined, "Custom Locations");
    self createMenu("Custom Locations", "Teleport");
    switch(getDvar("ui_mapname"))
    {
        case "mp_afghan":
        self AddOption("Custom Locations", "Out of Map", ::customLocation, undefined, (4906, 2929, 100 ));
        self AddOption("Custom Locations", "Bunker", ::customLocation, undefined, (2391, -129, 230));
        self AddOption("Custom Locations", "need dis rn", ::customLocation, undefined, (1238.1, 1599.6, 507.1));
        self AddOption("Custom Locations", "Bunker Rock", ::customLocation, undefined, (1980.6, 184.7, 290));
        break;

        case "mp_favela":
        self AddOption("Custom Locations", "Spawn Building", ::customLocation, undefined, (920, 1359, 440));
        self AddOption("Custom Locations", "Construction Building", ::customLocation, undefined, (-1700, 727, 150));
        self AddOption("Custom Locations", "Wallbreach", ::customLocation, undefined, (624.061, 57.9295, 252.045));
        break;

        case "mp_highrise":
        self AddOption("Custom Locations", "Spawn Building", ::customLocation, undefined, (17, 6903, 3048));
        self AddOption("Custom Locations", "Under Helipad", ::customLocation, undefined, (-1482, 6015, 2650));
        self AddOption("Custom Locations", "Top of Roof", ::customLocation, undefined, (-2818, 5919, 3614));
        self AddOption("Custom Locations", "big bonz", ::customLocation, undefined, (-1469.6, 6068.1, 3160.3));
        break;

        case "mp_quarry":
        self AddOption("Custom Locations", "Ladder", ::customLocation, undefined, (-4025, -164.626, -115.618));
        self AddOption("Custom Locations", "Inside Building 1", ::customLocation, undefined, (-4186.42, -97, 289.225));
        self AddOption("Custom Locations", "Inside Building 2", ::customLocation, undefined, (-4966.2, -97, 289.225));
        self AddOption("Custom Locations", "Cp Elevator", ::customLocation, undefined, (-4129, -960, 80.5));
        self AddOption("Custom Locations", "Sideways Elevator", ::customLocation, undefined, (-2956, 1458, 100));
        self AddOption("Custom Locations", "Catwalk Headbounce Spot", ::customLocation, undefined, (-3940.2, 184.0, 97.9));
        break;

        case "mp_terminal":
        self AddOption("Custom Locations", "Front of plane", ::customLocation, undefined, (550, 4625, 250));
        self AddOption("Custom Locations", "Ladder", ::customLocation, undefined, (2223, 4233, 48));
        self AddOption("Custom Locations", "Sideways", ::customLocation, undefined, (1285, 4753, 300));
        self AddOption("Custom Locations", "Book Store", ::customLocation, undefined, (1195.26, 4799, 233.167));
        self AddOption("Custom Locations", "Inside Spawn", ::customLocation, undefined, (-187.53, 5535, 369.163));
        break;

        case "mp_checkpoint":
        self AddOption("Custom Locations", "Clock Tower", ::customLocation, undefined, (-1487, 587, 178));
        self AddOption("Custom Locations", "Spawn", ::customLocation, undefined, (242, 1871, 118));
        self AddOption("Custom Locations", "Chicken", ::customLocation, undefined, (-1535, -557, 53));
        break;

        case "mp_storm":
        self AddOption("Custom Locations", "A Bomb", ::customLocation, undefined, (1277, 1361, 56));
        break;

        case "mp_crash":
        self AddOption("Custom Locations", "Trash Can", ::customLocation, undefined, (1184.26, 1341, 203.011));
        self AddOption("Custom Locations", "Ladder", ::customLocation, undefined, (1604, 381, 333));
        break;

        case "mp_compact":
        self AddOption("Custom Locations", "Tires", ::customLocation, undefined, (1634.45, 1137, 44.1668));
        self AddOption("Custom Locations", "Tires", ::customLocation, undefined, (2907.4, 1203.4, 289.0));
        break;

        case "mp_overgrown":
        self AddOption("Custom Locations", "Overgrown Wallbreach", ::customLocation, undefined, (-608.196, -2376.15, -103.875));
        break; 

        case "mp_underpass":
        self AddOption("Custom Locations", "Walbreach", ::customLocation, undefined, (1058.52, -414.478, 548.038));
        break;

         case "mp_strike":
        self AddOption("Custom Locations", "Spot 1", ::customLocation, undefined, (-398.2, -1407.1, 532.1));
        break;

        case "mp_boneyard":
        self AddOption("Custom Locations", "Spot 1", ::customLocation, undefined, (410.3, -461.0, 26.1));
        break;

         case "mp_rundown":
        self AddOption("Custom Locations", "oc tree lunge", ::customLocation, undefined, (1482.8, -765.0, 260.0));
        break;

        case "mp_derail":
        self AddOption("Custom Locations", "oc weird spot", ::customLocation, undefined, (2241.6, 2835.1, 460));
        break;

        default:
        self AddOption("Custom Locations", "None");
        break;
    }

    /*self CreateMenu("Aimbot", "COUNTER UAV");  old aimbot shit
    self addoption("Aimbot","Aimbot Weapon", ::aimbotWeapon, getDvar("aimbotWeapon"));
    self addOption ("Aimbot", "Aimbot Strength", ::aimbotStrength, self.aimbotStrength);
    self addoption("Aimbot","Hitmarker Weapon", ::hitmarkerWeapon, getDvar("hitmarkerWeapon"));
    self addOption ("Aimbot","Aimbot Hitmarker", ::aimbot_hitmarker, self.aimbothitmarker);
    self addOption ("Aimbot", "Headshot Aimbot", ::headshotAimbot, getPers("headshotAimbot"));
    self addOption ("Aimbot", "Aimbot Delay Settings", ::loadMenu, undefined,"Aimbot Delay Settings");

	self createMenu("Aimbot Delay Settings", "Aimbot");
	self addOption ("Aimbot Delay Settings", "Increase Aimbot Delay by 0.1", ::aimbotDelay, undefined, 0.1);
	self addOption ("Aimbot Delay Settings", "Decrease Aimbot Delay by 0.1", ::aimbotDelay, undefined, -0.1);
	self addOption ("Aimbot Delay Settings", "Value : [^1" + self.aimbotDelay + "^7]" );*/


    self CreateMenu("Aimbot", "COUNTER UAV");
    self AddOption("Aimbot", "Weapon", ::aimbotWeapon, self.pers["aimbotWeapon"]);
    self AddSlider("Aimbot", "Strength", undefined, "aimbotStrength", 0, 10000, 250);
    self addOption("Aimbot", "Everwhere", ::everywhereeb, getPers("everywhereeb"));
    self AddSlider("Aimbot", "Delay", undefined, "aimbotDelay", 0, 3, 0.1);
    self addOption("Aimbot", "Mid Air", ::midAirOnly, getPers("midAirOnly"));
    self addOption("Aimbot", "Headshots", ::headshots, getDvar("headshots"));
    self AddOption("Aimbot", "Friendly Weapon", ::friendlyWeapon, getPers("friendlyweapon"));
    self AddOption("Aimbot", "Friendly Aimbot", ::friendlyAimbot, getPers("friendlyaimbot"));
    self AddOption("Aimbot", "Hitmarker Aimbot", ::hmaimbot, getPers("hmaimbot"));
    self AddOption("Aimbot", "Hitmarker Weapon", ::hmweapon, getPers("hmweapon"));

    
    self CreateMenu("Game", "COUNTER UAV");
    self addoption("Game", "Rounds Setup",::LoadMenu, undefined,"Rounds");
    self AddOption("Game", "Instashoot", ::LoadMenu, undefined, "Instashoot");
    self AddOption("Game", "Round Timer", ::timerToggle, getPers("timerthing"));
    self AddOption("Game", "Player Health", ::playerhealth, getDvar("player_health"));
    self AddOption("Game", "Knife Lunges", ::knifelunges, getPers("knifelunges"));
    self AddOption("Game", "Depatch Bounces", ::depatch, getPers("bounces"));
    self AddOption("Game", "Depatch Elevators", ::depatch_elev, getPers("elevators"));
    self AddDvarSlider("Game", "Timescale", undefined, "timescale", 0.5, 2, 0.5);
    self AddDvarSlider("Game", "Gravity", undefined, "g_gravity", 50, 1500, 50);
    self AddDvarSlider("Game", "Lag", undefined, "sv_padpackets", 0, 20000, 500);
    self AddDvarSlider("Game", "Pickup Radius", undefined, "player_useRadius", 0, 20000, 250);
    self AddDvarSlider("Game", "Ladder Velocity", undefined, "jump_ladderpushvel", 28, 528, 10);
    self AddDvarSlider("Game", "Speed", undefined, "g_speed", 0, 1210, 10);
    self AddDvarSlider("Game", "Jump Height", undefined, "jump_height", 19, 99, 5);
    self AddDvarSlider("Game", "Knockback", undefined, "g_knockback", 0, 29999, 500);
    self AddDvarSlider("Game", "Use Time", undefined, "g_useholdtime", 0, 300, 20);
    self AddDvarSlider("Game", "Ladder Cap", undefined, "bg_ladder_yawcap", 0, 360, 20);
    self AddDvarSlider("Game", "Prone Cap", undefined, "bg_prone_yawcap", 0, 360, 20);
    self AddDvarSlider("Game", "Mantle Cap", undefined, "mantle_view_yawcap", 60, 180, 20);
    self AddOption("Game", "Bullet Marks", ::bullets, getPers("bullets"));
    self AddOption("Game", "Death Barriers", ::deathbarrierstog, getPers("deathbarriers"));
    self AddArraySlider("Game", "Change Map", ::changeMap, strTok("mp_afghan,mp_derail,mp_estate,mp_favela,mp_highrise,mp_invasion,mp_checkpoint,mp_quarry,mp_rundown,mp_rust,mp_boneyard,mp_nightshift,mp_subbase,mp_terminal,mp_underpass,mp_brecourt", ","), "change_map");
    self AddOption("Game", "Map Restart", ::_mapRestart);
    self AddOption("Game", "Disconnect", ::_Disconnect);


    self CreateMenu("Rounds", "Game");
    self AddDvarSlider("Rounds", "Rounds Team 1", undefined, "roundswon", 0, 3, 1);
    self AddDvarSlider("Rounds", "Rounds Team 2", undefined, "roundslost", 0, 3, 1);
    self AddOption("Rounds", "Set Rounds", ::sndroundreset2);

    self CreateMenu("Instashoot", "Game");
    self addoption("Instashoot","Instashoot", ::instashoots_tog, getPers("instashoots"));
    self AddOption("Instashoot", "Instashoot Weapon", ::instashoots_weapon, getDvar("instashoots_weapon"));

    self CreateMenu("Weapon", "COUNTER UAV");
    self AddOption("Weapon", "Drop Canswap", ::dropCanswap);
    self AddOption("Weapon", "Drop Current Weapon", ::dropdagun);
    self AddOption("Weapon", "Weapon:", ::drop_weapon_name, getDvar("drop_weapon_name"));
    self AddOption("Weapon", "Save Spawn Location" , ::drop_weapon_location);
    self AddBindSliders("Weapon", "Spawn Weapon Bind", ::dropdeletebind, "dropdeletebind");
    self AddOption("Weapon", "Give Weapons", ::LoadMenu, undefined, "Weapons");

    self CreateMenu("Weapons", "Weapon");
    self AddOption("Weapons", "Infinite Equipement", ::set_infiniteammo, self.pers["function_infammo"]);
    self AddOption("Weapons", "Refill Ammo", ::refillAmmo);
    self AddOption("Weapons", "Give Akimbo", ::giveAkimbo);
    self AddArraySlider("Weapons", "Assault Rifle", ::giveWeap, strTok("m4,famas,scar,tavor,fal,m16,masada,fn2000,ak47", ","), "give_weapon_ar");
    self AddArraySlider("Weapons", "Sub Machine Gun", ::giveWeap, strTok("mp5k,ump45,kriss,p90,uzi", ","), "give_weapon_smg");
    self AddArraySlider("Weapons", "Light Machine Gun", ::giveWeap, strTok("sa80,rpd,mg4,aug,m240", ","), "give_weapon_lmg");
    self AddArraySlider("Weapons", "Sniper Rifle", ::giveWeap, strTok("cheytac,barrett,wa2000,m21", ","), "give_weapon_sniper");
    self AddArraySlider("Weapons", "Machine Pistol", ::giveWeap, strTok("pp2000,glock,beretta393,tmp", ","), "give_weapon_machine");
    self AddArraySlider("Weapons", "Shotgun", ::giveWeap, strTok("spas12,aa12,striker,ranger,m1014,model1887", ","), "give_weapon_handgun");
    self AddArraySlider("Weapons", "Handgun", ::giveWeap, strTok("usp,coltanaconda,beretta,deserteagle", ","), "give_weapon_shotgun");
    self AddArraySlider("Weapons", "Launcher", ::giveWeap, strTok("at4,m79,stinger,javelin,rpg", ","), "give_weapon_launcher");
    self AddArraySlider("Weapons", "Special", ::giveWeap, strTok("defaultweapon,deserteaglegold", ","), "give_weapon_special");

    self CreateMenu("Bots", "COUNTER UAV");
    self addoption("Bots", "Spawn Friendly", ::spawnFriendlyBot);
    self addoption("Bots", "Spawn Enemy", ::spawnEnemyBot);
    self addoption("Bots", "Teleport Settings",::LoadMenu, undefined,"Teleport Bots");
    self AddOption("Bots", "Bots Functions", ::LoadMenu, undefined, "Bots Functions");

        self CreateMenu("Bots Functions", "Bots");
        self AddArraySlider("Bots Functions", "Bot Preset", ::change_bot, strTok("default,mishy,syncroh,areal,brx,chim,jtm,meta,zekah,deft,azr,qurve", ","), "change_bot");
        self addoption("Bots Functions", "Enemy Bot Weapon", ::ebotweapon, getDvar("ebotweapon"));
        self addoption("Bots Functions", "Friendly Bot Weapon", ::fbotWeapon, getDvar("fbotweapon"));
        self AddDvarSlider("Bots Functions", "Bot Prestige", ::botprestige, "bot_prestige",  0, 11, 1); 

        self AddBindSliders("Bots Functions", "Bot Mantle Bind", ::botmantlebind, "botmantlebind");
        self AddBindSliders("Bots Functions", "Bot Kills Friend", ::botkilltest, "botkilltest");
        self addoption("Bots Functions", "Enemy Bot Velocity",::LoadMenu, undefined,"eBotVelo");
        self addoption("Bots Functions", "Friendly Bot Velocity",::LoadMenu, undefined,"fBotVelo");


    self CreateMenu("eBotVelo", "Bots Functions");
    self AddDvarSlider("eBotVelo", "Bot Velocity X", undefined, "ebotvelx", -500, 500, 20);
    self AddDvarSlider("eBotVelo", "Bot Velocity Z", undefined, "ebotvelz", -500, 500, 20);
    self AddDvarSlider("eBotVelo", "Bot Velocity Y", undefined, "ebotvely", -500, 500, 20);
    self addoption("eBotVelo","Reset Bot Vel", ::resetebotvel);
    self AddBindSliders("eBotVelo", "Bot Velocity Bind", ::ebotvelbind, "ebotvelbind");
    //
    self CreateMenu("fBotVelo", "Bots Functions");
    self AddDvarSlider("fBotVelo", "Bot Velocity X", undefined, "fbotvelx", -500, 500, 20);
    self AddDvarSlider("fBotVelo", "Bot Velocity Z", undefined, "fbotvelz", -500, 500, 20);
    self AddDvarSlider("fBotVelo", "Bot Velocity Y", undefined, "fbotvely", -500, 500, 20);
    self AddOption("fBotVelo","Reset Bot Vel", ::resetfbotvel);
    self AddBindSliders("fBotVelo", "Bot Velocity Bind", ::fbotvelbind, "fbotvelbind");

    self CreateMenu("Teleport Bots", "Bots");
    self AddOption("Teleport Bots", "Teleport Enemy [3 Seconds]", ::teleportbots, undefined, getOtherTeam(self.pers["team"]));
    self AddOption("Teleport Bots", "Teleport Friendly [3 Seconds]", ::teleportbots, undefined, self.pers["team"]);
    self addoption("Teleport Bots", "Teleport Enemy", ::tpenemybots);
    self addoption("Teleport Bots", "Teleport Friendly", ::tpfriendbots);

    self AddOption("Teleport Bots", "Save Location", ::saveLocationBot);
    self AddOption("Teleport Bots", "Load Location", ::loadLocationBot);

    self addoption("Bots", "Kick Settings",::LoadMenu, undefined,"Kick Bots");
    
    self CreateMenu("Kick Bots", "Bots");
    self AddOption("Kick Bots", "Kick Enemy Bots", ::kickenemybots);
    self AddOption("Kick Bots", "Kick Friendly Bots", ::kickfriendbots);
    self addoption("Kick Bots", "Kick All Bots", ::removeEveryBot);


    self CreateMenu("Binds", "COUNTER UAV");
    self addoption("Binds", "Dvar Toggle",::LoadMenu, undefined,"Dvar Toggle");
    //self addoption("Binds", "Weapon Def",::LoadMenu, undefined, "Weapon Def");
    self addoption("Binds", "Velocity",::LoadMenu, undefined,"Velocity");
    self addoption("Binds", "Nac Mod",::LoadMenu, undefined,"Nac Mod");
    self addoption("Binds", "Kill Bot",::LoadMenu, undefined,"KillBotMenu");
    self addoption("Binds", "Set Anim",::LoadMenu, undefined,"Set Anim");
    self addoption("Binds", "Swap to Weapon",::LoadMenu, undefined,"SwaptoWeapon");
    self addoption("Binds", "Radius Damage",::LoadMenu, undefined,"Radius");
    self addoption("Binds", "Bolt Movement",::LoadMenu, undefined,"Bolt");
    self addoption("Binds", "Force Barrel",::LoadMenu, undefined,"Force");
    self addoption("Binds", "Canswaps",::LoadMenu, undefined,"Canswaps");
    self addoption("Binds", "Instashoots",::LoadMenu, undefined,"Instashoots");
    self AddBindSliders("Binds", "Blast Shield", ::blastbind, "blastbind");
    self AddBindSliders("Binds", "Cp Mala", ::cpmala, "cpmala");
    self AddBindSliders("Binds", "Pred Mala", ::predmala, "predmala");
    self AddBindSliders("Binds", "Illusion", ::illusion, "illusion");
    self AddBindSliders("Binds", "Smooth", ::smooth2, "smooth2");
    self AddBindSliders("Binds", "Instaswap", ::instaswap, "instaswap");
    self AddBindSliders("Binds", "Gunlock", ::gunlockbind, "gunlockbind");
    self AddBindSliders("Binds", "Damage", ::damagenobind, "damagenobind");
    self AddBindSliders("Binds", "Damage With Sound", ::damagebind, "damagebind");
    self AddBindSliders("Binds", "Hitmarker", ::hitmarker1, "hitmarker1");
    self AddBindSliders("Binds", "Flash", ::flashbind, "flashbind");
    self AddBindSliders("Binds", "Stun", ::stunsbind, "stunsbind");
    self AddBindSliders("Binds", "Friendly Fire", ::FriendlyKnock, "FriendlyKnock");
    self AddBindSliders("Binds", "Final Stand", ::finalstandbind, "finalstandbind");
    self AddBindSliders("Binds", "Last Stand", ::laststandbind, "laststandbind");
    self AddBindSliders("Binds", "Host Migration", ::hostmigrabind, "hostmigrabind");
    self AddBindSliders("Binds", "EMP Bind", ::fakeempbind, "fakeempbind");
    self AddBindSliders("Binds", "Thirdeye", ::thirdeyebind, "thirdeyebind");
    self AddBindSliders("Binds", "Give OMA", ::omabind, "omabind");
    self AddBindSliders("Binds", "Killstreak Splash", ::kssplashbind, "kssplashbind");
    self AddBindSliders("Binds", "Canswap & Reload Repeater", ::mishycanswapreloadrepeaterbind, "mishycanswapreloadrepeaterbind");


    self CreateMenu("Bolt", "Binds");
    self addoption("Bolt", "Save Point", ::savebolt);
    self addoption("Bolt", "Delete Point", ::deletebolt);
    self AddDvarSlider("Bolt", "Bolt Speed", undefined, "bolttime", 0, 10, 0.2);
    self AddBindSliders("Bolt", "Bolt Movement Bind", ::boltbind, "boltbind");
    self addoption("Bolt", "Fix ADS [^1LATENCY WHEN ON^7]", ::fix_ads, getPers("fixADS"));


    self CreateMenu("Force", "Binds");
    self AddBindSliders("Force", "Force Barrel Bind", ::forcebind, "forcebind");
    self AddBindSliders("Force", "Force Barrel Bind Hold", ::forcebindHold, "forcebindHold");

    self CreateMenu("Canswaps", "Binds");
    self AddOption("Canswaps", "Canswap Mode", ::canswapCycle, getPers("canswapmode"));
    self AddOption("Canswaps", "Register Gun (Canswap)", ::canswapRegisterGun, getPers("canswapregistered"));

    self CreateMenu("Instashoots", "Binds");
    self AddOption("Instashoots", "Instashoot Mode", ::instashootCycle, getPers("instashootmode"));
    self AddOption("Instashoots", "Register Gun (Instashoot)", ::instashootRegisterGun, getPers("instashootregistered"));

    self CreateMenu("Velocity", "Binds");
    self addoption("Velocity", "Velocity 1",::LoadMenu, undefined,"Velocity1");
    self addoption("Velocity", "Velocity 2",::LoadMenu, undefined,"Velocity2");

    self CreateMenu("Velocity1", "Velocity");
    self AddDvarSlider("Velocity1", "Velocity 1 X", undefined, "velx", -500, 500, 10);
    self AddDvarSlider("Velocity1", "Velocity 1 Z", undefined, "velz", -500, 500, 10);
    self AddDvarSlider("Velocity1", "Velocity 1 Y", undefined, "vely", -500, 500, 10);
    self addoption("Velocity1","Reset Velocity 1",::resetvel);
    self AddBindSliders("Velocity1", "Velocity 1 Bind", ::velbind, "velbind");
    //
    self CreateMenu("Velocity2", "Velocity");
    self AddDvarSlider("Velocity2", "Velocity 2 X", undefined, "velx2", -500, 500, 10);
    self AddDvarSlider("Velocity2", "Velocity 2 Z", undefined, "velz2", -500, 500, 10);
    self AddDvarSlider("Velocity2", "Velocity 2 Y", undefined, "vely2", -500, 500, 10);
    self addoption("Velocity2","Reset Velocity 2",::resetvel2);
    self AddBindSliders("Velocity2", "Velocity 2 Bind", ::vel2bind, "vel2bind");

    self CreateMenu("Nac Mod", "Binds");
    self addoption("Nac Mod","Nac Weapon 1",::nacmod1, getDvar("nacmod1"));
    self addoption("Nac Mod","Nac Weapon 2",::nacmod2, getDvar("nacmod2"));
    self AddBindSliders("Nac Mod", "Nac Mod Bind", ::nacmodbind, "nacmodbind");

    self CreateMenu("KillBotMenu", "Binds");
    self addoption("KillBotMenu", "Weapon:",::killbot_weapon, getDvar("killbot_weapon"));
    self AddBindSliders("KillBotMenu", "KillBot Bind", ::killbotbind, "killbotbind");

    self CreateMenu("Set Anim", "Binds");
    self AddDvarSlider("Set Anim", "Anim 1", undefined, "Anim", 0, 34, 1);
    self AddBindSliders("Set Anim", "Set Anim Bind 1", ::animbind, "animbind");
    self AddDvarSlider("Set Anim", "Anim 2", undefined, "Anim2", 0, 34, 1);
    self AddBindSliders("Set Anim", "Set Anim Bind 2", ::anim2bind, "anim2bind");

    self CreateMenu("SwaptoWeapon", "Binds");
    self addoption("SwaptoWeapon","Swap Weapon",::swap_weapon, getDvar("swap_weapon"));
    self AddBindSliders("SwaptoWeapon", "Swap Bind", ::swapbind, "swapbind");

    self CreateMenu("Radius", "Binds");
    self AddOption("Radius", "Save Damage Location", ::radiusdmglocation);
    self AddBindSliders("Radius", "Radius Damage Bind", ::radiusdmgbind, "radiusdmgbind");

    self CreateMenu("Dvar Toggle", "Binds");
    self AddArraySlider("Dvar Toggle", "Set Dvar [{+usereload}]", ::dvartog, strTok("g_gravity,g_speed,jump_ladderpushvel,player_useradius,jump_height,g_useholdtime,sv_padpackets", ","), "dvartog");
    self AddDvarSlider("Dvar Toggle", "First Value", undefined, "dvartog1", 0, 800, 50);
    self AddDvarSlider("Dvar Toggle", "Second Value", undefined, "dvartog2", 0, 800, 50);
    self AddBindSliders("Dvar Toggle", "Toggle Dvar Bind", ::dvarbind, "dvarbind");


    /*self CreateMenu("Killstreaks", "COUNTER UAV");
    self AddArraySlider("Killstreaks", "Killstreak", ::giveStreak, strTok("uav,counter_uav,airdrop,predator_missile,sentry,precision_airstrike,harrier_airstrike,helicopter,airdrop_mega,pavelow,stealth_airstrke,helicopter_minigun,ac130,emp,nuke", ","), "current_streak");
    self AddOption("Killstreaks", "Remove Killstreaks", ::removeKS);
    self AddOption("Killstreaks", "Carepackage to Crosshair", ::spawncarepackagecross);
    self AddOption("Killstreaks", "Carepackage on yourself", ::spawncarepackageself);
    self AddOption("Killstreaks", "Delete Carepackage(s)", ::delete_carepack);
    self AddDvarSlider("Killstreaks", "CP Capture Time", undefined, "cg_cratetime", 0, 5000, 500);
    self AddArraySlider("Killstreaks", "Change Crate Type [{+usereload}]", ::change_cratedvar, strTok("ammo,uav,counter_uav,sentry,predator_missile,precision_airstrike,harrier_airstrike,helicopter,helicopter_flares,stealth_airstrike,helicopter_minigun,ac130,emp", ","), "crate_type");
    self AddOption("Killstreaks", "Save Carepackage Drop Location", ::setcppos);
    self AddBindSliders("Killstreaks", "Call Carepackage in Location", ::cppos, "cppos");*/



    self CreateMenu("Killstreaks", "COUNTER UAV");
    self AddArraySlider("Killstreaks", "Killstreak", ::giveStreak, strTok("uav,counter_uav,airdrop,predator_missile,sentry,precision_airstrike,harrier_airstrike,helicopter,airdrop_mega,pavelow,stealth_airstrke,helicopter_minigun,ac130,emp,nuke", ","), "current_streak");
    self AddOption("Killstreaks", "Remove Killstreaks", ::removeKS);
    self AddOption("Killstreaks", "Carapackage Stuff", ::LoadMenu, undefined, "CPFUNC");

    self CreateMenu("CPFUNC", "Killstreaks");
    self AddOption("CPFUNC", "Carepackage to Crosshair", ::spawncarepackagecross);
    self AddOption("CPFUNC", "Delete Carepackage(s)", ::delete_carepack);
    self AddOption("CPFUNC", "Save CP Spawn Location" , ::cp_location);
    self AddOption("CPFUNC", "Spawn CP on Location" , ::cponpos, getPers("cponpos"));
    self AddDvarSlider("CPFUNC", "CP Capture Time", undefined, "cg_cratetime", 0, 5000, 500);
    self AddArraySlider("CPFUNC", "Change Crate Type [{+usereload}]", ::change_cratedvar, strTok("ammo,uav,counter_uav,sentry,predator_missile,precision_airstrike,harrier_airstrike,helicopter,helicopter_flares,stealth_airstrike,helicopter_minigun,ac130,emp", ","), "crate_type");
    self AddOption("CPFUNC", "Set Call in Location", ::setcppos);
    self AddBindSliders("CPFUNC", "Call Carepackage in Location", ::cppos, "cppos");


    self createMenu("Game Profile", "COUNTER UAV");
    self AddOption("Game Profile", "Edit Primary Weapon", ::LoadMenu, undefined, "primary_weapon");
    self AddOption("Game Profile", "Edit Secondary Weapon", ::LoadMenu, undefined, "secondary_weapon");
    self AddOption("Game Profile", "Edit Camos", ::LoadMenu, undefined, "camo_editor");
    self AddOption("Game Profile", "Equipments", ::LoadMenu, undefined, "equipment");
    self AddOption("Game Profile", "Special Grenade", ::LoadMenu, undefined, "special_grenade");
    self AddOption("Game Profile", "Perk One", ::LoadMenu, undefined, "perk_one");
    self AddOption("Game Profile", "Perk Two", ::LoadMenu, undefined, "perk_two");
    self AddOption("Game Profile", "Perk Three", ::LoadMenu, undefined, "perk_three");
    self AddOption("Game Profile", "Coloured Classes", ::colouredClasses);



    self createMenu("primary_weapon", "Game Profile");
    self AddOption("primary_weapon", "Assault Rifles", ::LoadMenu, undefined, "primary_ars");
    self AddOption("primary_weapon", "Sub Machine Guns", ::LoadMenu, undefined, "primary_smg");
    self AddOption("primary_weapon", "Light Machine Guns", ::LoadMenu, undefined, "primary_lmg");
    self AddOption("primary_weapon", "Sniper Rifles", ::LoadMenu, undefined, "primary_snipers");
    self AddOption("primary_weapon", "Machine Pistols", ::LoadMenu, undefined, "primary_machine_pistols");
    self AddOption("primary_weapon", "Shotguns", ::LoadMenu, undefined, "primary_shotguns");
    self AddOption("primary_weapon", "Handguns", ::LoadMenu, undefined, "primary_handguns");
    self AddOption("primary_weapon", "Launchers", ::LoadMenu, undefined, "primary_launchers");
    self addOption ("primary_weapon", "OMA Bag", ::weapon_editor, undefined, "onemanarmy", 0);
    self addOption ("primary_weapon", "Riot Shield", ::weapon_editor, undefined, "riotshield", 0);

    self createMenu("primary_ars", "primary_weapon");
    self AddOption("primary_ars", "M4A1", ::weapon_editor, undefined, "m4", 0);
    self AddOption("primary_ars", "FAMAS", ::weapon_editor, undefined, "famas", 0);
    self AddOption("primary_ars", "SCAR-H", ::weapon_editor, undefined, "scar", 0);
    self AddOption("primary_ars", "TAR-21", ::weapon_editor, undefined, "tavor", 0);
    self AddOption("primary_ars", "FN FAL", ::weapon_editor, undefined, "fal", 0);
    self AddOption("primary_ars", "M16A4", ::weapon_editor, undefined, "m16", 0);
    self AddOption("primary_ars", "ACR", ::weapon_editor, undefined, "masada", 0);
    self AddOption("primary_ars", "F2000", ::weapon_editor, undefined, "fn2000", 0);
    self AddOption("primary_ars", "AK-47", ::weapon_editor, undefined, "ak47", 0);

    self createMenu("primary_smg", "primary_weapon");
    self AddOption("primary_smg", "MP5K", ::weapon_editor, undefined, "mp5k", 0);
    self AddOption("primary_smg", "UMP45", ::weapon_editor, undefined, "ump45", 0);
    self AddOption("primary_smg", "Vector", ::weapon_editor, undefined, "kriss", 0);
    self AddOption("primary_smg", "P90", ::weapon_editor, undefined, "p90", 0);
    self AddOption("primary_smg", "Mini-Uzi", ::weapon_editor, undefined, "uzi", 0);

    self createMenu("primary_lmg", "primary_weapon");
    self AddOption("primary_lmg", "L86 LSW", ::weapon_editor, undefined, "sa80", 0);
    self AddOption("primary_lmg", "RPD", ::weapon_editor, undefined, "rpd", 0);
    self AddOption("primary_lmg", "MG4", ::weapon_editor, undefined, "mg4", 0);
    self AddOption("primary_lmg", "AUG HBAR", ::weapon_editor, undefined, "aug", 0);
    self AddOption("primary_lmg", "M240", ::weapon_editor, undefined, "m240", 0);

    self createMenu("primary_snipers", "primary_weapon");
    self AddOption("primary_snipers", "Intervention", ::weapon_editor, undefined, "cheytac", 0);
    self AddOption("primary_snipers", "Barrett .50Cal", ::weapon_editor, undefined, "barrett", 0);
    self AddOption("primary_snipers", "WA2000", ::weapon_editor, undefined, "wa2000", 0);
    self AddOption("primary_snipers", "M21 EBR", ::weapon_editor, undefined, "m21", 0);

    self createMenu("primary_machine_pistols", "primary_weapon");
    self AddOption("primary_machine_pistols", "PP-2000", ::weapon_editor, undefined, "pp2000", 0);
    self AddOption("primary_machine_pistols", "Glock 18", ::weapon_editor, undefined, "glock", 0);
    self AddOption("primary_machine_pistols", "Raffica", ::weapon_editor, undefined, "beretta393", 0);
    self AddOption("primary_machine_pistols", "TMP", ::weapon_editor, undefined, "tmp", 0);

    self createMenu("primary_shotguns", "primary_weapon");
    self AddOption("primary_shotguns", "SPAS-12", ::weapon_editor, undefined, "spas12", 0);
    self AddOption("primary_shotguns", "AA-12", ::weapon_editor, undefined, "aa12", 0);
    self AddOption("primary_shotguns", "Striker", ::weapon_editor, undefined, "striker", 0);
    self AddOption("primary_shotguns", "Ranger", ::weapon_editor, undefined, "ranger", 0);
    self AddOption("primary_shotguns", "M1014", ::weapon_editor, undefined, "m1014", 0);
    self AddOption("primary_shotguns", "Model 1887", ::weapon_editor, undefined, "model1887", 0);

    self createMenu("primary_handguns", "primary_weapon");
    self AddOption("primary_handguns", "USP .45", ::weapon_editor, undefined, "usp", 0);
    self AddOption("primary_handguns", "Magnum", ::weapon_editor, undefined, "coltanaconda", 0);
    self AddOption("primary_handguns", "M9", ::weapon_editor, undefined, "beretta", 0);
    self AddOption("primary_handguns", "Desert Eagle", ::weapon_editor, undefined, "deserteagle", 0);

    self createMenu("primary_launchers", "primary_weapon");
    self AddOption("primary_launchers", "AT4-HS", ::weapon_editor, undefined, "at4", 0);
    self AddOption("primary_launchers", "Thumper", ::weapon_editor, undefined, "m79", 0);
    self AddOption("primary_launchers", "Stinger", ::weapon_editor, undefined, "stinger", 0);
    self AddOption("primary_launchers", "Javelin", ::weapon_editor, undefined, "javelin", 0);
    self AddOption("primary_launchers", "RPG-7", ::weapon_editor, undefined, "rpg", 0);

    self createMenu("attachment_primary_one", "primary_weapon");
    self AddOption("attachment_primary_one", "None", ::attachment_editor_one, undefined, "none", 0);
    self AddOption("attachment_primary_one", "Acog", ::attachment_editor_one, undefined, "acog", 0);
    self AddOption("attachment_primary_one", "Grip", ::attachment_editor_one, undefined, "grip", 0);
    self AddOption("attachment_primary_one", "Grenade Launcher", ::attachment_editor_one, undefined, "gl", 0);
    self AddOption("attachment_primary_one", "Tactical", ::attachment_editor_one, undefined, "tactical", 0);
    self AddOption("attachment_primary_one", "Red Dog Sight", ::attachment_editor_one, undefined, "reflex", 0);
    self AddOption("attachment_primary_one", "Silencer", ::attachment_editor_one, undefined, "silencer", 0);
    self AddOption("attachment_primary_one", "Akimbo", ::attachment_editor_one, undefined, "akimbo", 0);
    self AddOption("attachment_primary_one", "Thermal", ::attachment_editor_one, undefined, "thermal", 0);
    self AddOption("attachment_primary_one", "Shotgun", ::attachment_editor_one, undefined, "shotgun", 0);
    self AddOption("attachment_primary_one", "Heartbeat", ::attachment_editor_one, undefined, "heartbeat", 0);
    self AddOption("attachment_primary_one", "FMJ", ::attachment_editor_one, undefined, "fmj", 0);
    self AddOption("attachment_primary_one", "Rapid Fire", ::attachment_editor_one, undefined, "rof", 0);
    self AddOption("attachment_primary_one", "Extended Mags", ::attachment_editor_one, undefined, "xmags", 0);
    self AddOption("attachment_primary_one", "Holographic", ::attachment_editor_one, undefined, "eotech", 0);

    self createMenu("attachment_primary_two", "primary_weapon");
    self AddOption("attachment_primary_two", "None", ::attachment_editor_two, undefined, "none", 0);
    self AddOption("attachment_primary_two", "Acog", ::attachment_editor_two, undefined, "acog", 0);
    self AddOption("attachment_primary_two", "Grip", ::attachment_editor_two, undefined, "grip", 0);
    self AddOption("attachment_primary_two", "Grenade Launcher", ::attachment_editor_two, undefined, "gl", 0);
    self AddOption("attachment_primary_two", "Tactical", ::attachment_editor_two, undefined, "tactical", 0);
    self AddOption("attachment_primary_two", "Red Dog Sight", ::attachment_editor_two, undefined, "reflex", 0);
    self AddOption("attachment_primary_two", "Silencer", ::attachment_editor_two, undefined, "silencer", 0);
    self AddOption("attachment_primary_two", "Akimbo", ::attachment_editor_two, undefined, "akimbo", 0);
    self AddOption("attachment_primary_two", "Thermal", ::attachment_editor_two, undefined, "thermal", 0);
    self AddOption("attachment_primary_two", "Shotgun", ::attachment_editor_two, undefined, "shotgun", 0);
    self AddOption("attachment_primary_two", "Heartbeat", ::attachment_editor_two, undefined, "heartbeat", 0);
    self AddOption("attachment_primary_two", "FMJ", ::attachment_editor_two, undefined, "fmj", 0);
    self AddOption("attachment_primary_two", "Rapid Fire", ::attachment_editor_two, undefined, "rof", 0);
    self AddOption("attachment_primary_two", "Extended Mags", ::attachment_editor_two, undefined, "xmags", 0);
    self AddOption("attachment_primary_two", "Holographic", ::attachment_editor_two, undefined, "eotech", 0);

    self createMenu("secondary_weapon", "Game Profile");
    self AddOption("secondary_weapon", "Assault Rifles", ::loadmenu, undefined, "secondary_ars");
    self AddOption("secondary_weapon", "Sub Machine Guns", ::loadmenu, undefined, "secondary_smg");
    self AddOption("secondary_weapon", "Light Machine Guns", ::loadmenu, undefined, "secondary_lmg");
    self AddOption("secondary_weapon", "Sniper Rifles", ::loadmenu, undefined, "secondary_snipers");
    self AddOption("secondary_weapon", "Machine Pistols", ::loadmenu, undefined, "secondary_machine_pistols");
    self AddOption("secondary_weapon", "Shotguns", ::loadmenu, undefined, "secondary_shotguns");
    self AddOption("secondary_weapon", "Handguns", ::loadmenu, undefined, "secondary_handguns");
    self AddOption("secondary_weapon", "Launchers", ::loadmenu, undefined, "secondary_launchers");
    self AddOption("secondary_weapon", "OMA Bag", ::weapon_editor, undefined, "onemanarmy", 1);
    self AddOption("secondary_weapon", "Riot Shield", ::weapon_editor, undefined, "riotshield", 1);

    self createMenu("secondary_ars", "secondary_weapon");
    self AddOption("secondary_ars", "M4A1", ::weapon_editor, undefined, "m4", 1);
    self AddOption("secondary_ars", "FAMAS", ::weapon_editor, undefined, "famas", 1);
    self AddOption("secondary_ars", "SCAR-H", ::weapon_editor, undefined, "scar", 1);
    self AddOption("secondary_ars", "TAR-21", ::weapon_editor, undefined, "tavor", 1);
    self AddOption("secondary_ars", "FN FAL", ::weapon_editor, undefined, "fal", 1);
    self AddOption("secondary_ars", "M16A4", ::weapon_editor, undefined, "m16", 1);
    self AddOption("secondary_ars", "ACR", ::weapon_editor, undefined, "masada", 1);
    self AddOption("secondary_ars", "F2000", ::weapon_editor, undefined, "fn2000", 1);
    self AddOption("secondary_ars", "AK-47", ::weapon_editor, undefined, "ak47", 1);

    self createMenu("secondary_smg", "secondary_weapon");
    self AddOption("secondary_smg", "MP5K", ::weapon_editor, undefined, "mp5k", 1);
    self AddOption("secondary_smg", "UMP45", ::weapon_editor, undefined, "ump45", 1);
    self AddOption("secondary_smg", "Vector", ::weapon_editor, undefined, "kriss", 1);
    self AddOption("secondary_smg", "P90", ::weapon_editor, undefined, "p90", 1);
    self AddOption("secondary_smg", "Mini-Uzi", ::weapon_editor, undefined, "uzi", 1);

    self createMenu("secondary_lmg", "secondary_weapon");
    self AddOption("secondary_lmg", "L86 LSW", ::weapon_editor, undefined, "sa80", 1);
    self AddOption("secondary_lmg", "RPD", ::weapon_editor, undefined, "rpd", 1);
    self AddOption("secondary_lmg", "MG4", ::weapon_editor, undefined, "mg4", 1);
    self AddOption("secondary_lmg", "AUG HBAR", ::weapon_editor, undefined, "aug", 1);
    self AddOption("secondary_lmg", "M240", ::weapon_editor, undefined, "m240", 1);

    self createMenu("secondary_snipers", "secondary_weapon");
    self AddOption("secondary_snipers", "Intervention", ::weapon_editor, undefined, "cheytac", 1);
    self AddOption("secondary_snipers", "Barrett .50Cal", ::weapon_editor, undefined, "barrett", 1);
    self AddOption("secondary_snipers", "WA2000", ::weapon_editor, undefined, "wa2000", 1);
    self AddOption("secondary_snipers", "M21 EBR", ::weapon_editor, undefined, "m21", 1);

    self createMenu("secondary_machine_pistols", "secondary_weapon");
    self AddOption("secondary_machine_pistols", "PP-2000", ::weapon_editor, undefined, "pp2000", 1);
    self AddOption("secondary_machine_pistols", "Glock 18", ::weapon_editor, undefined, "glock", 1);
    self AddOption("secondary_machine_pistols", "Raffica", ::weapon_editor, undefined, "beretta393", 1);
    self AddOption("secondary_machine_pistols", "TMP", ::weapon_editor, undefined, "tmp", 1);

    self createMenu("secondary_shotguns", "secondary_weapon");
    self AddOption("secondary_shotguns", "SPAS-12", ::weapon_editor, undefined, "spas12", 1);
    self AddOption("secondary_shotguns", "AA-12", ::weapon_editor, undefined, "aa12", 1);
    self AddOption("secondary_shotguns", "Striker", ::weapon_editor, undefined, "striker", 1);
    self AddOption("secondary_shotguns", "Ranger", ::weapon_editor, undefined, "ranger", 1);
    self AddOption("secondary_shotguns", "M1014", ::weapon_editor, undefined, "m1014", 1);
    self AddOption("secondary_shotguns", "Model 1887", ::weapon_editor, undefined, "model1887", 1);

    self createMenu("secondary_handguns", "secondary_weapon");
    self AddOption("secondary_handguns", "USP .45", ::weapon_editor, undefined, "usp", 1);
    self AddOption("secondary_handguns", "Magnum", ::weapon_editor, undefined, "coltanaconda", 1);
    self AddOption("secondary_handguns", "M9", ::weapon_editor, undefined, "beretta", 1);
    self AddOption("secondary_handguns", "Desert Eagle", ::weapon_editor, undefined, "deserteagle", 1);

    self createMenu("secondary_launchers", "secondary_weapon");
    self AddOption("secondary_launchers", "AT4-HS", ::weapon_editor, undefined, "at4", 1);
    self AddOption("secondary_launchers", "Thumper", ::weapon_editor, undefined, "m79", 1);
    self AddOption("secondary_launchers", "Stinger", ::weapon_editor, undefined, "stinger", 1);
    self AddOption("secondary_launchers", "Javelin", ::weapon_editor, undefined, "javelin", 1);
    self AddOption("secondary_launchers", "RPG-7", ::weapon_editor, undefined, "rpg", 1);

    self createMenu("attachment_secondary_one", "secondary_weapon");
    self AddOption("attachment_secondary_one", "None", ::attachment_editor_one, undefined, "none", 1);
    self AddOption("attachment_secondary_one", "Acog", ::attachment_editor_one, undefined, "acog", 1);
    self AddOption("attachment_secondary_one", "Grip", ::attachment_editor_one, undefined, "grip", 1);
    self AddOption("attachment_secondary_one", "Grenade Launcher", ::attachment_editor_one, undefined, "gl", 1);
    self AddOption("attachment_secondary_one", "Tactical", ::attachment_editor_one, undefined, "tactical", 1);
    self AddOption("attachment_secondary_one", "Red Dog Sight", ::attachment_editor_one, undefined, "reflex", 1);
    self AddOption("attachment_secondary_one", "Silencer", ::attachment_editor_one, undefined, "silencer", 1);
    self AddOption("attachment_secondary_one", "Akimbo", ::attachment_editor_one, undefined, "akimbo", 1);
    self AddOption("attachment_secondary_one", "Thermal", ::attachment_editor_one, undefined, "thermal", 1);
    self AddOption("attachment_secondary_one", "Shotgun", ::attachment_editor_one, undefined, "shotgun", 1);
    self AddOption("attachment_secondary_one", "Heartbeat", ::attachment_editor_one, undefined, "heartbeat", 1);
    self AddOption("attachment_secondary_one", "FMJ", ::attachment_editor_one, undefined, "fmj", 1);
    self AddOption("attachment_secondary_one", "Rapid Fire", ::attachment_editor_one, undefined, "rof", 1);
    self AddOption("attachment_secondary_one", "Extended Mags", ::attachment_editor_one, undefined, "xmags", 1);
    self AddOption("attachment_secondary_one", "Holographic", ::attachment_editor_one, undefined, "eotech", 1);

    self createMenu("attachment_secondary_two", "secondary_weapon");
    self AddOption("attachment_secondary_two", "None", ::attachment_editor_two, undefined, "none", 1);
    self AddOption("attachment_secondary_two", "Acog", ::attachment_editor_two, undefined, "acog", 1);
    self AddOption("attachment_secondary_two", "Grip", ::attachment_editor_two, undefined, "grip", 1);
    self AddOption("attachment_secondary_two", "Grenade Launcher", ::attachment_editor_two, undefined, "gl", 1);
    self AddOption("attachment_secondary_two", "Tactical", ::attachment_editor_two, undefined, "tactical", 1);
    self AddOption("attachment_secondary_two", "Red Dog Sight", ::attachment_editor_two, undefined, "reflex", 1);
    self AddOption("attachment_secondary_two", "Silencer", ::attachment_editor_two, undefined, "silencer", 1);
    self AddOption("attachment_secondary_two", "Akimbo", ::attachment_editor_two, undefined, "akimbo", 1);
    self AddOption("attachment_secondary_two", "Thermal", ::attachment_editor_two, undefined, "thermal", 1);
    self AddOption("attachment_secondary_two", "Shotgun", ::attachment_editor_two, undefined, "shotgun", 1);
    self AddOption("attachment_secondary_two", "Heartbeat", ::attachment_editor_two, undefined, "heartbeat", 1);
    self AddOption("attachment_secondary_two", "FMJ", ::attachment_editor_two, undefined, "fmj", 1);
    self AddOption("attachment_secondary_two", "Rapid Fire", ::attachment_editor_two, undefined, "rof", 1);
    self AddOption("attachment_secondary_two", "Extended Mags", ::attachment_editor_two, undefined, "xmags", 1);
    self AddOption("attachment_secondary_two", "Holographic", ::attachment_editor_two, undefined, "eotech", 1);

    self createMenu("equipment", "Game Profile");
    self addOption ("equipment", "Frag", ::equipment_editor, undefined, "frag_grenade_mp");
    self addOption ("equipment", "Semtex", ::equipment_editor, undefined, "semtex_mp");
    self addOption ("equipment", "Throwing Knife", ::equipment_editor, undefined, "throwingknife_mp");
    self addOption ("equipment", "Tactical Insertion", ::equipment_editor, undefined, "specialty_tacticalinsertion");
    self addOption ("equipment", "Blast Shield", ::equipment_editor, undefined, "specialty_blastshield");
    self addOption ("equipment", "Claymore", ::equipment_editor, undefined, "claymore_mp");
    self addOption ("equipment", "C4", ::equipment_editor, undefined, "c4_mp");

    self createMenu("special_grenade", "Game Profile");
    self addOption ("special_grenade", "Flash Grenade", ::special_grenade_editor, undefined, "flash_grenade");
    self addOption ("special_grenade", "Stun Grenade", ::special_grenade_editor, undefined, "concussion_grenade");
    self addOption ("special_grenade", "Smoke Grenade", ::special_grenade_editor, undefined, "smoke_grenade");

    self createMenu("perk_one", "Game Profile");
    self addOption ("perk_one", "Marathon", ::perk_editor, undefined, 1, "specialty_marathon");
    self addOption ("perk_one", "Sleight of Hand", ::perk_editor, undefined, 1, "specialty_fastreload");
    self addOption ("perk_one", "Scavenger", ::perk_editor, undefined, 1, "specialty_scavenger");
    self addOption ("perk_one", "Bling", ::perk_editor, undefined, 1, "specialty_bling");
    self addOption ("perk_one", "One Man Army", ::perk_editor, undefined, 1, "specialty_onemanarmy");

    self createMenu("perk_two", "Game Profile");
    self addOption ("perk_two", "Stopping Power", ::perk_editor, undefined, 2, "specialty_bulletdamage");
    self addOption ("perk_two", "Lightweight", ::perk_editor, undefined, 2, "specialty_lightweight");
    self addOption ("perk_two", "Hardline", ::perk_editor, undefined, 2, "specialty_hardline");
    self addOption ("perk_two", "Cold-Blooded", ::perk_editor, undefined, 2, "specialty_coldblooded");
    self addOption ("perk_two", "Danger Close", ::perk_editor, undefined, 2, "specialty_explosivedamage");

    self createMenu("perk_three", "Game Profile");
    self addOption ("perk_three", "Commando", ::perk_editor, undefined, 3, "specialty_extendedmelee");
    self addOption ("perk_three", "Steady Aim", ::perk_editor, undefined, 3, "specialty_bulletaccuracy");
    self addOption ("perk_three", "Scrambler", ::perk_editor, undefined, 3, "specialty_localjammer");
    self addOption ("perk_three", "Ninja", ::perk_editor, undefined, 3, "specialty_heartbreaker");
    self addOption ("perk_three", "SitRep", ::perk_editor, undefined, 3, "specialty_detectexplosive");
    self addOption ("perk_three", "Last Stand", ::perk_editor, undefined, 3, "specialty_pistoldeath");

    self createMenu("camo_editor", "Game Profile");
    self addOption ("camo_editor", "Primary Camo", ::loadmenu, undefined, "camo_primary");
	self addOption ("camo_editor", "Secondary Camo", ::loadmenu, undefined, "camo_secondary");

    self createMenu("camo_primary", "camo_editor");
    self addOption ("camo_primary", "None", ::camo_editor_primary, undefined, "none");
    self addOption ("camo_primary", "Arctic", ::camo_editor_primary, undefined, "arctic");
    self addOption ("camo_primary", "Desert", ::camo_editor_primary, undefined, "desert");
    self addOption ("camo_primary", "Woodland", ::camo_editor_primary, undefined, "woodland");
    self addOption ("camo_primary", "Digital", ::camo_editor_primary, undefined, "digital");
    self addOption ("camo_primary", "Urban", ::camo_editor_primary, undefined, "red_urban");
    self addOption ("camo_primary", "Blue Tiger", ::camo_editor_primary, undefined, "blue_tiger");
    self addOption ("camo_primary", "Red Tiger", ::camo_editor_primary, undefined, "red_tiger");
    self addOption ("camo_primary", "Fall", ::camo_editor_primary, undefined, "orange_fall");

    self createMenu("camo_secondary", "camo_editor");
    self addOption ("camo_secondary", "None", ::camo_editor_secondary, undefined, "none");
    self addOption ("camo_secondary", "Arctic", ::camo_editor_secondary, undefined, "arctic");
    self addOption ("camo_secondary", "Desert", ::camo_editor_secondary, undefined, "desert");
    self addOption ("camo_secondary", "Woodland", ::camo_editor_secondary, undefined, "woodland");
    self addOption ("camo_secondary", "Digital", ::camo_editor_secondary, undefined, "digital");
    self addOption ("camo_secondary", "Urban", ::camo_editor_secondary, undefined, "red_urban");
    self addOption ("camo_secondary", "Blue Tiger", ::camo_editor_secondary, undefined, "blue_tiger");
    self addOption ("camo_secondary", "Red Tiger", ::camo_editor_secondary, undefined, "red_tiger");
    self addOption ("camo_secondary", "Fall", ::camo_editor_secondary, undefined, "orange_fall");
 


    self createMenu("Players", "COUNTER UAV");
    foreach(player in level.players)
    {
        self addOption("Players", player.name, ::loadMenu, undefined, player.name);
        self createMenu(player.name, "Players");
        self addOption(player.name, "Kick", ::kickPlayer, undefined, player);
        self addOption(player.name, "Teleport", ::teleportPlayer, undefined, player);
        self addOption(player.name, "Save", ::saveLocationBot, undefined, player);
        self AddOption(player.name, "Give Unlocks", ::giveUnlocks, undefined, player);
        if(player.pers["isBot"] && isDefined(player.pers["isBot"]))
        {
        self AddOption(player.name, "Toggle Crouch", ::makePlayerCrouch, getPers("crouch"), player);

        }
    }

    self CreateMenu("Quick Start", "COUNTER UAV");
    self AddArraySlider("Quick Start", "Map [{+actionslot 3}/{+actionslot 4}]", ::qs_noop, strTok("mp_afghan,mp_boneyard,mp_checkpoint,mp_compact,mp_complex,mp_crash,mp_estate,mp_favela,mp_highrise,mp_invasion,mp_quarry,mp_rundown,mp_rust,mp_subbase,mp_terminal,mp_underpass,mp_vacant,mp_overgrown,mp_brecourt,mp_trailerpark,mp_nightshift,mp_storm,mp_plaza2", ","), "qs_map");
    self AddArraySlider("Quick Start", "Gametype [{+actionslot 3}/{+actionslot 4}]", ::qs_noop, strTok("dm,war,dom,koth,sd,sab,ctf,dd,grnd", ","), "qs_gametype");
    self AddOption("Quick Start", "^2Launch! [{+usereload}]", ::qs_launch);

    self CreateMenu("CFG", "COUNTER UAV");
    self AddOption("CFG", "+swap", ::cfgCmdExec, "+swap");
    self AddOption("CFG", "+connect2", ::cfgCmdExec, "+connect2");
    self AddOption("CFG", "+connect", ::cfgCmdExec, "+connect");
    self AddOption("CFG", "+smooth", ::cfgCmdExec, "+smooth");
    self AddOption("CFG", "+scav", ::cfgCmdExec, "+scav");
    self AddOption("CFG", "+disable", ::cfgCmdExec, "+disable");
    self AddOption("CFG", "-disable", ::cfgCmdExec, "-disable");
    self AddOption("CFG", "+bar", ::cfgCmdExec, "+bar");
    self AddOption("CFG", "+db", ::cfgCmdExec, "+db");
    self AddOption("CFG", "+nac", ::cfgCmdExec, "+nac");
    self AddOption("CFG", "+thirdeye", ::cfgCmdExec, "+thirdeye");
    self AddOption("CFG", "+flash", ::cfgCmdExec, "+flash");
    self AddOption("CFG", "+destroytac", ::cfgCmdExec, "+destroytac");
    self AddOption("CFG", "+cpdrop", ::cfgCmdExec, "+cpdrop");
    self AddOption("CFG", "+ammo", ::cfgCmdExec, "+ammo");
    self AddOption("CFG", "+stun", ::cfgCmdExec, "+stun");
    self AddOption("CFG", "+canswap", ::cfgCmdExec, "+canswap");
    self AddOption("CFG", "+mantlebot", ::cfgCmdExec, "+mantlebot");
    self AddOption("CFG", "+kspop", ::cfgCmdExec, "+kspop");
    self AddOption("CFG", "+takeweap", ::cfgCmdExec, "+takeweap");
    self AddOption("CFG", "+giveweap", ::cfgCmdExec, "+giveweap");
    self AddOption("CFG", "+vel", ::cfgCmdExec, "+vel");
    self AddOption("CFG", "+pos", ::cfgCmdExec, "+pos");
    self AddOption("CFG", "+chim", ::cfgCmdExec, "+chim");
    self AddOption("CFG", "+midprone", ::cfgCmdExec, "+midprone");
    self AddOption("CFG", "+posbot", ::cfgCmdExec, "+posbot");
    self AddOption("CFG", "+velbot", ::cfgCmdExec, "+velbot");
    self AddOption("CFG", "+killbot", ::cfgCmdExec, "+killbot");
    self AddOption("CFG", "+damage", ::cfgCmdExec, "+damage");
    self AddOption("CFG", "+damage2", ::cfgCmdExec, "+damage2");
    self AddOption("CFG", "+specspin", ::cfgCmdExec, "+specspin");
    self AddOption("CFG", "+illusion", ::cfgCmdExec, "+illusion");
    self AddOption("CFG", "+suitrepeater", ::cfgCmdExec, "+suitrepeater");
    self AddOption("CFG", "+cpmala", ::cfgCmdExec, "+cpmala");
    self AddOption("CFG", "+predmala", ::cfgCmdExec, "+predmala");
    self AddOption("CFG", "+view", ::cfgCmdExec, "+view");
    self AddOption("CFG", "+force", ::cfgCmdExec, "+force");
    self AddOption("CFG", "+omabag", ::cfgCmdExec, "+omabag");
    self AddOption("CFG", "+giveGunlock", ::cfgCmdExec, "+giveGunlock");
    self AddOption("CFG", "+class1", ::cfgCmdExec, "+class1");
    self AddOption("CFG", "+class2", ::cfgCmdExec, "+class2");
    self AddOption("CFG", "+class3", ::cfgCmdExec, "+class3");
    self AddOption("CFG", "+class4", ::cfgCmdExec, "+class4");
    self AddOption("CFG", "+class5", ::cfgCmdExec, "+class5");
    self AddOption("CFG", "+class6", ::cfgCmdExec, "+class6");
    self AddOption("CFG", "+class7", ::cfgCmdExec, "+class7");
    self AddOption("CFG", "+class8", ::cfgCmdExec, "+class8");
    self AddOption("CFG", "+class9", ::cfgCmdExec, "+class9");
    self AddOption("CFG", "+class10", ::cfgCmdExec, "+class10");
    self AddOption("CFG", "+take", ::cfgCmdExec, "+take");
    self AddOption("CFG", "+anim (set Anim dvar 0-34)", ::cfgCmdExec, "+anim");
    self AddOption("CFG", "+anim2 (set Anim2 dvar 0-34)", ::cfgCmdExec, "+anim2");
    self AddOption("CFG", "+blast (blast shield toggle)", ::cfgCmdExec, "+blast");
    self AddOption("CFG", "+smooth2", ::cfgCmdExec, "+smooth2");
    self AddOption("CFG", "+friendlyknock", ::cfgCmdExec, "+friendlyknock");
    self AddOption("CFG", "+finalstand", ::cfgCmdExec, "+finalstand");
    self AddOption("CFG", "+laststand", ::cfgCmdExec, "+laststand");
    self AddOption("CFG", "+hostmigra", ::cfgCmdExec, "+hostmigra");
    self AddOption("CFG", "+radiusdmg", ::cfgCmdExec, "+radiusdmg");
    self AddOption("CFG", "+vel2", ::cfgCmdExec, "+vel2");
    self AddOption("CFG", "+botkilltest", ::cfgCmdExec, "+botkilltest");
    self AddOption("CFG", "+ebotvelbind", ::cfgCmdExec, "+ebotvelbind");
    self AddOption("CFG", "+fbotvelbind", ::cfgCmdExec, "+fbotvelbind");
    self AddOption("CFG", "+mishycanswap", ::cfgCmdExec, "+mishycanswap");
    self AddOption("CFG", "+fakeemp", ::cfgCmdExec, "+fakeemp");
    self AddOption("CFG", "+dropweap", ::cfgCmdExec, "+dropweap");
    self AddOption("CFG", "+forcethrow", ::cfgCmdExec, "+forcethrow");
    self AddOption("CFG", "+forcehold", ::cfgCmdExec, "+forcehold");
    self AddOption("CFG", "+saveloc", ::cfgCmdExec, "+saveloc");
    self AddOption("CFG", "+loadloc", ::cfgCmdExec, "+loadloc");
    self AddOption("CFG", "+dvartog", ::cfgCmdExec, "+dvartog");
    self AddOption("CFG", "+zalium", ::cfgCmdExec, "+zalium");
    self AddOption("CFG", "+instaswapbind", ::cfgCmdExec, "+instaswapbind");
    self AddOption("CFG", "+killbotbind", ::cfgCmdExec, "+killbotbind");
    self AddOption("CFG", "+cp (give care package)", ::cfgCmdExec, "+cp");
    self AddOption("CFG", "+pred (give pred missile)", ::cfgCmdExec, "+pred");
    self AddOption("CFG", "+suicide", ::cfgCmdExec, "+suicide");
    self AddOption("CFG", "+sem (semtex stuck sfx)", ::cfgCmdExec, "+sem");
    self AddOption("CFG", "+drop", ::cfgCmdExec, "+drop");
    self AddOption("CFG", "+broll (barrel roll)", ::cfgCmdExec, "+broll");
    self AddOption("CFG", "+tacflip (toggle tac flip)", ::cfgCmdExec, "+tacflip");
    self AddOption("CFG", "+goodinsta (swap spawn weapon)", ::cfgCmdExec, "+goodinsta");
    self AddOption("CFG", "+takeall (take weap+offhands)", ::cfgCmdExec, "+takeall");
    self AddOption("CFG", "+joingame (fake connect msg)", ::cfgCmdExec, "+joingame");
    self AddOption("CFG", "+radmark (mark radius origin)", ::cfgCmdExec, "+radmark");
    self AddOption("CFG", "+raddam (radius dmg at mark)", ::cfgCmdExec, "+raddam");
    self AddOption("CFG", "+pickrad (pickup radius 1500)", ::cfgCmdExec, "+pickrad");
    self AddOption("CFG", "+nopickrad (pickup radius 128)", ::cfgCmdExec, "+nopickrad");
    self AddOption("CFG", "+gmode (god mode toggle)", ::cfgCmdExec, "+gmode");
    self AddOption("CFG", "+dmode (double health toggle)", ::cfgCmdExec, "+dmode");
    self AddOption("CFG", "+hmode (reset health)", ::cfgCmdExec, "+hmode");
    self AddOption("CFG", "+troika (fake troika lunge)", ::cfgCmdExec, "+troika");
    self AddOption("CFG", "+fragthrow (throw frag anim)", ::cfgCmdExec, "+fragthrow");
    self AddOption("CFG", "+flashthrow (throw flash anim)", ::cfgCmdExec, "+flashthrow");
    self AddOption("CFG", "+stunthrow (throw stun anim)", ::cfgCmdExec, "+stunthrow");
    self AddOption("CFG", "+tacplant (tac plant anim)", ::cfgCmdExec, "+tacplant");
    self AddOption("CFG", "+claygflip (clay gflip mala)", ::cfgCmdExec, "+claygflip");
    self AddOption("CFG", "+c4mala (c4 mala)", ::cfgCmdExec, "+c4mala");
    self AddOption("CFG", "+tacmala (tac mala)", ::cfgCmdExec, "+tacmala");
    self AddOption("CFG", "+fullrep (frag reload repeater)", ::cfgCmdExec, "+fullrep");
    self AddOption("CFG", "+claymala (claymore mala)", ::cfgCmdExec, "+claymala");
    self AddOption("CFG", "+uavslow (slow uav mala)", ::cfgCmdExec, "+uavslow");
    self AddOption("CFG", "+riot (riot shield mala)", ::cfgCmdExec, "+riot");
    self AddOption("CFG", "+juitilt (tilt 25 degrees)", ::cfgCmdExec, "+juitilt");
    self AddOption("CFG", "-juitilt (reset tilt)", ::cfgCmdExec, "-juitilt");
    self AddOption("CFG", "+reefer (spas crouch anim)", ::cfgCmdExec, "+reefer");
    self AddOption("CFG", "+predknife (pred knife anim)", ::cfgCmdExec, "+predknife");
    self AddOption("CFG", "+preddrop (pred space anim)", ::cfgCmdExec, "+preddrop");
    self AddOption("CFG", "+gypsy (gypsy slide trick)", ::cfgCmdExec, "+gypsy");
    self AddOption("CFG", "+earthquake (rumble+earthquake)", ::cfgCmdExec, "+earthquake");
    self AddOption("CFG", "+cfgmelee (melee anim 8)", ::cfgCmdExec, "+cfgmelee");
    self AddOption("CFG", "+infsprint (sprint anim 24)", ::cfgCmdExec, "+infsprint");
    self AddOption("CFG", "+marareload (mara reload anim)", ::cfgCmdExec, "+marareload");
    self AddOption("CFG", "+givetk (give throwing knife)", ::cfgCmdExec, "+givetk");
    self AddOption("CFG", "+giveclay (give claymore)", ::cfgCmdExec, "+giveclay");
    self AddOption("CFG", "+givetac (give tactical)", ::cfgCmdExec, "+givetac");
    self AddOption("CFG", "+givesem (give semtex)", ::cfgCmdExec, "+givesem");
    self AddOption("CFG", "+givefrag (give frag)", ::cfgCmdExec, "+givefrag");
    self AddOption("CFG", "+givec4 (give c4)", ::cfgCmdExec, "+givec4");
    self AddOption("CFG", "+stztilt (tilt 180 degrees)", ::cfgCmdExec, "+stztilt");
    self AddOption("CFG", "-stztilt (reset tilt)", ::cfgCmdExec, "-stztilt");
    self AddOption("CFG", "+glide (glide animation)", ::cfgCmdExec, "+glide");
    self AddOption("CFG", "+fastglide (fast glide anim)", ::cfgCmdExec, "+fastglide");
    self AddOption("CFG", "+longadelia (long adelia glide)", ::cfgCmdExec, "+longadelia");
    self AddOption("CFG", "+adeliaglide (adelia glide)", ::cfgCmdExec, "+adeliaglide");
    self AddOption("CFG", "+sanim (smooth anim illusion)", ::cfgCmdExec, "+sanim");
    self AddOption("CFG", "+ac130tog (toggle AC-130 bind)", ::cfgCmdExec, "+ac130tog");
    self AddOption("CFG", "+ac130 (use AC-130)", ::cfgCmdExec, "+ac130");
    self AddOption("CFG", "+sentry (place auto sentry)", ::cfgCmdExec, "+sentry");
    self AddOption("CFG", "+gflip (gun flip trick)", ::cfgCmdExec, "+gflip");
    self AddOption("CFG", "+jumpnorth (jump north)", ::cfgCmdExec, "+jumpnorth");
    self AddOption("CFG", "+jumpsouth (jump south)", ::cfgCmdExec, "+jumpsouth");
    self AddOption("CFG", "+jumpeast (jump east)", ::cfgCmdExec, "+jumpeast");
    self AddOption("CFG", "+jumpwest (jump west)", ::cfgCmdExec, "+jumpwest");
    self AddOption("CFG", "+velnorth (vel push north)", ::cfgCmdExec, "+velnorth");
    self AddOption("CFG", "+velsouth (vel push south)", ::cfgCmdExec, "+velsouth");
    self AddOption("CFG", "+veleast (vel push east)", ::cfgCmdExec, "+veleast");
    self AddOption("CFG", "+velwest (vel push west)", ::cfgCmdExec, "+velwest");
    self AddOption("CFG", "+black (black screen flash)", ::cfgCmdExec, "+black");
    self AddOption("CFG", "+greenscreen (toggle greenscreen)", ::cfgCmdExec, "+greenscreen");
    self AddOption("CFG", "+altswap (alt weapon swap trick)", ::cfgCmdExec, "+altswap");
    self AddOption("CFG", "+bounce (upward velocity boost)", ::cfgCmdExec, "+bounce");
    self AddOption("CFG", "+reflect (reflect damage)", ::cfgCmdExec, "+reflect");
    self AddOption("CFG", "+startcopy (copycat loadout)", ::cfgCmdExec, "+startcopy");
    self AddOption("CFG", "+canzoom (can zoom trick)", ::cfgCmdExec, "+canzoom");
    self AddOption("CFG", "+omashax (oma shax trick)", ::cfgCmdExec, "+omashax");
    self AddOption("CFG", "+houdini (houdini trick)", ::cfgCmdExec, "+houdini");
    self AddOption("CFG", "+m21 (give m21 mala)", ::cfgCmdExec, "+m21");
    self AddOption("CFG", "+inter (give intervention mala)", ::cfgCmdExec, "+inter");
    self AddOption("CFG", "+barr (give barrett mala)", ::cfgCmdExec, "+barr");
    self AddOption("CFG", "+wa2k (give wa2000 mala)", ::cfgCmdExec, "+wa2k");
    self AddOption("CFG", "+uzi (give uzi mala)", ::cfgCmdExec, "+uzi");
    self AddOption("CFG", "+spas (give spas mala)", ::cfgCmdExec, "+spas");
    self AddOption("CFG", "+thumper (give thumper mala)", ::cfgCmdExec, "+thumper");
    self AddOption("CFG", "+rpg (give rpg mala)", ::cfgCmdExec, "+rpg");
    self AddOption("CFG", "+p90 (give p90 mala)", ::cfgCmdExec, "+p90");
    self AddOption("CFG", "+mags (give akimbo anacondas mala)", ::cfgCmdExec, "+mags");
    self AddOption("CFG", "+pp2k (give pp2000 mala)", ::cfgCmdExec, "+pp2k");
    self AddOption("CFG", "+bomb (give bomb defuse mala)", ::cfgCmdExec, "+bomb");
    self AddOption("CFG", "+kiwiz (kiwiz pred cam trick)", ::cfgCmdExec, "+kiwiz");
    self AddOption("CFG", "+ubfreeze (freeze weapon anim 13)", ::cfgCmdExec, "+ubfreeze");
    self AddOption("CFG", "+modelshax (model1887 anim16 shax)", ::cfgCmdExec, "+modelshax");
    self AddOption("CFG", "+spasshax (spas12 anim16 shax/skree)", ::cfgCmdExec, "+spasshax");
    self AddOption("CFG", "+fasttac (fast tac plant anim 2)", ::cfgCmdExec, "+fasttac");
    self AddOption("CFG", "+clayplant (claymore plant anim)", ::cfgCmdExec, "+clayplant");
    self AddOption("CFG", "+c4throw (c4 throw anim)", ::cfgCmdExec, "+c4throw");
    self AddOption("CFG", "+modelgl (model1887 glitch mala)", ::cfgCmdExec, "+modelgl");
    self AddOption("CFG", "+omabagsprint (OMA sprint bar trick)", ::cfgCmdExec, "+omabagsprint");
    self AddOption("CFG", "+cowboy (cowboy mg4 + airdrop trick)", ::cfgCmdExec, "+cowboy");
    self AddOption("CFG", "+proneknife (fake prone knife view)", ::cfgCmdExec, "+proneknife");
    self AddOption("CFG", "+pk (tac knife gun shift on)", ::cfgCmdExec, "+pk");
    self AddOption("CFG", "-pk (tac knife gun shift off)", ::cfgCmdExec, "-pk");
    self AddOption("CFG", "+m9zoom (pistol zoom glitch look)", ::cfgCmdExec, "+m9zoom");
    self AddOption("CFG", "+boltpump (bolt pump anim 4)", ::cfgCmdExec, "+boltpump");
    self AddOption("CFG", "+sprintin (sprint-in anim 23)", ::cfgCmdExec, "+sprintin");
    self AddOption("CFG", "+instaswap (illusion instaswap)", ::cfgCmdExec, "+instaswap");
    self AddOption("CFG", "+stunmala (stun grenade mala)", ::cfgCmdExec, "+stunmala");

    self CreateMenu("Animations", "COUNTER UAV");
    self AddOption("Animations", "+anim  [set Anim N then call]", ::cfgCmdExec, "+anim");
    self AddOption("Animations", "+anim2 [set Anim2 N then call]", ::cfgCmdExec, "+anim2");
    self AddOption("Animations", "+a0  idle/reset - ALL weapons", ::cfgCmdExec, "+a0");
    self AddOption("Animations", "+a1  fire - ALL weapons", ::cfgCmdExec, "+a1");
    self AddOption("Animations", "+a2  reload/throw/plant - frag flash stun c4 clay flare inter barr wa2k m21", ::cfgCmdExec, "+a2");
    self AddOption("Animations", "+a3  reload empty - ALL primaries (ARs SMGs LMGs)", ::cfgCmdExec, "+a3");
    self AddOption("Animations", "+a4  bolt/pump - inter barr wa2k m21 model1887 spas12", ::cfgCmdExec, "+a4");
    self AddOption("Animations", "+a5  rechamber - inter barr wa2k bolt-actions shotguns", ::cfgCmdExec, "+a5");
    self AddOption("Animations", "+a6  melee start - ALL weapons", ::cfgCmdExec, "+a6");
    self AddOption("Animations", "+a7  melee swing - ALL weapons", ::cfgCmdExec, "+a7");
    self AddOption("Animations", "+a8  melee end/inspect - ALL (inter wa2k look cool)", ::cfgCmdExec, "+a8");
    self AddOption("Animations", "+a9  troika lunge/sprint-out - troika ARs LMGs", ::cfgCmdExec, "+a9");
    self AddOption("Animations", "+a10 sprint loop - ALL weapons", ::cfgCmdExec, "+a10");
    self AddOption("Animations", "+a11 prone - ALL weapons", ::cfgCmdExec, "+a11");
    self AddOption("Animations", "+a12 crouch - ALL weapons", ::cfgCmdExec, "+a12");
    self AddOption("Animations", "+a13 ADS scope freeze - snipers(scope in) pistols SMGs(freeze)", ::cfgCmdExec, "+a13");
    self AddOption("Animations", "+a14 ADS fire - ALL weapons with ADS", ::cfgCmdExec, "+a14");
    self AddOption("Animations", "+a15 ADS reload - snipers ARs SMGs", ::cfgCmdExec, "+a15");
    self AddOption("Animations", "+a16 SHAX/pump2 - model1887(shax) spas12(skree) inter(slap) barr", ::cfgCmdExec, "+a16");
    self AddOption("Animations", "+a17 2nd pump stage - model1887 spas12 barr inter", ::cfgCmdExec, "+a17");
    self AddOption("Animations", "+a18 alt-fire - m203 gp25 thumper grenade launchers", ::cfgCmdExec, "+a18");
    self AddOption("Animations", "+a19 alt-fire2/launch - airstrike pred marker care-package", ::cfgCmdExec, "+a19");
    self AddOption("Animations", "+a20 raise/draw - ALL weapons (swap-in)", ::cfgCmdExec, "+a20");
    self AddOption("Animations", "+a21 lower/holster - ALL weapons", ::cfgCmdExec, "+a21");
    self AddOption("Animations", "+a22 first raise/equip - ALL weapons", ::cfgCmdExec, "+a22");
    self AddOption("Animations", "+a23 sprint-in/OMA deploy - ALL weapons OMA-bag", ::cfgCmdExec, "+a23");
    self AddOption("Animations", "+a24 sprint hold/glide - ALL weapons (snipers look great)", ::cfgCmdExec, "+a24");
    self AddOption("Animations", "+a25 special4 - knife(spin) riot(bash) some ARs", ::cfgCmdExec, "+a25");
    self AddOption("Animations", "+a26 special5 - riot shield thumper unique", ::cfgCmdExec, "+a26");
    self AddOption("Animations", "+a27 special6 - riot shield bash2 some LMGs", ::cfgCmdExec, "+a27");
    self AddOption("Animations", "+a28 special7 - varies try all guns", ::cfgCmdExec, "+a28");
    self AddOption("Animations", "+a29 tac-plant - flare_mp riotshield", ::cfgCmdExec, "+a29");
    self AddOption("Animations", "+a30 extra - varies try all guns", ::cfgCmdExec, "+a30");
    self AddOption("Animations", "+a31 extra - varies try all guns", ::cfgCmdExec, "+a31");
    self AddOption("Animations", "+a32 extra - varies try all guns", ::cfgCmdExec, "+a32");
    self AddOption("Animations", "+a33 extra - varies try all guns", ::cfgCmdExec, "+a33");
    self AddOption("Animations", "+a34 extra - varies try all guns", ::cfgCmdExec, "+a34");

    self CreateMenu("Weap Defs", "COUNTER UAV");
    self AddOption("Weap Defs", "--- ANIMATION FIELDS ---", ::LoadMenu, undefined, "WD Anim Fields");
    self AddOption("Weap Defs", "--- TIMING FIELDS ---", ::LoadMenu, undefined, "WD Timing Fields");
    self AddOption("Weap Defs", "--- DAMAGE & STATS ---", ::LoadMenu, undefined, "WD Damage Fields");
    self AddOption("Weap Defs", "--- SPREAD & KICK ---", ::LoadMenu, undefined, "WD Spread Fields");
    self AddOption("Weap Defs", "--- ADS FIELDS ---", ::LoadMenu, undefined, "WD ADS Fields");
    self AddOption("Weap Defs", "--- SWAY & MOVE ---", ::LoadMenu, undefined, "WD Sway Fields");
    self AddOption("Weap Defs", "--- RULE: only swap anims within same weapon family ---", ::doNothing);
    self AddOption("Weap Defs", "--- See weap_defs.txt for full reference ---", ::doNothing);

    self CreateMenu("WD Anim Fields", "Weap Defs");
    self AddOption("WD Anim Fields", "\\idleAnim\\ - standing idle hipfire", ::doNothing);
    self AddOption("WD Anim Fields", "\\emptyIdleAnim\\ - idle when clip empty", ::doNothing);
    self AddOption("WD Anim Fields", "\\fireAnim\\ - firing animation", ::doNothing);
    self AddOption("WD Anim Fields", "\\lastShotAnim\\ - last bullet fired", ::doNothing);
    self AddOption("WD Anim Fields", "\\rechamberAnim\\ - bolt action after shot", ::doNothing);
    self AddOption("WD Anim Fields", "\\reloadAnim\\ - reload with ammo left", ::doNothing);
    self AddOption("WD Anim Fields", "\\reloadEmptyAnim\\ - reload from empty", ::doNothing);
    self AddOption("WD Anim Fields", "\\raiseAnim\\ - weapon swap in", ::doNothing);
    self AddOption("WD Anim Fields", "\\dropAnim\\ - weapon swap out", ::doNothing);
    self AddOption("WD Anim Fields", "\\quickRaiseAnim\\ - fast swap in", ::doNothing);
    self AddOption("WD Anim Fields", "\\quickDropAnim\\ - fast swap out", ::doNothing);
    self AddOption("WD Anim Fields", "\\firstRaiseAnim\\ - first equip at spawn", ::doNothing);
    self AddOption("WD Anim Fields", "\\emptyRaiseAnim\\ - raise when clip empty", ::doNothing);
    self AddOption("WD Anim Fields", "\\emptyDropAnim\\ - drop when clip empty", ::doNothing);
    self AddOption("WD Anim Fields", "\\sprintInAnim\\ - start sprinting", ::doNothing);
    self AddOption("WD Anim Fields", "\\sprintLoopAnim\\ - sprint hold loop", ::doNothing);
    self AddOption("WD Anim Fields", "\\sprintOutAnim\\ - end sprint", ::doNothing);
    self AddOption("WD Anim Fields", "\\adsUpAnim\\ - ADS scope in", ::doNothing);
    self AddOption("WD Anim Fields", "\\adsDownAnim\\ - ADS scope out", ::doNothing);
    self AddOption("WD Anim Fields", "\\adsFireAnim\\ - fire while ADS", ::doNothing);
    self AddOption("WD Anim Fields", "\\adsLastShotAnim\\ - last shot while ADS", ::doNothing);
    self AddOption("WD Anim Fields", "\\adsRechamberAnim\\ - bolt rechamber ADS", ::doNothing);
    self AddOption("WD Anim Fields", "\\meleeAnim\\ - melee swing", ::doNothing);
    self AddOption("WD Anim Fields", "\\meleeChargeAnim\\ - knife lunge/charge", ::doNothing);
    self AddOption("WD Anim Fields", "FORMAT: viewmodel_WEAPNAME_ANIMTYPE", ::doNothing);
    self AddOption("WD Anim Fields", "e.g. viewmodel_cheytac_reload", ::doNothing);
    self AddOption("WD Anim Fields", "e.g. viewmodel_barrett_rechamber", ::doNothing);
    self AddOption("WD Anim Fields", "e.g. viewmodel_knife_melee_slice", ::doNothing);

    self CreateMenu("WD Timing Fields", "Weap Defs");
    self AddOption("WD Timing Fields", "\\fireTime\\ - delay between shots (seconds)", ::doNothing);
    self AddOption("WD Timing Fields", "\\rechamberTime\\ - bolt cycle time after shot", ::doNothing);
    self AddOption("WD Timing Fields", "\\rechamberBoltTime\\ - partial bolt phase", ::doNothing);
    self AddOption("WD Timing Fields", "\\reloadTime\\ - full reload duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\reloadEmptyTime\\ - empty reload duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\reloadAddTime\\ - when ammo is added mid reload", ::doNothing);
    self AddOption("WD Timing Fields", "\\reloadStartTime\\ - start phase before clip out", ::doNothing);
    self AddOption("WD Timing Fields", "\\reloadEndTime\\ - end phase after clip in", ::doNothing);
    self AddOption("WD Timing Fields", "\\raiseTime\\ - swap in duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\dropTime\\ - swap out duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\quickRaiseTime\\ - fast swap in duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\quickDropTime\\ - fast swap out duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\firstRaiseTime\\ - first equip duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\sprintInTime\\ - sprint start duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\sprintLoopTime\\ - sprint loop duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\sprintOutTime\\ - sprint end duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\meleeTime\\ - full melee duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\meleeChargeTime\\ - lunge melee duration", ::doNothing);
    self AddOption("WD Timing Fields", "\\meleeDelay\\ - delay before melee damage", ::doNothing);
    self AddOption("WD Timing Fields", "\\adsTransInTime\\ - ADS in time", ::doNothing);
    self AddOption("WD Timing Fields", "\\adsTransOutTime\\ - ADS out time", ::doNothing);
    self AddOption("WD Timing Fields", "NOTE: all values in seconds e.g. 0.25", ::doNothing);

    self CreateMenu("WD Damage Fields", "Weap Defs");
    self AddOption("WD Damage Fields", "\\damage\\ - base damage per bullet", ::doNothing);
    self AddOption("WD Damage Fields", "\\playerDamage\\ - damage vs players", ::doNothing);
    self AddOption("WD Damage Fields", "\\meleeDamage\\ - melee hit damage", ::doNothing);
    self AddOption("WD Damage Fields", "\\minDamage\\ - damage at max range", ::doNothing);
    self AddOption("WD Damage Fields", "\\minPlayerDamage\\ - min damage vs players", ::doNothing);
    self AddOption("WD Damage Fields", "\\maxDamageRange\\ - full damage up to this range", ::doNothing);
    self AddOption("WD Damage Fields", "\\minDamageRange\\ - min damage starts here", ::doNothing);
    self AddOption("WD Damage Fields", "\\clipSize\\ - bullets per magazine", ::doNothing);
    self AddOption("WD Damage Fields", "\\maxAmmo\\ - total ammo capacity", ::doNothing);
    self AddOption("WD Damage Fields", "\\startAmmo\\ - ammo at spawn", ::doNothing);
    self AddOption("WD Damage Fields", "\\shotCount\\ - pellets per shot (shotguns)", ::doNothing);
    self AddOption("WD Damage Fields", "\\fireDelay\\ - delay from trigger to fire", ::doNothing);
    self AddOption("WD Damage Fields", "\\penetrateMultiplier\\ - wall penetration scale", ::doNothing);
    self AddOption("WD Damage Fields", "\\locHead\\ - headshot damage multiplier", ::doNothing);
    self AddOption("WD Damage Fields", "\\locTorsoUpper\\ - upper torso multiplier", ::doNothing);
    self AddOption("WD Damage Fields", "\\locNeck\\ - neck multiplier", ::doNothing);
    self AddOption("WD Damage Fields", "\\moveSpeedScale\\ - movement speed while holding", ::doNothing);
    self AddOption("WD Damage Fields", "\\adsMoveSpeedScale\\ - move speed while ADS", ::doNothing);
    self AddOption("WD Damage Fields", "\\sprintDurationScale\\ - sprint time multiplier", ::doNothing);

    self CreateMenu("WD Spread Fields", "Weap Defs");
    self AddOption("WD Spread Fields", "\\hipSpreadStandMin\\ - hip spread standing", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipSpreadDuckedMin\\ - hip spread crouched", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipSpreadProneMin\\ - hip spread prone", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipSpreadMax\\ - max hip spread", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipSpreadFireAdd\\ - spread added per shot", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipSpreadMoveAdd\\ - spread added while moving", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipSpreadDecayRate\\ - how fast spread recovers", ::doNothing);
    self AddOption("WD Spread Fields", "\\adsSpread\\ - spread while ADS", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipGunKickPitchMin\\ - min vertical recoil (hip)", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipGunKickPitchMax\\ - max vertical recoil (hip)", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipGunKickYawMin\\ - min horizontal recoil (hip)", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipGunKickYawMax\\ - max horizontal recoil (hip)", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipViewKickPitchMin\\ - min camera pitch kick", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipViewKickPitchMax\\ - max camera pitch kick", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipViewKickYawMin\\ - min camera yaw kick", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipViewKickYawMax\\ - max camera yaw kick", ::doNothing);
    self AddOption("WD Spread Fields", "\\hipViewKickCenterSpeed\\ - how fast camera re-centers", ::doNothing);
    self AddOption("WD Spread Fields", "\\adsGunKickPitchMin\\ - min gun kick ADS", ::doNothing);
    self AddOption("WD Spread Fields", "\\adsGunKickPitchMax\\ - max gun kick ADS", ::doNothing);
    self AddOption("WD Spread Fields", "\\adsViewKickPitchMin\\ - min cam kick ADS", ::doNothing);
    self AddOption("WD Spread Fields", "\\adsViewKickPitchMax\\ - max cam kick ADS", ::doNothing);
    self AddOption("WD Spread Fields", "\\adsViewKickCenterSpeed\\ - ADS re-center speed", ::doNothing);
    self AddOption("WD Spread Fields", "TIP: set Min and Max to 0 for no recoil", ::doNothing);

    self CreateMenu("WD ADS Fields", "Weap Defs");
    self AddOption("WD ADS Fields", "\\adsZoomFov\\ - ADS field of view (lower=more zoom)", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsTransInTime\\ - time to ADS in (seconds)", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsTransOutTime\\ - time to ADS out (seconds)", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsZoomInFrac\\ - fraction into raise when zoom starts", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsZoomOutFrac\\ - fraction into lower when zoom ends", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsBobFactor\\ - weapon bob while ADS", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsViewBobMult\\ - view bob multiplier ADS", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsIdleAmount\\ - idle sway amount ADS", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsIdleSpeed\\ - idle sway speed ADS", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsOverlayShader\\ - scope overlay image name", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsOverlayWidth\\ - overlay image width", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsOverlayHeight\\ - overlay image height", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsCrosshairInFrac\\ - crosshair fade-in fraction", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsCrosshairOutFrac\\ - crosshair fade-out fraction", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsReloadTransTime\\ - reload while ADS transition", ::doNothing);
    self AddOption("WD ADS Fields", "\\adsFire\\ - 0=no ADS fire  1=can fire ADS", ::doNothing);
    self AddOption("WD ADS Fields", "\\aimDownSight\\ - 0=no ADS  1=has ADS", ::doNothing);
    self AddOption("WD ADS Fields", "\\autoAimRange\\ - auto aim assist range", ::doNothing);
    self AddOption("WD ADS Fields", "\\aimAssistRange\\ - aim assist active range", ::doNothing);
    self AddOption("WD ADS Fields", "\\aimAssistRangeAds\\ - aim assist range while ADS", ::doNothing);

    self CreateMenu("WD Sway Fields", "Weap Defs");
    self AddOption("WD Sway Fields", "\\swayMaxAngle\\ - max weapon sway angle", ::doNothing);
    self AddOption("WD Sway Fields", "\\swayLerpSpeed\\ - sway interpolation speed", ::doNothing);
    self AddOption("WD Sway Fields", "\\swayPitchScale\\ - vertical sway scale", ::doNothing);
    self AddOption("WD Sway Fields", "\\swayYawScale\\ - horizontal sway scale", ::doNothing);
    self AddOption("WD Sway Fields", "\\swayHorizScale\\ - move-based horizontal sway", ::doNothing);
    self AddOption("WD Sway Fields", "\\swayVertScale\\ - move-based vertical sway", ::doNothing);
    self AddOption("WD Sway Fields", "\\adsSwayMaxAngle\\ - max sway while ADS", ::doNothing);
    self AddOption("WD Sway Fields", "\\adsSwayLerpSpeed\\ - ADS sway interpolation", ::doNothing);
    self AddOption("WD Sway Fields", "\\adsSwayPitchScale\\ - vertical ADS sway", ::doNothing);
    self AddOption("WD Sway Fields", "\\adsSwayYawScale\\ - horizontal ADS sway", ::doNothing);
    self AddOption("WD Sway Fields", "\\gunMaxPitch\\ - max viewmodel pitch offset", ::doNothing);
    self AddOption("WD Sway Fields", "\\gunMaxYaw\\ - max viewmodel yaw offset", ::doNothing);
    self AddOption("WD Sway Fields", "\\standMoveF\\ - model offset fwd when moving", ::doNothing);
    self AddOption("WD Sway Fields", "\\standMoveR\\ - model offset right when moving", ::doNothing);
    self AddOption("WD Sway Fields", "\\standMoveU\\ - model offset up when moving", ::doNothing);
    self AddOption("WD Sway Fields", "\\standRotP\\ - pitch rotation when moving", ::doNothing);
    self AddOption("WD Sway Fields", "\\standRotY\\ - yaw rotation when moving", ::doNothing);
    self AddOption("WD Sway Fields", "\\standRotR\\ - roll rotation when moving", ::doNothing);
    self AddOption("WD Sway Fields", "\\strafeMoveR\\ - strafe right offset", ::doNothing);
    self AddOption("WD Sway Fields", "\\strafeRotR\\ - strafe roll rotation", ::doNothing);
    self AddOption("WD Sway Fields", "\\idleCrouchFactor\\ - idle sway scale crouched", ::doNothing);
    self AddOption("WD Sway Fields", "\\idleProneFactor\\ - idle sway scale prone", ::doNothing);
    self AddOption("WD Sway Fields", "TIP: set sway values to 0 for no weapon sway", ::doNothing);
}