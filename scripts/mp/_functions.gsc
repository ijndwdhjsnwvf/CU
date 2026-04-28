#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\perks\_perkfunctions;

#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\menu\_menulogic;
#include scripts\mp\menu\_structure;


functions_calls()
{
    setdvarifuninitialized("dvartog1", 0);
    setdvarifuninitialized("dvartog2", 0);
    setdvarifuninitialized("dvartog", "None");
    setdvarifuninitialized("dvar2tog1", 0);
    setdvarifuninitialized("dvar2tog2", 0);
    setdvarifuninitialized("dvar2tog", "None");
    setdvarifuninitialized("scr_oma_usetime", "3");


    setdvarifuni("def_sprintintime", 0.3);
    setdvarifuni("ebotweapon", "cheytac_mp");
    setdvarifuni("fbotweapon", "cheytac_mp");
    setdvarifuni("bot_player", "default");
    setdvarifuni("cg_cratetime", 500);

    self setPersIfUni("classchangeadelia", "Off");
    self setPersIfUni("classinfsprint", "Off");
    self setPersIfUni("classmelee", "Off");
    self setPersIfUni("classlunge", "Off");
    self setPersIfUni("classdrop", "Off");
    self setPersIfUni("classcanswap", "Off");
    self setPersIfUni("bullets", "On");
    self setPersIfUni("maxammo", "Off");
    self setPersIfUni("goodnade", "Off");
    self setPersIfUni("grabInfos", "None");
    
    self setPersIfUni("killcamtimer", "On");
    setdvarifuni("crate_type", "counter_uav");
    self setPersIfUni("god", "Off");
    self setPersIfUni("crouch", "Off");
    self setPersIfUni("omanac", "Off");
    self setPersIfUni("omasprint", "Off");
    self setPersIfUni("omasprintsecond", "Off");
    self setPersIfUni("doubleoma", "Off");
    self setPersIfUni("alwayscanswap", "Off");
    self setPersIfUni("menucanswapCurrent", "Off");
    self setPersIfUni("canswapmode", "Off");
    self setPersIfUni("canswapregistered", "none");
    self setPersIfUni("instashootmode", "Off");
    self setPersIfUni("instashootregistered", "none");
    self setPersIfUni("activecamo", "arctic");
    self setPersIfUni("change_map", "mp_afghan");
    self setPersIfUni("deathbarriers", "Off");
    self setPersIfUni("greenscreen", "Off");
    self setPersIfUni("bluescreen", "Off");
    self setPersIfUni("redscreen", "Off");
    self setPersIfUni("blackscreen", "Off");
    self setPersIfUni("knifelunges", "Off");
    self setPersIfUni("elevators", "Off");
    self setPersIfUni("bounces", "Off");
    self setPersIfUni("instaswaps", "Off");
    self setPersIfUni("instashoots", "Off");
    self setPersIfUni("function_infammo", "Off");
    self setPersIfUni("cp_location", (0,0,0));
    self setPersIfUni("cponpos", "Off");
    self setPersIfUni("timerthing", "Off");
    self setPersIfUni("noclip", "On");
    self setPersIfUni("unlimitedeq", "Off");
    self setPersIfUni("fixADS", "Off");

    setdvarifuni("instashoots_weapon", "All Weapons");
    setdvarifuni("player_health", 100);
    setdvarifuni("roundswon", 1);
    setdvarifuni("roundslost", 0);
    setdvarifuni("killcam_softland","Off");
    setdvarifuni("function_precamsoft","Off");
    setdvarifuni("function_killcamlag","Off");
    setdvarifuni("velx", 0);
    setdvarifuni("velz", 0);
    setdvarifuni("vely", 0);
    setdvarifuni("scr_killcam_time", 4);
    setdvarifuni("function_savepoint", 1);
    setdvarifuni("function_spawnsavepoint", 1);
    setdvarifuni("function_loadonspawn",1);
    setdvarifuni("nacmod1","none");
    setdvarifuni("nacmod2","none");
    setdvarifuni("cpposx",0);
    setdvarifuni("cpposy",0);
    setdvarifuni("cpposy",0);
    setdvarifuni("ebotvelx", 0);
    setdvarifuni("ebotvelz", 0);
    setdvarifuni("ebotvely", 0);
    setdvarifuni("fbotvelx", 0);
    setdvarifuni("fbotvelz", 0);
    setdvarifuni("fbotvely", 0);
    setdvarifuni("primary_weapon","none");
    setdvarifuni("primary_clip","none");
    setdvarifuni("primary_stock","none");
    setdvarifuni("secondary_weapon","none");
    setdvarifuni("secondary_clip","none");
    setdvarifuni("secondary_stock","none");
    setdvarifuni("drop_weapon_name","none");
    setdvarifuni("drop_weapon_clip","none");
    setdvarifuni("drop_weapon_stock","none");
    setdvarifuni("function_carepackphysic",1);
    setdvarifuni("function_deathbarriersoff", 0);
    setdvarifuni("killbot_weapon","none");
    setdvarifuni("swap_weapon","none");
    

    self.maxhealth = getDvarInt("player_health");

    if (!isDefined(self getPers("activecamo")))
        self setPers("activecamo", "none");
    self thread applySpawnCamo();
    
     if(self getPers("killcamtimer") == "Off")
        self.kc_timer.alpha = 0;

     if(self getPers("function_infammo") == "On")
    self thread infiniteammo();

     if(self getPers("instaswaps") == "On")
    self thread monitorInstaswap();

     if(self getPers("instashoots") == "On")
    self thread instashoots();
    
     if(self getPers("elevators") == "On")
    setDvar("bg_elevators", 1);

     if(self getPers("bounces") == "On")
    setDvar("bg_bounces", 1);

     if(self getPers("knifelunges") == "On")
    setDvar("perk_extendedmeleerange", 9999);

     if(self getPers("alwayscanswap") == "On")
    self thread alwayscanswapmonitor();

    self thread loadposspawn();
    self thread loadLocationBot();
    self thread sndroundreset();
    self thread drop_weapon();
    self thread dobarrier();
    self thread timercheck();
    self thread bolt_calls();
    self thread noclipbind();
    self thread bots_title_emble();

    thread monitorbot();
    

}

dvartog(w)
{
    setDvar("dvartog", w);
}

/* miscel */


radiusdmglocation()
{
    setDvar("dmgx",self.origin[0]);
    setDvar("dmgz",self.origin[1]);
    setDvar("dmgy",self.origin[2]);
    self iPrintLn("Radius Damage Location ^2:"+ self.origin);
}

swap_weapon()
{
    if(getDvar("swap_weapon") == "none")
    setDvar("swap_weapon",self getCurrentWeapon());
    else
    setDvar("swap_weapon", "none");
}

killbot_weapon()
{
    if(getDvar("killbot_weapon") == "none")
    setDvar("killbot_weapon",self getCurrentWeapon());
    else
    setDvar("killbot_weapon", "none");
}

setammo()
{
    setDvar("primary_weapon", self getCurrentWeapon());
    setDvar("primary_clip", self getWeaponAmmoClip(getDvar("primary_weapon")));
    setDvar("primary_stock", self getWeaponAmmoStock(getDvar("primary_weapon")));
    setDvar("secondary_weapon", self getNextWeapon());
    setDvar("secondary_clip", self getWeaponAmmoClip(getDvar("secondary_weapon")));
    setDvar("secondary_stock", self getWeaponAmmoStock(getDvar("secondary_weapon")));
}
setsavedammo()
{
    self setWeaponAmmoClip(getDvar("primary_weapon"),getDvarInt("primary_clip"));
    self setWeaponAmmoStock(getDvar("primary_weapon"),getDvarInt("primary_stock"));
    self setWeaponAmmoClip(getDvar("secondary_weapon"),getDvarInt("secondary_clip"));
    self setWeaponAmmoStock(getDvar("secondary_weapon"),getDvarInt("secondary_stock"));
}

changeMap(map)
{
    map(map);
}

PrecamSoftTog()
{
    if(getDvar("function_precamsoft") == "Off")
    {
        setDvar("function_precamsoft", "On");
        setDvar( "bg_falldamagemaxheight", "1" );
		setDvar( "bg_falldamageminheight", "1" );
		setDvar( "snd_enable3d", "0" );

    }
    else
    {
        setDvar("function_precamsoft", "Off");
        setDvar("bg_fallDamageMaxHeight", 300);
        setDvar("bg_fallDamageMinHeight", 128);
        setDvar( "snd_enable3d", "1" );
    }
}

KillcamSoftTog()
{
    if(getDvar("killcam_softland") == "Off")
    {
        setDvar("killcam_softland", "On");
    }
    else
    {
        setDvar("killcam_softland", "Off");
    }
}

KillcamLagTog()
{
    if(getDvar("function_killcamlag") == "Off")
    {
        setDvar("function_killcamlag", "On");
    }
    else
    {
        setDvar("function_killcamlag", "Off");
    }
}

killcamTimer()
{
    if(self getPers("killcamtimer") == "Off")
        self setPers("killcamtimer", "On");
    else 
        self setPers("killcamtimer", "Off");
}

nacmod1()
{
    if(getDvar("nacmod1") == "none")
    setDvar("nacmod1",self getCurrentWeapon());
    else
    setDvar("nacmod1", "none");
}

nacmod2()
{
    if(getDvar("nacmod2") == "none")
    setDvar("nacmod2",self getCurrentWeapon());
    else
    setDvar("nacmod2", "none");
}

resetvel()
{
    setdvar("velx",0);
    setdvar("vely",0);
    setdvar("velz",0);
}

resetvel2()
{
    setdvar("velx2",0);
    setdvar("vely2",0);
    setdvar("velz2",0);
}

savepos()
{
    x = getDvarInt("function_savepoint");
    setDvar("function_savex" + x,self.origin[0]);
    setDvar("function_savez" + x,self.origin[1]);
    setDvar("function_savey" + x,self.origin[2]);
    setDvar("function_savea" + x,self.angles[1]);
    setDvar("function_savemap" + x,getDvar("mapname"));
    self iPrintLnBold("Location Saved");
}

loadpos()
{
    x = getDvarInt("function_savepoint");
    if(getDvar("function_savemap" + x) == getDvar("mapname"))
    if(getDvar("function_savex"+ x) != "")
    {
        self setOrigin((getDvarFloat("function_savex"+ x),getDvarFloat("function_savez"+ x),getDvarFloat("function_savey"+ x)));
        self setPlayerAngles((0,getDvarFloat("function_savea"+ x),0));
    }

}

loadposspawn()
{
    self endon("disconnect");
    self endon("death");
    if(self isHost())
    {
        x = getDvarInt("function_savepoint");
        if(getDvar("function_savemap" + x) == getDvar("mapname") && getDvar("function_savex" + x) != "")
        {
            wait 0.1;
            self loadpos();
        }
    }
}

suicideTU6()
{
    self suicide();
}


illusionfun()
{

my_weapon = self getCurrentWeapon();
self setSpawnWeapon(my_weapon);

}

getnextweapon()
{
   z = self getWeaponsListPrimaries();
   x = self getCurrentWeapon();
   for(i = 0 ; i < z.size ; i++)
   {
      if(x == z[i])
      {
         if(isDefined(z[i + 1]))
            return z[i + 1];
         else
            return z[0];
      }
   }
}


hitmarker()
{
    self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
    self playlocalsound("MP_hit_alert");
}

bullets()
{
    if(self getPers("bullets") == "Off")
    {
        self setPers("bullets", "On");
        setDvar("fx_marks", 1);
    }
    else
    {
        self setPers("bullets", "Off");
        setDvar("fx_marks", 0);
    }
}


playerhealth()
{
    x = getDvarInt("player_health");
    if(x == 100)
    {
        setDvar("player_health",250);
        self.maxhealth = 250;
    }
    else if(x == 250)
    {
        setDvar("player_health",500);
        self.maxhealth = 500;
    }
    else if(x == 500)
    {
        setDvar("player_health",750);
        self.maxhealth = 750;
    }
    else if(x == 750)
    {
        setDvar("player_health",9999);
        self.maxhealth = 9999;
    }
    else if(x == 9999)
    {
        setDvar("player_health",100);
        self.maxhealth = 100;
    }
}

knifelunges()
{
    if(self getPers("knifelunges") == "Off")
    {
        self setPers("knifelunges", "On");
        setDvar("perk_extendedmeleerange", 9999);
    }
    else{ 
        self setPers("knifelunges", "Off");
        setDvar("perk_extendedmeleerange", 128);
}
}

depatch_elev()
{
    if(self getPers("elevators") == "Off")
    {
        self setPers("elevators", "On");
        setDvar("bg_elevators", 1);
    }
    else{ 
        self setPers("elevators", "Off");
        setDvar("bg_elevators", 0);
}
}


depatch()
{
    if(self getPers("bounces") == "Off")
    {
        self setPers("bounces", "On");
        setDvar("bg_bounces", 1);
    }
    else{ 
        self setPers("bounces", "Off");
        setDvar("bg_bounces", 0);
}
}

kickPlayer(player)
{
    kick(player GetEntityNumber());
}

teleportplayer(player)
{
    player setOrigin(gettrace());
}

giveUnlocks(player)
{
    player setPlayerData("experience", 2516000);
    player endon( "disconnect" ) ;
    player endon( "death" ) ; 
    player setPlayerData( "iconUnlocked", "cardicon_prestige10_02", 1) ;
    chalProgress = 0;
    useBar = createPrimaryProgressBar( 25 );
    useBarText = createPrimaryProgressBarText( 25 );
    foreach ( challengeRef, challengeData in level.challengeInfo )
    {
        finalTarget = 0;
        finalTier = 0;
        for ( tierId = 1; isDefined( challengeData["targetval"][tierId] ); tierId++ )
        {
            finalTarget = challengeData["targetval"][tierId];
            finalTier = tierId + 1;
        }
        if ( player isItemUnlocked( challengeRef ) )
        {
            player setPlayerData( "challengeProgress", challengeRef, finalTarget );
            player setPlayerData( "challengeState", challengeRef, finalTier );
        }
            chalProgress++;
            chalPercent = ceil( ((chalProgress/480)*100) );
            useBarText setText( chalPercent + " percent done" );
            useBar updateBar( chalPercent / 100 );
            wait ( 0.04 );
    }
    useBar destroyElem();
    useBarText destroyElem();
}

sndroundreset(){ 

    x = getDvarInt("roundswon");
    y = getDvarInt("roundslost");
	wait 1.1;
    self thread precamsoftcheck();
	level.resetscores = true;
	allies = 0;
	game["roundsWon"]["axis"] = y;
	game["roundsWon"]["allies"] = x;
	game["roundsPlayed"] = (x+y);
	game["teamScores"]["allies"] = y;
	game["teamScores"]["axis"] = x;	
	maps\mp\gametypes\_gamescore::updateTeamScore( "axis" );
	maps\mp\gametypes\_gamescore::updateTeamScore( "allies" );
	setDvar("sv_padpackets", 0);
    wait 1;
    level waittill("round_end_finished");
    x = getDvar("function_killcamlag");
    if (x == "On")
    {
	    setDvar("sv_padpackets", 6000);
    }
    else if (x == "Off")
    {
        setDvar("sv_padpackets", 0);
    }
    y = getDvar("killcam_softland");
    if (y == "On")
    {
        wait .1;
	    setDvar( "bg_falldamagemaxheight", "1" );
		setDvar( "bg_falldamageminheight", "1" );
    }
    else 
    {
	    setDvar( "bg_falldamagemaxheight", "300" );
		setDvar( "bg_falldamageminheight", "128" );
    }

}

precamsoftcheck()
{
    x = getDvar("function_precamsoft");
    wait .1;
    if(x == "On")
    {
        setDvar( "bg_falldamagemaxheight", "1" );
		setDvar( "bg_falldamageminheight", "1" );
		setDvar( "snd_enable3d", "0" );
    }
     if(x == "Off")
    {
        setDvar("bg_fallDamageMaxHeight", 300);
        setDvar("bg_fallDamageMinHeight", 128);
        setDvar( "snd_enable3d", "1" );
    }

}

sndroundreset2(){ 

    x = getDvarInt("roundswon");
    y = getDvarInt("roundslost");
	wait .1;
	level.resetscores = true;
	allies = 0;
	game["roundsWon"]["axis"] = y;
	game["roundsWon"]["allies"] = x;
	game["roundsPlayed"] = (x+y);
	game["teamScores"]["allies"] = y;
	game["teamScores"]["axis"] = x;	
	maps\mp\gametypes\_gamescore::updateTeamScore( "axis" );
	maps\mp\gametypes\_gamescore::updateTeamScore( "allies" );
    self iPrintLnBold("Rounds will reset after every rounds to the correct score");
}

onclasschange()
{
    if(self getPers("classchangeadelia") == "On" && isDefined(self getPers("classchangeadelia")))
	{
		waitframe();
        self setWeaponAnim(24);
        waitframe();
        self setWeaponAnim(1);
    }
    else if(self getPers("classinfsprint") == "On" && isDefined(self getPers("classinfsprint")))
	self setWeaponAnim(24, 2);
    else if(self getPers("classmelee") == "On" && isDefined(self getPers("classmelee")))
	self setWeaponAnim(8, 2);
    else if(self getPers("classlunge") == "On" && isDefined(self getPers("classlunge")))
	self setWeaponAnim(9, 2);
    else if(self getPers("classdrop") == "On" && isDefined(self getPers("classdrop")))
	self setWeaponAnim(10, 2);
    else if(self getPers("classcanswap") == "On" && isDefined(self getPers("classcanswap")))
	self setWeaponAnim(12, 2);
    if(self getPers("maxammo") == "On" && isDefined(self getPers("maxammo")))
	self thread maxammo();
}

classcanswap()
{
    if(self getPers("classcanswap") == "Off")
        self setPers("classcanswap", "On");
    else 
        self setPers("classcanswap", "Off");
}

classdrop()
{
    if(self getPers("classdrop") == "Off")
        self setPers("classdrop", "On");
    else 
        self setPers("classdrop", "Off");
}

classlunge()
{
    if(self getPers("classlunge") == "Off")
        self setPers("classlunge", "On");
    else 
        self setPers("classlunge", "Off");
}

classmelee()
{
    if(self getPers("classmelee") == "Off")
        self setPers("classmelee", "On");
    else 
        self setPers("classmelee", "Off");
}

classinfsprint()
{
    if(self getPers("classinfsprint") == "Off")
        self setPers("classinfsprint", "On");
    else 
        self setPers("classinfsprint", "Off");
}

classChangeAdelia()
{
    if(self getPers("classchangeadelia") == "Off")
        self setPers("classchangeadelia", "On");
    else 
        self setPers("classchangeadelia", "Off");
}

set_infiniteammo()
{
    if(self getPers("function_infammo") == "Off")
    {
        self setPers("function_infammo", "On");
    }
    else if(self getPers("function_infammo") == "On")
    {
        self setPers("function_infammo", "Off");
    }
    if(self.pers["function_infammo"] != false)
        self thread infiniteammo();
}

infiniteammo()
{
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    
    self endon("end_infiniteammo");

    for(;;)
    {
        self maps\mp\perks\_perks::givePerk(maps\mp\gametypes\_class::cac_getPerk(self.class_num, 0));
        waitframe();
        self waittill_any("reload", "grenade_fire");
    }
}

maxammotog()
{
        if(self getPers("maxammo") == "Off")
        self setPers("maxammo", "On");
    else 
        self setPers("maxammo", "Off");
}

maxammo()
{
    nextweapon = self getNextWeapon(); 
    currentWeapon = self getCurrentWeapon();
	if ( currentWeapon != "none" )
	{
		self GiveMaxAmmo( currentWeapon );
        self GiveMaxAmmo( nextweapon ); 
	}

}

giveStreak(s)
{
    self maps\mp\killstreaks\_killstreaks::giveKillstreak(s);
}

removeKS()
{
	self maps\mp\killstreaks\_killstreaks::giveKillstreak( "none", true);
	wait 1;
	foreach ( index, streakStruct in self.pers["killstreaks"] )
		self.pers["killstreaks"][index] = undefined;
}

delete_carepack()
{
        level.airDropCrates = getEntArray( "care_package", "targetname" );
        level.oldAirDropCrates = getEntArray( "airdrop_crate", "targetname" );
        
        if ( level.airDropCrates.size )
        {
            foreach ( crate in level.AirDropCrates )
            {
                _objective_delete( crate.objIdFriendly );
                _objective_delete( crate.objIdEnemy );
                crate delete();
            }
        }
}

spawncarepackagecross()
{
    carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self gettrace(), "airdrop", self gettrace(), true, undefined, self gettrace());
    self notify("drop_crate");
}


spawncarepackageself()
{
    carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.origin + (0,0,-20), "airdrop", self.origin + (0,0,-20), true, undefined, self.origin + (0,0,-20));
    self notify("drop_crate");
}

setcppos()
{
    setDvar("cpposx",self.origin[0]);
    setDvar("cpposy",self.origin[1]);
    setDvar("cpposz",self.origin[2]);
    self iPrintLn("Carepackage Position ^:"+ self.origin);
}

cponpos()
{
    if(self getPers("cponpos") == "Off")
    {
        self setPers("cponpos", "On");
        carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.pers["cp_location"] + (0,0,40), "airdrop", self.pers["cp_location"] + (0,0,40), true, undefined, self.pers["cp_location"] + (0,0,40));
        self notify("drop_crate");
        self iPrintLnBold("CP will respawn when you load location");
    }
    else
    {
        self setPers("cponpos", "Off");
        self thread delete_carepack();
    }
}


cp_location()
{
    self.pers["cp_location"] = self getOrigin();
    self iPrintLnBold("CP Location Saved: ^2" + self.origin);
}

timercheck()
{
    if(self getPers("timerthing") == "On")
    {
    setDvar("scr_sd_timelimit", 2.5);
    }
    else{
        setDvar("scr_sd_timelimit", "");
    }
    if(self getPers("cponpos") == "On")
    {
        carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.pers["cp_location"] + (0,0,40), "airdrop", self.pers["cp_location"] + (0,0,40), true, undefined, self.pers["cp_location"] + (0,0,40));
        self notify("drop_crate");
    }
}

timerToggle()
{
    if(self getPers("timerthing") == "Off")
    {
        self setPers("timerthing", "On");
        setDvar("scr_sd_timelimit", 2.5);
    }
    else
    {
        self setPers("timerthing", "Off");
        setDvar("scr_sd_timelimit", "");
    }
}

change_cratedvar(w)
{
    setDvar("crate_type", w);
}


gettrace()
{
    x = bullettrace(self gettagorigin("j_head"), self gettagorigin("j_head") + anglesToForward(self getplayerangles()) * 1000000, 0, self)["position"];
    return x;
}

camo_editor_primary(camo)
{

    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    self setPlayerData( "customClasses", class_num, "weaponSetups", 0, "camo", camo );
    self setPers("activecamo", camo);
    self reset_class();
    self scripts\mp\menu\_menuutils::loadMenu("Game Profile");
    
}

camo_editor_secondary(camo)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    self setPlayerData( "customClasses", class_num, "weaponSetups", 1, "camo", camo);
    self setPers("activecamo", camo);
    self reset_class();
    self scripts\mp\menu\_menuutils::loadMenu("Game Profile");
    
}

equipment_editor(equipment_name, weapon, slot)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    self setPlayerData("customClasses", class_num, "perks", 0, equipment_name);
    self reset_class();
    self scripts\mp\menu\_menuutils::loadMenu("Game Profile");
}

special_grenade_editor(equipment_name)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    self setPlayerData("customClasses", class_num, "specialGrenade", equipment_name);
    self reset_class();
    self scripts\mp\menu\_menuutils::loadMenu("Game Profile");
}

perk_editor(slot, perk_name)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    self setPlayerData("customClasses", class_num, "perks", slot, perk_name);
    self reset_class();
    self scripts\mp\menu\_menuutils::loadMenu("Game Profile");
}


reset_class()
{
    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"], self.pers["class"]);
  
}

attachment_editor_two(attachment, slot)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    switch(slot)
    {
        case 0:
            self setPlayerData("customClasses", class_num, "weaponSetups", 0, "attachment", 1, attachment);
            break;
        case 1:
            self setPlayerData("customClasses", class_num, "weaponSetups", 1, "attachment", 1, attachment);
            break;
        default:
            self iPrintlnBold("^1Class Editor Error");
            break;
        
    }
    self reset_class();
    self scripts\mp\menu\_menuutils::loadMenu("Game Profile");
}

weapon_editor(weapon, slot)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    switch(slot)
    {
        case 0:
            self setPlayerData("customClasses", class_num, "weaponSetups", 0, "weapon", weapon);
            self scripts\mp\menu\_menuutils::loadMenu("attachment_primary_one");
            break;
        case 1:
            self setPlayerData("customClasses", class_num, "weaponSetups", 1, "weapon", weapon);
            self scripts\mp\menu\_menuutils::loadMenu("attachment_secondary_one");
            break;
        default:
            self iPrintlnBold("^1Class Editor Error");
            break;
    }
    
}

attachment_editor_one(attachment, slot)
{
    class_num = self thread maps\mp\gametypes\_class::getClassIndex(self.pers["class"]);
    switch(slot)
    {
        case 0:
            self setPlayerData("customClasses", class_num, "weaponSetups", 0, "attachment", 0, attachment);
            self scripts\mp\menu\_menuutils::loadMenu("attachment_primary_two");
            break;
        case 1:
            self setPlayerData("customClasses", class_num, "weaponSetups", 1, "attachment", 0, attachment);
            self scripts\mp\menu\_menuutils::loadMenu("attachment_secondary_two");
            break;
        default:
            self iPrintlnBold("^1Class Editor Error");
            break;
    }
}

doubleOma()
{
    if(self getPers("doubleoma") == "Off")
        self setPers("doubleoma", "On");
    else 
        self setPers("doubleoma", "Off");
}

omaSprintSecond()
{
    if(self getPers("omasprintsecond") == "Off")
        self setPers("omasprintsecond", "On");
    else 
        self setPers("omasprintsecond", "Off");
}

omanac()
{
    if(self getPers("omanac") == "Off")
        self setPers("omanac", "On");
    else 
        self setPers("omanac", "Off");
}

omaSprint()
{
    if(self getPers("omasprint") == "Off")
        self setPers("omasprint", "On");
    else 
        self setPers("omasprint", "Off");
}


dropCanswap()
{
    w = self getCurrentWeapon();
    wait 0.05;
    self giveWeapon("usp_mp");
    self setSpawnWeapon("usp_mp");
    wait 0.05;
    self dropItem(self getCurrentWeapon());
    self setSpawnWeapon(w);
}

dropdagun()
{
	CurrentGun = self getCurrentWeapon();
	self dropItem(CurrentGun);
}

dropanddelete()
{
    self thread drop_weapon();
    self thread delete_dropped_weapon();
}

drop_weapon()
{
    level.weapon delete();
    level.weapon.placeholder delete();
    weapon = getDvar("drop_weapon_name");
    level.weapon.angles = (0, 0, 90);
    level.weapon.weapon = weapon;
    if(isSubStr(weapon, "akimbo"))
    {
        level.weapon = spawn("weapon_" + weapon, self.pers["drop_weapon_location"]);
		game["dropped_akimbo"] = true;
    }
    else
	{
        level.weapon = spawn("weapon_" + weapon, self.pers["drop_weapon_location"]);
		game["dropped_akimbo"] = true;
    }
    //level.weapon itemWeaponSetAmmo(999, 999);
    level.weapon.placeholder = spawn("script_origin", self getOrigin() + (0,0,20));
    level.weapon.placeholder enableLinkTo();
    level.weapon linkTo(level.weapon.placeholder);
	self monitor_pickup(); /* This Cannot Be Looped */
    return weapon;
}
 
delete_dropped_weapon()
{
    ents = getEntArray();
    for(i = 0; i < ents.size; i++)
        if(isSubStr(ents[i].classname, "weapon") && !isSubStr(ents[i].classname, getDvar("drop_weapon_name")))
            ents[i] delete();
    return;
}
 
drop_weapon_name()
{
    if(getDvar("drop_weapon_name") == "none"){
        weapon = self getCurrentWeapon();
    	setDvar("drop_weapon_name", self getCurrentWeapon());
        setDvar("drop_weapon_clip", self getWeaponAmmoClip(weapon));
        setDvar("drop_weapon_stock", self getWeaponAmmoStock(weapon));
    }

    else{
   		setDvar("drop_weapon_name", "none");
        setDvar("drop_weapon_clip", "none");
        setDvar("drop_weapon_stock", "none");
    }
}

drop_weapon_location()
{
    self.pers["drop_weapon_location"] = self getOrigin() + (0, 0, 20);
    setDvar("weapx",self.origin[0]);
    setDvar("weapy",self.origin[1]);
    setDvar("weapz",self.origin[2]);
    self iPrintLnBold("Drop Location Saved: ^2" + self.origin);
}

monitor_pickup()
{
	ents = getEntArray();
	for(i = 0; i < ents.size; i++)
		if(isSubStr(ents[i].classname, "weapon") && isSubStr(ents[i].classname, getDvar("drop_weapon_name")))
			thread trackPickup( ents[i], i );
}

trackPickup( pickup, id )
{
	groundpoint = getPickupGroundpoint( pickup );
	clip = getDvarInt("drop_weapon_clip");
    stock = getDvarInt("drop_weapon_stock");
	classname = pickup.classname;
	isWeapon = false;

	if ( issubstr( classname, "weapon_" ) )
	{
		isWeapon = true;
		weapname = pickup maps\mp\gametypes\_weapons::getItemWeaponName();
	}
	
	while(true)
	{
		player = undefined;
		
		if ( isWeapon )
		{	
			while(true)
			{
				pickup waittill( "trigger", player, dropped );
				
				if ( !isdefined( pickup ) )
					break;
				
				assert( !isdefined( dropped ) );
			}

			if ( isdefined( dropped ) )
			{
				if(game["dropped_akimbo"])
				{
					waittillframeend;
                    self takeWeapon(getDvar("drop_weapon_name"));
					self giveWeapon(getDvar("drop_weapon_name"), 0, true);
                    self setWeaponAmmoClip(getDvar("drop_weapon_name"),clip);
                    self setWeaponAmmoStock(getDvar("drop_weapon_name"),stock);
					self switchToWeapon(getDvar("drop_weapon_name"));
				}
			}
		}
	}
}

getPickupGroundpoint( pickup )
{
	trace = bullettrace( pickup.origin, pickup.origin + (0,0,-128), false, pickup );
	groundpoint = trace["position"];
	
	finalz = groundpoint[2];
	
	for ( radiusCounter = 1; radiusCounter <= 3; radiusCounter++ )
	{
		radius = radiusCounter / 3.0 * 50;
		
		for ( angleCounter = 0; angleCounter < 10; angleCounter++ )
		{
			angle = angleCounter / 10.0 * 360.0;
			
			pos = pickup.origin + (cos(angle), sin(angle), 0) * radius;
			
			trace = bullettrace( pos, pos + (0,0,-128), false, pickup );
			hitpos = trace["position"];
			
			if ( hitpos[2] > finalz && hitpos[2] < groundpoint[2] + 15 )
				finalz = hitpos[2];
		}
	}
	return (groundpoint[0], groundpoint[1], finalz);
}

greenScreen()
{
    if(self getPers("greenscreen") == "Off")
    {
        self setPers("greenscreen", "On");
        self.blueBG = self createRectangle("white", "CENTER", "CENTER", 0, -180, 2000, 4000, (0, 240, 0), -1, 1 );
        self.blueBG.foreground = false;
    }
    else 
    {
        self setPers("greenscreen", "Off");
        self.blueBG Destroy();
    }
}

blueScreen()
{
    if(self getPers("bluescreen") == "Off")
    {
        self setPers("bluescreen", "On");
        self.blueBG = self createRectangle("white", "CENTER", "CENTER", 0, -180, 2000, 4000, (0, 0, 240), -1, 1 );
        self.blueBG.foreground = false;
    }
    else 
    {
        self setPers("bluescreen", "Off");
        self.blueBG Destroy();
    }
}

redScreen()
{
    if(self getPers("redscreen") == "Off")
    {
        self setPers("redscreen", "On");
        self.blueBG = self createRectangle("white", "CENTER", "CENTER", 0, -180, 2000, 4000, (240, 0, 0), -1, 1 );
        self.blueBG.foreground = false;
    }
    else 
    {
        self setPers("redscreen", "Off");
        self.blueBG Destroy();
    }
}

blackScreen()
{
    if(self getPers("blackscreen") == "Off")
    {
        self setPers("blackscreen", "On");
        self.blueBG = self createRectangle("white", "CENTER", "CENTER", 0, -180, 2000, 4000, (0, 0, 0), -1, 1 );
        self.blueBG.foreground = false;
    }
    else 
    {
        self setPers("blackscreen", "Off");
        self.blueBG Destroy();
    }
}

customLocation(loc)
{
    self setOrigin(loc);
    self thread savepos();
}


giveWeap(w)
{
    self giveWeapon(w + "_mp");
    self switchToWeapon(w + "_mp");
}

refillAmmo()
{
   self giveMaxAmmo(self getCurrentWeapon()); 
}

giveAkimbo()
{
    w = self getCurrentWeapon();
    self takeWeapon(w);
    self giveWeapon(w, 0, true);
    self switchToWeapon(w);
}


godmode()
{
    if(self getPers("god") == "Off")
    {
        self setPers("god", "On");
        exec("god");
    }
    else 
    {
        self setPers("god", "Off");
        exec("god");
    }
}

instaswaps()
{
    if (self getPers("instaswaps") == "Off")
    {
        if (self getPers("instashoots") == "On")
        {
            self iPrintlnBold("[^1Instashoots must be disabled to use Instaswaps^7]");
            return;
        }
        self setPers("instaswaps", "On");
        self thread monitorInstaswap();
    }
    else 
    {
        self setPers("instaswaps", "Off");
        self notify("endInstaswap");
    }
}


monitorInstaswap()
{
    self endon("endInstaswap");
    self endon("death");
    self endon("disconnect");
    for(;;)
    {
        self waittill("grenade_pullback", grenadeName);
        primaryWeapon = self.primaryWeapon;
        secondaryWeapon = self.secondaryWeapon;
        if(self getCurrentWeapon() == primaryWeapon)
        {
            self.primaryClip = self getWeaponAmmoClip(primaryWeapon);
            self.primaryStock = self getWeaponAmmoStock(primaryWeapon);

            if(isSubStr(primaryWeapon, "akimbo"))
                isAkimbo = true;
            else
                isAkimbo = false;

            self takeWeapon(primaryWeapon);
            self switchToWeapon(secondaryWeapon);
            wait 0.05;
            self giveWeapon(primaryWeapon, 0, isAkimbo);
            self setWeaponAmmoClip(primaryWeapon, self.primaryClip);
            self setWeaponAmmoStock(primaryWeapon, self.primaryStock);
        }
        else
        {
            self.secondaryClip = self getWeaponAmmoClip(secondaryWeapon);
            self.secondaryStock = self getWeaponAmmoStock(secondaryWeapon);

            if(isSubStr(secondaryWeapon, "akimbo"))
                isAkimbo = true;
            else
                isAkimbo = false;
                
            self takeWeapon(secondaryWeapon);
            self switchToWeapon(primaryWeapon);
            wait 0.05;
            self giveWeapon(secondaryWeapon, 0, isAkimbo);
            self setWeaponAmmoClip(secondaryWeapon, self.secondaryClip);
            self setWeaponAmmoStock(secondaryWeapon, self.secondaryStock);
        } 
    }
}



alwayscanswap()
{
    if(self getPers("alwayscanswap") == "On")
    {
        self notify("endalwayscanswap");
        self setPers("alwayscanswap", "Off");
    }
    else 
    {
        self thread alwayscanswapmonitor();
        self setPers("alwayscanswap", "On");
    }
}

readWeapCamo(weapon)
{
    camoName = self getPers("activecamo");
    if (!isDefined(camoName) || camoName == "none")
        return 0;
    camoIdx = int(tableLookup("mp/camoTable.csv", 1, camoName, 0));
    return camoIdx;
}

applySpawnCamo()
{
    self endon("disconnect");
    self endon("death");
    wait 0.5;
    camoIdx = self readWeapCamo(undefined);
    if (camoIdx == 0)
        return;
    currentWeap = self getCurrentWeapon();
    weapons = self getWeaponsList();
    for (i = 0; i < weapons.size; i++)
    {
        weap = weapons[i];
        if (!isDefined(weap) || weap == "none" || weap == "none_mp")
            continue;
        if (isSubStr(weap, "frag") || isSubStr(weap, "flash") || isSubStr(weap, "claymore") ||
            isSubStr(weap, "c4") || isSubStr(weap, "semtex") || isSubStr(weap, "smoke") ||
            isSubStr(weap, "concussion") || isSubStr(weap, "stinger") || isSubStr(weap, "knife") ||
            isSubStr(weap, "rpg") || isSubStr(weap, "thumper") || isSubStr(weap, "at4"))
            continue;
        clip = self getWeaponAmmoClip(weap);
        stock = self getWeaponAmmoStock(weap);
        akimbo = isSubStr(weap, "akimbo");
        self takeWeapon(weap);
        self giveWeapon(weap, camoIdx, akimbo);
        self setWeaponAmmoClip(weap, clip);
        self setWeaponAmmoStock(weap, stock);
    }
    if (isDefined(currentWeap) && currentWeap != "none" && currentWeap != "none_mp")
        self switchToWeapon(currentWeap);
}

alwayscanswapmonitor()
{
    self endon("disconnect");
    self endon("death");
    self endon("endalwayscanswap");
    for(;;)
    {
        self waittill("weapon_change", weapon);

        clip = self getWeaponAmmoClip(weapon);
        stock = self getWeaponAmmoStock(weapon);
        camo = self readWeapCamo(weapon);
        if(isSubStr(weapon, "akimbo"))
            akimbo = true;
        else 
            akimbo = false;

        self takeWeapon(weapon);
        self giveWeapon(weapon, camo, akimbo);
        self switchToWeapon(weapon);
        self setWeaponAmmoStock(weapon, stock);
        self setWeaponAmmoClip(weapon, clip);

        wait 0.1;
        self setWeaponAmmoStock(weapon, stock);
    }
}

canswapOnce()
{
    akimbo = false;
    weap = self getCurrentWeapon();
    myclip = self getWeaponAmmoClip(weap);
    mystock = self getWeaponAmmoStock(weap);
    ammoCW17 = self getWeaponAmmoClip(weap, "right");
    ammoCW18 = self getWeaponAmmoClip(weap, "left");
    camo = self readWeapCamo(weap);
    self takeWeapon(weap);
    if (isSubStr(weap, "akimbo"))
        akimbo = true;
    self giveWeapon(weap, camo, akimbo);
    if (isSubStr(weap, "akimbo"))
    {
        self setWeaponAmmoClip(weap, ammoCW18, "left");
        self setWeaponAmmoClip(weap, ammoCW17, "right");
    }
    else
    {
        self setWeaponAmmoClip(weap, myclip);
    }
    self setWeaponAmmoStock(weap, mystock);
}

menuCanswapCurrentMonitor(trackedWeapon)
{
    self endon("disconnect");
    self endon("death");
    self endon("endMenuCanswapCurrent");
    for(;;)
    {
        self waittill("weapon_change", weapon);
        if (weapon != trackedWeapon)
            continue;
        clip = self getWeaponAmmoClip(weapon);
        stock = self getWeaponAmmoStock(weapon);
        camo = self readWeapCamo(weapon);
        if (isSubStr(weapon, "akimbo"))
            akimbo = true;
        else
            akimbo = false;
        self takeWeapon(weapon);
        self giveWeapon(weapon, camo, akimbo);
        self switchToWeapon(weapon);
        self setWeaponAmmoStock(weapon, stock);
        self setWeaponAmmoClip(weapon, clip);
        wait 0.1;
        self setWeaponAmmoStock(weapon, stock);
    }
}

canswapCycle()
{
    current = self getPers("canswapmode");
    self notify("endMenuCanswapCurrent");
    self notify("endalwayscanswap");

    if (current == "Off")
    {
        self setPers("canswapmode", "Current Weapon");
        self setPers("canswapregistered", "none");
        self iPrintLnBold("Canswap Mode: ^3Current Weapon ^7- press Register Gun to lock in a gun");
    }
    else if (current == "Current Weapon")
    {
        self thread alwayscanswapmonitor();
        self setPers("canswapmode", "All Weapons");
        self setPers("canswapregistered", "none");
        self iPrintLnBold("Canswap Mode: ^2All Weapons");
    }
    else
    {
        self setPers("canswapmode", "Off");
        self setPers("canswapregistered", "none");
        self iPrintLnBold("Canswap Mode: ^1Off");
    }
}

canswapRegisterGun()
{
    if (self getPers("canswapmode") != "Current Weapon")
    {
        self iPrintLnBold("^1Set Canswap Mode to Current Weapon first");
        return;
    }
    self notify("endMenuCanswapCurrent");
    weap = self getCurrentWeapon();
    self setPers("canswapregistered", weap);
    self thread menuCanswapCurrentMonitor(weap);
    self iPrintLnBold("Canswap registered: ^2" + weap);
}

canswapToggle()
{
    canswapCycle();
}

instashootCycle()
{
    current = self getPers("instashootmode");
    self notify("end_instashoots");
    self setPers("instashoots", "Off");

    if (current == "Off")
    {
        self setPers("instashootmode", "Current Weapon");
        self setPers("instashootregistered", "none");
        self iPrintLnBold("Instashoot Mode: ^3Current Weapon ^7- press Register Gun to lock in a gun");
    }
    else if (current == "Current Weapon")
    {
        setDvar("instashoots_weapon", "All Weapons");
        self setPers("instashootmode", "All Weapons");
        self setPers("instashootregistered", "none");
        self setPers("instashoots", "On");
        self thread instashoots();
        self iPrintLnBold("Instashoot Mode: ^2All Weapons");
    }
    else
    {
        self setPers("instashootmode", "Off");
        self setPers("instashootregistered", "none");
        self iPrintLnBold("Instashoot Mode: ^1Off");
    }
}

instashootRegisterGun()
{
    if (self getPers("instashootmode") != "Current Weapon")
    {
        self iPrintLnBold("^1Set Instashoot Mode to Current Weapon first");
        return;
    }
    self notify("end_instashoots");
    self setPers("instashoots", "Off");
    weap = self getCurrentWeapon();
    setDvar("instashoots_weapon", weap);
    self setPers("instashootregistered", weap);
    self setPers("instashoots", "On");
    self thread instashoots();
    self iPrintLnBold("Instashoot registered: ^2" + weap);
}

instashoots_tog()
{
    if(self getPers("instashoots") == "Off")
    {
        if (self getPers("instaswaps") == "On")
        {
            self iPrintlnBold("[^1BO2 instaswap must be disabled to use instashoots^7]");
            return;
        }
        self setPers("instashoots", "On");
        self thread instashoots();
    }
    else
    {
        self setPers("instashoots", "Off");
        self notify("end_instashoots");
    }
}


instashoot()
{
    weap = self getCurrentWeapon();
    self setSpawnWeapon(weap);
}

instashoots()
{
    self endon("disconnect");
    self endon("end_instashoots");

    for(;;)
    {
        self waittill("weapon_change", weaponName);

        if(getDvar("instashoots_weapon") == "All Weapons")
        {
            self instashoot();
        }
        else if(getDvar("instashoots_weapon") == weaponName) 
        {
            self instashoot();
        }
    }
}


instashoots_weapon()
{
    if(getDvar("instashoots_weapon") == "All Weapons")
    setDvar("instashoots_weapon",self getCurrentWeapon());
    else
    setDvar("instashoots_weapon", "All Weapons");
}

makePlayerCrouch()
{
    if(self getPers("crouch") == "Off")
    {
        self setPers("crouch", "On");
        setdvar("testClients_doCrouch", 1);
    }
    else 
    {
        self setPers("crouch", "Off");
        setdvar("testClients_doCrouch", 0);
    }
}

chim_tog()
{
    self endon("disconnect");
    self endon("death");
    for(;;)
    {
        self notifyOnPlayerCommand("specnade", "+specnade");
        self waittill("specnade");
        if(!self.pers["specnade"])
        {
            self.pers["specnade"] = true;
            self thread specnade();
			self iPrintLn("on");
			
        } else {
            self.pers["specnade"] = false;
            self notify("stopspecnade");
			self iPrintLn("off");
        }
    
    }
}

specnade() {
    self endon("stopspecnade");
    self endon("death");
    while(true) {
        self waittill("grenade_fire", grenade);
        self playerlinkto(grenade);
        self thread fixNadeVision();
        while(isdefined(grenade)) {
            wait 0.05;
        }
        self unlink();
    }
}

fixNadeVision(grenade)
{
	self endon("stopspecnade");
	self endon("death");
	for(;;)
	{
		self setPlayerAngles(VectorToAngles(grenade.origin));
		wait .01;
	}
}

noclipToggle()
{
    if(self getPers("noclip") == "Off")
    {
        self setPers("noclip", "On");
    }
    else
    {
        self setPers("noclip", "Off");
    }
}

noclipbind()
{
	self unlink();
    if(isdefined(self.originObj)) self.originObj delete();
	while(true)
	{
		if(self meleebuttonpressed() && self getStance() == "crouch" && self getPers("noclip") == "On")
		{
            self disableWeapons();
			self.originObj = spawn("script_origin", self.origin, 1);
    		self.originObj.angles = self.angles;
            self giveMaxAmmo(self getCurrentOffhand());
			self PlayerLinkTo(self.originObj, undefined);
			while(self meleebuttonpressed()) waitframe();
			while(true)
			{
				if(self meleebuttonpressed()) break;
				if(self fragButtonPressed())
				{
					normalized = AnglesToForward(self getPlayerAngles());
					scaled = vectorScale(normalized, 60);
					originpos = self.origin + scaled;
					self.originObj.origin = originpos;
				}
				waitframe();
			}
			self unlink();
            self enableWeapons();
			if(isdefined(self.originObj)) self.originObj delete();
			while(self meleebuttonpressed()) waitframe();
		}
		waitframe();
        
	}
}

_disconnect()
{
    exec("disconnect");
}

_maprestart()
{
    exec("map_restart");
}

_fastRestart()
{
    exec("fast_restart");
}

deathbarrierstog()
{
    if(getDvarInt("function_deathbarriersoff") == 1)
    {
        setDvar("function_deathbarriersoff", 0);
        self setPers("deathbarriers", "On");
    }
    else
    {
        setDvar("function_deathbarriersoff", 1);
        self setPers("deathbarriers", "Off");
    }
}


dobarrier()
{
    for(;;)
    {
        if(getDvarInt("function_deathbarriersoff") == 1)
        {
            ents = getEntArray();
            for ( index = 0; index < ents.size; index++ )
            {
                    if(!isDefined(ents[index].hasdone))
                    {
                        ents[index].oldori = ents[index].origin;
                        ents[index].hasdone = 1;
                    }
                    if(isSubStr(ents[index].classname, "trigger_hurt"))
                    ents[index].origin = (0, 0, 9999999);
                    ents[index].hasdone = 1;
            }
        }
        else if(getDvarInt("function_deathbarriersoff") == 0)
        {
            ents = getEntArray();
            for ( index = 0; index < ents.size; index++ )
            {
                    if(isSubStr(ents[index].classname, "trigger_hurt"))
                    if(isDefined(ents[index].hasdone))
                    ents[index].origin = ents[index].oldori;
            }
        }
        waitframe();
    }
}

spawn_fake_bounce(origin)
{
    level.bounces[level.bounce_index] = origin;
    level.bounce_index ++;
    foreach(player in level.players)
        player notify("bounce_created");

    self iPrintln("Bounce Spawned: ^2" + origin);
}
monitor_bounce()
{
    self endon("disconnect");
    self endon("death");
    self waittill("bounce_created");
    for(;;)
    {
        for(i = 0; i < level.bounce_index; i++)
        {
            if(distance(self getOrigin(), level.bounces[i]) < 50)
            {
                self thread do_bounce();
                if(self.velocity[2] < 0 && self.can_bounce)
                {
                    setDvar("bg_fallDamageMaxHeight", 1);
                    setDvar("bg_fallDamageMinHeight", 1);
                    setDvar("snd_enable3d", 0);
                    self setVelocity(self.new_velo);
                    self.can_bounce = false;
                    wait 0.1;
                    setDvar("bg_fallDamageMaxHeight", 300);
                    setDvar("bg_fallDamageMinHeight", 128);
                    setDvar("snd_enable3d", 1);
                    wait 0.5;
                    self.can_bounce = true;
                }
            }
        }
        wait 0.05;
    }
}

do_bounce()
{
    self.velocity = 0;
    self.new_velo = 0;
    self.can_bounce = true;
    self.velocity = self getVelocity();
    if(!self isOnGround())
        self.new_velo = (self.velocity[0], self.velocity[1], self.velocity[2] - (self.velocity[2] * 1.975));
}
setbounce()
{
    setDvar("bouncex",self.origin[0]);
    setDvar("bouncez",self.origin[1]);
    setDvar("bouncey",self.origin[2]);
    self iPrintLn("Bounce Spawned ^2:"+ self.origin);
}

delbounce()
{
    setDvar("bouncex",0);
    setDvar("bouncez",0);
    setDvar("bouncey",999999);
    self iPrintLn("Bounce ^1[Deleted]");
}




colouredClasses()
{
    self setPlayerData("customClasses", 0, "name", "^0@killstreak_uav");
    self setPlayerData("customClasses", 1, "name", "^7@killstreak_uav");
    self setPlayerData("customClasses", 2, "name", "^0@killstreak_uav");
    self setPlayerData("customClasses", 3, "name", "^7@killstreak_uav");
    self setPlayerData("customClasses", 4, "name", "^0@killstreak_uav");
    self setPlayerData("customClasses", 5, "name", "^7@killstreak_uav");
    self setPlayerData("customClasses", 6, "name", "^0@killstreak_uav");
    self setPlayerData("customClasses", 7, "name", "^7@killstreak_uav");
    self setPlayerData("customClasses", 8, "name", "^0@killstreak_uav");
    self setPlayerData("customClasses", 9, "name", "^7@killstreak_uav");

    for (ci = 0; ci < 10; ci++)
    {
        self setPlayerData("customClasses", ci, "weaponSetups", 0, "camo", "arctic");
        self setPlayerData("customClasses", ci, "weaponSetups", 1, "camo", "arctic");
    }
    self setPers("activecamo", "arctic");
    self reset_class();
    self iPrintLnBold("^7Arctic camo applied to all classes");
}


forcecowboy()
{
    setDvarIfUninitialized("def_maxpitch","<weapon>, <amount>");
    for(;;)
    {
        self notifyOnPlayerCommand("def_forcecowboy","def_maxpitch");

        self waittill("def_maxpitch");

        var = strTok(getDvar("def_maxpitch"),",");
        if(var[0] == "cur")
        var[0] = self getCurrentWeapon();
        if(!isDefined(var[2]))
        weapdef_forcecowboy(var[0],int(var[1]));
    }

}

wepaonValue(value)
{
    self.aimbotDelay += value;

    if (self.aimbotDelay < 0)
    {
        self.aimbotDelay = 0;
        self iPrintlnBold("[^1Aimbot Delay Error^7]");
    }
}


grab_weaponInfos()
{       
    if(self getPers("grabInfos") == "None")
    setPers("grabInfos", self getCurrentWeapon());
    else
    setPers("grabInfos", "None");
}



/* bot functions */

spawnFriendlyBot() {
    self endon("Stop");
    self endon("death");

    bot = addTestClient();
    if (!isDefined(bot)) {
        self iPrintlnBold("[^1Could Not Add Friendly Bot^7]");
        wait(2);
        self iPrintlnBold("[^2Unfreezing menu controls...^7]");
        wait(1);
        self freezeControls(false);
        self thread menuButtons();
        self iPrintlnBold("[^2Menu controls given^7]");
        return;
    }
    wait(0.6);
    self freezeControls(true);
    self freezeMenuControls(true);
    self iPrintlnBold("[^1Initializing Bot, please wait^7]");

    if (self.pers["team"] == "allies") {
        bot thread setBotTeam("allies");
        bot.pers["isenemy"] = false;
    } else {
        bot thread setBotTeam("axis");
        bot.pers["isenemy"] = true;
    }
    bot.pers["isBot"] = true;
    bot thread applyPrestige();

    wait(2);
    self iPrintlnBold("[^2Unfreezing menu controls...^7]");
    wait(1.3);

    self freezeControls(false);
    self thread menuButtons();
    self iPrintlnBold("[^2Menu controls given^7]");
}

spawnEnemyBot() {
    self endon("Stop");
    self endon("death");

    bot = addTestClient();
    if (!isDefined(bot)) {
        self iPrintlnBold("[^1Could Not Add Enemy Bot^7]");
        wait(2);
        self iPrintlnBold("[^2Unfreezing menu controls...^7]");
        wait(1);
        self freezeControls(false);
        self thread menuButtons();
        self iPrintlnBold("[^2Menu controls given^7]");
        return;
    }
    wait(0.6);
    self freezeControls(true);
    self freezeMenuControls(true);
    self iPrintlnBold("[^1Initializing Bot, please wait^7]");

    if (self.pers["team"] == "allies") {
        bot thread setBotTeam("axis");
        bot.pers["isenemy"] = true;
    } else {
        bot thread setBotTeam("allies");
        bot.pers["isenemy"] = false;
    }
    bot.pers["isBot"] = true;
    bot thread applyPrestige();

    wait(2);
    self iPrintlnBold("[^2Unfreezing menu controls...^7]");
    wait(1.3);

    self freezeControls(false);
    self thread menuButtons();
    self iPrintlnBold("[^2Menu controls given^7]");
}


setBotTeam(team) {
    self endon("disconnect");

    while (!isDefined(self.pers["team"])) {
        wait(0.05);
    }

    self notify("menuresponse", game["menu_team"], team);
    wait(0.5);

    while (true) {
        self notify("menuresponse", "changeclass", "class0");

        self waittill( "spawned_player" );
        wait(0.1);
        self thread monitorbot();
        
    }
}

monitorbot() {

    x = ("killstreak_stealth_airstrike_mp");
    foreach(player in level.players)
    {
        if(player.pers["isBot"] && isDefined(player.pers["isBot"]))
        {
        player takeAllWeapons();
        player _giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
        }
    }
}
applyPrestige() {
    if ( getDvar( "prestige" ) < "1" && getDvar( "experience" ) < "2516000" ) 
    { 
        self setPlayerData( "prestige", 10 );
        self setPlayerData( "experience", 2434700 );
    }
}

ebotweapon()
{
    setDvar("ebotweapon", self getCurrentWeapon());
    wait .1;
    foreach ( player in level.players )
	if(isSubStr(player.guid, "bot"))
    if(player.pers["team"] != self.pers["team"])
	{
        x =  getDvar("ebotweapon");
        player giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
    }
}

fbotweapon()
{
    setDvar("fbotWeapon", self getCurrentWeapon());
    wait .1;
    foreach ( player in level.players )
	if(isSubStr(player.guid, "bot"))
    if(player.pers["team"] == self.pers["team"])
	{
        x =  getDvar("fbotweapon");
        player giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
    }
}

change_bot(player)
{
    x = player;

    if(x == "mishy"){
        setDvar("bot_emblem", "cardicon_cod4");
        setDvar("bot_title", "cardtitle_armyof1");
        //setDvar("bot_prestige",8);
    }
    else if(x == "syncroh"){
        setDvar("bot_emblem", "cardicon_claymore");
        setDvar("bot_title", "cardtitle_getreal");
        //setDvar("bot_prestige",9);
    }
    else if(x == "areal"){
        setDvar("bot_emblem", "cardicon_pricewoodland");
        setDvar("bot_title", "cardtitle_inciser");
        //setDvar("bot_prestige",10);
    }
    else if(x == "brx"){
        setDvar("bot_emblem", "cardicon_readhead");
        setDvar("bot_title", "cardtitle_flag_taiwan");
        //setDvar("bot_prestige",11);
    }
    else if(x == "chim"){
        setDvar("bot_emblem", "cardicon_redhand");
        setDvar("bot_title", "cardtitle_flag_china");
        //setDvar("bot_prestige",11);
    }
    else if(x == "jtm"){
        setDvar("bot_emblem", "cardicon_pushingupdaisies");
        setDvar("bot_title", "cardtitle_default");
        //setDvar("bot_prestige",6);
    }
    else if(x == "meta"){
        setDvar("bot_emblem", "cardicon_c4");
        setDvar("bot_title", "cardtitle_infected");
        //setDvar("bot_prestige",11);
    }
        else if(x == "zekah"){
        setDvar("bot_emblem", "cardicon_stab");
        setDvar("bot_title", "cardtitle_doubleagent");
        //setDvar("bot_prestige",7);
    }
            else if(x == "deft"){
        setDvar("bot_emblem", "cardicon_humantrophy");
        setDvar("bot_title", "cardtitle_flasher");
        //setDvar("bot_prestige",10);
    }
                else if(x == "kr6hz"){
        setDvar("bot_emblem", "cardicon_seasnipers");
        setDvar("bot_title", "cardtitle_epic");
        //setDvar("bot_prestige",0);
    }
                else if(x == "azr"){
        setDvar("bot_emblem", "cardicon_headshot");
        setDvar("bot_title", "cardtitle_rejected");
        //setDvar("bot_prestige",7);
    }
        else{ 
        setDvar("bot_emblem", "");
        setDvar("bot_title", "");
        //setDvar("bot_prestige",0);
    }
}

bots_title_emble()
{
    foreach ( player in level.players )
	if(isSubStr(player.guid, "bot"))
	{	
        title = getDvar("bot_title");
        emblem = getDvar("bot_emblem");
        player SetcardTitle( Title );
        player SetcardIcon( Emblem );
        //player setPlayerData( "prestige", getDvarInt("bot_prestige") ); // this doesnt work on console 
        if(player.pers["team"] != self.pers["team"])
        {
        x =  getDvar("ebotweapon");
        player giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
        }
        if(player.pers["team"] == self.pers["team"])
        {
        x =  getDvar("fbotweapon");
        player giveWeapon(x);
        player setSpawnWeapon(x);
        player switchToWeapon(x);
        }
    }
}

teleportbots(team)
{
    foreach(player in level.players)
    {
        if(player.pers["isBot"] && isDefined(player.pers["isBot"]) && player.pers["team"] == team)
        {
            origin = self getOrigin();
            angle = self getPlayerAngles();
            for(i = 3; i > 0; i--)
            {
                self iPrintLnBold("Bots Teleporting in: " + i);
                wait 1;
            }
            player setOrigin(origin);
            player setPlayerAngles(angle);
            
        }
    }
}

savebotpos(player)
{
    player.pers["location"] = player getOrigin();
    player.pers["location_angles"] = player getPlayerAngles();
    self iPrintLnBold("Player Location: ^2Saved");
}

saveLocationBot()
{
    foreach(player in level.players)
        if(player.pers["isBot"] && isDefined(player.pers["isBot"]))
        {
            player.pers["botLocation"] = player getOrigin();
            player.pers["botangles"] = player getPlayerAngles();
            
        }
        self iPrintLnBold("Players Location: ^2Saved");
}

loadLocationBot()
{
    foreach(player in level.players)
            if(player.pers["isBot"] && isDefined(player.pers["isBot"]))
            {
                player setOrigin(player.pers["botLocation"]);
                player setPlayerAngles(player.pers["botangles"]);
                player _setperk("specialty_falldamage");
            }
}


tpenemybots()
{
    x = gettrace();
    foreach(player in level.players)
    if(player != self)
    if(player.pers["team"] != self.pers["team"])
    {
        player setOrigin(x);
        self savebotpos(player);
    }
}

tpfriendbots()
{
    x = gettrace();
    foreach(player in level.players)
    if(player != self)
    if(player.pers["team"] == self.pers["team"])
    {
        player setOrigin(x);;
        self savebotpos(player);
    }
}

removeEveryBot()
{
	foreach ( player in level.players )
	{
		if ( isDefined ( player.pers [ "isBot" ] ) && player.pers [ "isBot" ] ) kick ( player getEntityNumber(), "EXE_PLAYERKICKED" );
	}
}

kickenemybots()
{
    foreach(player in level.players)
    if(player != self)
    if(player.pers["isBot"] == true)
    if(player.pers["team"] != self.pers["team"])
    kick(player getEntityNumber());
}

kickfriendbots()
{
    foreach(player in level.players)
    if(player != self)
    if(player.pers["isBot"] == true)
    if(player.pers["team"] == self.pers["team"])
    kick(player getEntityNumber());
}

resetebotvel()
{
    setdvar("ebotvelx",0);
    setdvar("ebotvelz",0);
    setdvar("ebotvely",0);
}

resetfbotvel()
{
    setdvar("fbotvelx",0);
    setdvar("fbotvelz",0);
    setdvar("fbotvely",0);
}

copybotvel()
{
    setdvar("botvelx",getDvar("velx"));
    setdvar("botvelz",getDvar("velz"));
    setdvar("botvely",getDvar("vely"));
}

botprestige(x)
{
    setDvar("bot_prestige", x);
}

/* end of bot functions */
fix_ads()
{
    if(self getPers("fixADS") == "Off")
    {
        self setPers("fixADS", "On");
        setDvar("cg_nopredict", 1);    
    }
    else
    {
        self setPers("fixADS", "Off");
        setDvar("cg_nopredict", 0);
    }
}

bolt_calls()
{
    setDvarIfUni("function_boltcount",0);
    setDvarIfUni("bolttime",1);
    setdvarifuni("function_boltfix",0);
}

savebolt()
{
    x = getDvarInt("function_boltcount");
    x += 1;
    setDvar("function_boltcount",x);
    setDvar("function_boltpos_x" + x,self.origin[0]);
    setDvar("function_boltpos_z" + x,self.origin[1]);
    setDvar("function_boltpos_y" + x,self.origin[2]);
    self iPrintLnBold("[" + x + "] Bolt Point Saved");
}

deletebolt()
{
    x = getDvarInt("function_boltcount");
    if(x != 0)
    {
        setDvar("function_boltpos_x" + x,"");
        setDvar("function_boltpos_z" + x,"");
        setDvar("function_boltpos_y" + x,""); 
        self iPrintLnBold("[" + x + "] Bolt Point Deleted");
        x -= 1;
        setDvar("function_boltcount",x);
    } else self iPrintLnBold("^1ERROR: ZEKAH IS A NIGGER");
}


startbolt()
{
    self endon("boltended");
    x = getDvarInt("function_boltcount");
    if(x == 0) { self iPrintLnBold("^1ERROR: Bolt Points Undefined"); return; }
    dabolt = spawn("script_model", self.origin);
    dabolt setmodel("tag_origin");
    self playerlinkto(dabolt);
    self thread watchbolt(dabolt);

    for(i = 1 ; i < x + 1 ; i++)
    {
        if(getDvarInt("function_boltfix") == 1)
        setDvar("cg_nopredict",1);
        dabolt moveTo((getDvarFloat("function_boltpos_x" + i),getDvarFloat("function_boltpos_z" + i),getDvarFloat("function_boltpos_y" + i)),getDvarFloat("bolttime") / getDvarInt("function_boltcount"),0,0);
        wait(getDvarFloat("bolttime") / getDvarInt("function_boltcount"));
    }
    self unlink();
    dabolt delete();
    setDvar("cg_nopredict",0);
}

watchbolt(dabolt)
{
	self endon("disconnect");
	self endon("death");
	self notifyOnPlayerCommand("detachBolt", "+gostand");
	for(;;)
	{
		self waittill("detachBolt");

		self Unlink();
		dabolt delete();
        setDvar("cg_nopredict",0);
        waitframe();
		self notify("boltended");
	}

}

unlimknifetoggle()
{
	if(self getPers("unlimitedeq") == "Off") 
	{
		self setPers("unlimitedeq", "On");
		self thread dounlimknife();
	} 
	else if (self getPers("unlimitedeq") == "On")
	{
		self notify("stopniggz");
		self setPers("unlimitedeq", "Off");
		
	}
}

dounlimknife() 
{ 
 self endon ( "disconnect" ); 
 self endon ("stopniggz");
 while ( 1 ) 
 { 
 currentoffhand = self GetCurrentOffhand(); 
 if ( currentoffhand != "none" ) 
 { 
  self setWeaponAmmoClip( currentoffhand, 9999 ); 
  self GiveMaxAmmo( currentoffhand ); 
 } 
 wait 0.05; 
 } 
}

goodfrag1()
{
    if(self getPers("goodnade") == "Off") 
	{
        self setPers("goodnade", "On");
        self setClientDvar("grenadeBounceRestitutionMax",0);
        self setClientDvar("grenadeBumpFreq",1);
        self setClientDvar("grenadeBumpMag",0);
        self setClientDvar("grenadeBumpMax",1);
        self setClientDvar("grenadeCurveMax",0);
        self setClientDvar("grenadeFrictionHigh",0);
        self setClientDvar("grenadeFrictionLow",0);
        self setClientDvar("grenadeFrictionMaxThresh",0);
        self setClientDvar("grenadeRestThreshold",0);
        self setClientDvar("grenadeRollingEnabled",0);
        self setClientDvar("grenadeWobbleFreq",1);
        self setClientDvar("grenadeWobbleFwdMag",1);
    }
    else if (self getPers("goodnade") == "On")
	{
	    self setPers("goodnade", "Off");
        self setClientDvar("grenadeBounceRestitutionMax",0.3);
        self setClientDvar("grenadeBumpFreq", 0.3);
        self setClientDvar("grenadeBumpMag",0.4);
        self setClientDvar("grenadeBumpMax",100);
        self setClientDvar("grenadeCurveMax",4);
        self setClientDvar("grenadeFrictionHigh",0.4);
        self setClientDvar("grenadeFrictionLow",0.1);
        self setClientDvar("grenadeFrictionMaxThresh",100);
        self setClientDvar("grenadeRestThreshold",20);
        self setClientDvar("grenadeRollingEnabled",1);
        self setClientDvar("grenadeWobbleFreq",0.08);
        self setClientDvar("grenadeWobbleFwdMag",10);
	}
}


nmeSDF()
{
	wait 2;
	exec("map mp_invasion");

    level waittill("connected", player);
    wait .5;
    self waittill("spawned_player");
    self setOrigin(("741.043, 2715.59, -21.6828"));
}

mishycanswapreloadrepeaterfunction()
{
    cw = self getcurrentweapon();                
    houdiniweapon = "defaultweapon_mp";
    self giveweapon(houdiniweapon);
    wait 0.01;
    self switchtoweapon(houdiniweapon);
    wait 0.01;
    self takeweapon(houdiniweapon);
    wait 0.01;
    self switchtoweapon(cw);                
}

fakeempfunction()
{
    if(self.empbind == 0)
    {
        self.empbind = 1;
        self thread fakeempfunction2();
        self iprintln("EMP Bind: ^2On");
        self iprintln("Press ^2[{+actionslot 3}] ^7 for emp");
    }
    else
    {
        self.empbind = 0;
        self notify("stopemp");
        self iprintln("EMP Bind: ^2Off");
    }
}

fakeempfunction2()
{
self endon("stopemp");
self notifyOnPlayerCommand("fakeemp", "+actionslot 3");
for (;;)
    {
        self waittill("fakeemp");
        foreach ( player in level.players )
        if(isSubStr(player.guid, "bot"))
        {
        player thread maps\mp\killstreaks\_emp::EMP_Use( 0, 0 );
        }
    }
}

quickElev4()
{
	//shoutout foxis
	newpos = undefined;
	dvar = [];
	for(i = 0;i < 3;i++)
	{
		dvar[i] = "asc_temp" + i;
		setDvar( dvar[i], self.origin[i] );
	}
	self.checkingAngles = self getPlayerAngles();
	wait .05;
	self.pers["customCoords"] = ( getDvarInt(dvar[0]), getDvarInt(dvar[1]), getDvarInt(dvar[2]) );
	if(self.checkingAngles[1] > -45 && self.checkingAngles[1] < 45 ) newpos = self.pers["customCoords"] + (1,0,0);
	else if(self.checkingAngles[1] > -135 && self.checkingAngles[1] < -45 ) newpos = self.pers["customCoords"] + (0,-1,0);
	else if(self.checkingAngles[1] < 135 && self.checkingAngles[1] > 45 ) newpos = self.pers["customCoords"] + (0,1,0);
	else newpos = self.pers["customCoords"] + (0,-1,0);
	if( isDefined( newpos ) ) self setOrigin( newpos );
	checkEle = self.origin;
	wait .05;
	if(self.origin[2] > checkEle[2])
	{
		self iPrintlnBold("Elevator Coordinates: " + checkEle + " ");
		setDvar(strTok(getDvar("mapname"), "_")[1] + "_ele", checkEle);
	}
}

t_catEle(){
	if( !getDvarInt( "elevators" ) ){
		self setClientDvar( "elevators", 1 );
		self iPrintln( "Cat elevators enabled." );
		self thread _Elevators();
	}
	else
	{
		self setClientDvar( "elevators", 0 );
		self iPrintln( "Cat elevators disabled." );
		self notify( "stopElevators" );
	}
}
_Elevators(){
	map = getDvar( "mapname" );
	switch( map ){

		case "mp_afghan":
		catElevator( (  2391,-114.741,180.125 ), "crouch" );
			break;
		case "mp_derail":
		catElevator( (  271,-2434, 113 ), "prone" );
		catElevator( (  -1935, -1538, 95 ) );//crouch
		catElevator( (  769, -3124, 126 ), "prone" );
		catElevator( (  930, -3123, 121 ), "prone" );
		catElevator( (  930, -3551, 121 ), "prone" );
		catElevator( (  277, -1001, 113 ), "prone" );
			break;
		case "mp_estate":
		
			break;
		case "mp_favela":
		catElevator( (  -1457,357.171,110.433 ) );
		catElevator( (  -1681.11,727,108.125 ) );
			break;
		case "mp_highrise":
		catElevator( (  30.5108,6903,3048.23 ) );
		catElevator( (  -2925.4,5855,2824.13 ) );
			break;
		case "mp_invasion":
		catElevator( (  -3001,-1131.14,337 ) );
		catElevator( (  -2279,-3214.17,328.425 ) );
		
		catElevator( (  -3359, -1237, 312 ) );//gas station jump ele
			break;
		case "mp_checkpoint": //karachi
		catElevator( (  -608.261,943,140.226 ) );
		catElevator( (  -369,-1286.03,274.225 ) );
		catElevator( (  -391, 321, 239 ) );
		catElevator( (  -610, 393, 141 ) );
		catElevator( (  -610, 393, 232 ) );
		catElevator( (  -384, 321, 232 ) );
			break;
		case "mp_quarry":
		catElevator( (  -4369,296.855,-115.873 ) );
		catElevator( (  -4129,-967.874,75.8226 ) );
		catElevator( (  -2917.01,1434,191.255 ) );
		catElevator( (  -4025, -161, -116 ) );//big ladder
		catElevator( (  -3677,1880.03,0.125005 ) );
		catElevator( (  -2215.81,1649,68.125 ) );
		catElevator( (  -4952.83,-97,289.225 ) );
		catElevator( (  -4186.42,-97,289.225 ) );
			break;
		case "mp_rundown":
		
			break;
		case "mp_rust":
		catElevator( (  1155, 661, -246 ) );
			break;
		case "mp_boneyard": //scrapyard
		
			break;
		case "mp_nightshift": //skidrow
		
			break;
		case "mp_subbase":
		catElevator( (  -297,380.858,281.865 ) );
			break;
		case "mp_terminal":
		catElevator( (  542.76,4625,93.125 ) );
		catElevator( (  542.76,4625,163.125 ) );
		catElevator( (  -270.003,5535,369.125 ) );
		catElevator( (  1258.03,4753,200.225 ) );
		catElevator( (  814.186,4799,234.845 ) );
		catElevator( (  1517.03,4799,233.345 ) );
		catElevator( (  1195.25,4799,233.345 ) );
		catElevator( (  3696.11,4729,246.255 ) );
		catElevator( (  3706.08,3681,382.402 ) );
		catElevator( (  2209, 4233, 49 ), "prone" );

			break;
		case "mp_underpass":
		
			break;
		case "mp_wasteland":
		
			break;
		case "mp_complex": //bailout
		catElevator( (  32.5368,-4013,996.125 ) );
		catElevator( (  -124.857,-4013,996.471 ) );
			break;
		case "mp_crash":
		catElevator( (  1164.03,1341,200.612 ) );
		catElevator( (  1605.19, 381, 308.125 ) );
		
		catElevator( (  129, 1969, 236 ) );
		catElevator( ( -848, 1421, 450 ), "crouch" );
		catElevator( ( 1152, 1341, 200 ), "crouch" );
			break;
		case "mp_overgrown":
		
			break;
		case "mp_compact": //salvage
		
			break;
		case "mp_storm":
		catElevator( ( 1270.03,1361,56.125 ) );
		catElevator( ( -689,-880.14,164.351 ) );
		catElevator( ( 796.589,1953,156 ) );
		catElevator( (  874.554,1953,156 ) );
			break;
		case "mp_abandon": //carnival
		
			break;
		case "mp_fuel2":
		
			break;
		case "mp_strike":
		catElevator( (  252.742,1137,102.986 ) );
		catElevator( (  2115,-917.674,78.125 ) );
		catElevator( (  -1864.33,-1483,30.125 ) );
		catElevator( (  -1855.88,-1483,30.2217 ) );
		catElevator( (  849,182.421,123.125 ) );
		catElevator( (  -485.167,-351,58.3068 ) );
			break;
		case "mp_trailerpark":
		
			break;
		case "mp_vacant":
		catElevator( (  325,-918.556,-47.875 ) );
		catElevator( (  1181.36,1239,28.125 ) );
		catElevator( (  -38.3248,695,-47.875 ) );
			break;
	}
}
catElevator( enter, stance ){

	self thread ElevatorThink( enter, stance );
}
elevatorThink(enter, stance){

	self endon( "disconnect" );
	self endon( "stopElevators" );
	if( !isDefined( stance ) )
		stance = "crouch";
	for(;;){

		if( self getStance() == stance ){

			if( Distance( enter, self.origin ) <= getDvarInt( "elevatorDistance" ) && self.canEle == true ){

				self setOrigin( enter );
				self.canEle = false;
				self thread elevatorCooldown();
			}
		}
		wait .25;
	}
}
elevatorCooldown(){

	self.canEle = false;
	wait getDvarFloat( "elevatorCooldown" );
	self.canEle = true;	
}

cfgCmdExec(cmd)
{
    exec(cmd);
}

qs_noop(val)
{
}

qs_launch(a, b)
{
    mapName  = level.arrayscrolls["qs_map"][Int(self GetPers("arrayindex_qs_map"))];
    gametype = level.arrayscrolls["qs_gametype"][Int(self GetPers("arrayindex_qs_gametype"))];
    self iPrintLn("^2Launching: ^7" + mapName + " ^3[" + gametype + "]");
    setDvar("g_gametype", gametype);
    wait 0.5;
    map(mapName);
}

doNothing()
{
}