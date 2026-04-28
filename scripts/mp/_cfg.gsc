#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

#include scripts\mp\_util;
#include scripts\mp\menu\_menuutils;
#include scripts\mp\_functions;
#include scripts\mp\_aimbot;
#include scripts\mp\_binds;


cfg_calls()
{
    if(self isHost())
    {
  self thread cclassbind1();
  self thread cclassbind2();
  self thread cclassbind3();
  self thread cclassbind4();
  self thread cclassbind5();
  self thread cclassbind6();
  self thread cclassbind7();
  self thread cclassbind8();
  self thread cclassbind9();
  self thread cclassbind10();
  self thread dvarposition();
  self thread dvarvelocity();
  self thread dvarviewangle();
  self thread forceshot();
  self thread doCpMala();
  self thread doPredMala();
  self thread cfgsuitrepeaters();
  self thread illusionsta();
  self thread omabag();
  self thread giveGunlock();
  self thread takeweapshax();
  self thread spectator();
  self thread damage();
  self thread killbind();
  self thread posBot();
  self thread velBot();
  self thread blowtankcfg();
  self thread triplehpcfg();
  self thread cfgprone();
  self thread chimthing();
  self thread fakehitmarker();  
  self thread dropdeletecfg();
  self thread takewepcfg();
  self thread splashstreak4();
  self thread mantlebot();
  self thread cfgcanswap();
  self thread stuncfg();
  self thread ammocfg();
  self thread cpdrop();
  self thread destroytaccfg();
  self thread flashcfg();
  self thread thirdeyecfg();
  self thread nacmodfg();
  self thread plantbar();
  self thread dsweap();
  self thread scavcfg();
  self thread damage2();
  self thread dropcfg2();
  self thread semcfg();
  self thread cfgsmooth();
  self thread fakeconnect();
  self thread fakeconnect2();
  self thread swaptoweapon();
  self thread animcfg();
  self thread anim2cfg();
  self thread blastcfg();
  self thread smooth2cfg();
  self thread friendlyKnockcfg();
  self thread finalstandcfg();
  self thread laststandcfg();
  self thread hostmigracfg();
  self thread radiusdmgcfg();
  self thread vel2cfg();
  self thread botkilltestcfg();
  self thread ebotvelbindcfg();
  self thread fbotvelbindcfg();
  self thread mishycanswapcfg();
  self thread fakeempcfg();
  self thread dropcfg();
  self thread forcethrowcfg();
  self thread forceholdcfg();
  self thread savelocfg();
  self thread loadlocfg();
  self thread dvartogcfg();
  self thread zaliumcfg();
  self thread instaswapbindcfg();
  self thread killbotbindcfg();
  self thread disablepickup();
  self thread enablepickup();
  self thread doradiation0();
  self thread cfgGrenadeDamage();
  self thread airspacepop();
  self thread civilianpop();
  self thread jamradar();
  self thread akmbo();
  self thread rerepeatercfg();
  self thread c4detocfg();
  self thread zoomloadcfg();
  self thread givecpcfg();
  self thread givepredcfg();
  self thread suicidecfg();
  self thread barrelrollcfg();
  self thread tacflipcfg();
  self thread goodinstacfg();
  self thread takeallcfg();
  self thread joingamecfg();
  self thread radmarknewcfg();
  self thread raddamnewcfg();
  self thread pickupradcfg();
  self thread nopickupradcfg();
  self thread gmodecfg();
  self thread dmodecfg();
  self thread hmodecfg();

  self thread faketroikalunge();
  self thread fragthrow();
  self thread flashs();
  self thread stunthrow();
  self thread tacplant();
  self thread claygflip();
  self thread c4mala();
  self thread tacmala();
  self thread fragreloadrepeater();
  self thread claymalacfg();
  self thread slowuavmala();
  self thread riotcfg();
  self thread juitiltcfg1();
  self thread juitiltcfg2();
  self thread reefercfg();
  self thread predknife();
  self thread predspace();
  self thread gypsycfg();
  self thread earthquakecfg();
  self thread cfgmelee();
  self thread infsprint();
  self thread marareload();
  self thread givetkcfg();
  self thread giveclaycfg();
  self thread givetaccfg();
  self thread givesemcfg();
  self thread givefragcfg();
  self thread givec4cfg();
  self thread plustilt();
  self thread glide();
  self thread fastglide();
  self thread longadeliaglide();
  self thread adeliaglide();
  self thread smoothanimcfg();
  self thread ac130togglecfg();
  self thread ac130bindcfg();
  self thread sentrycfg();
  self thread gflipcfg();
  self thread jumpwestcfg();
  self thread jumpnorthcfg();
  self thread jumpeastcfg();
  self thread jumpsouthcfg();
  self thread velwestcfg();
  self thread velnorthcfg();
  self thread veleastcfg();
  self thread velsouthcfg();
  self thread blackscreencfg();
  self thread greenscreencfg();
  self thread altswapcfg();
  self thread bouncecfg();
  self thread reflectcfg();
  self thread copycatcfg();
  self thread canzoomcfg();
  self thread omashaxcfg();
  self thread houdinicfg();
  self thread m21cfg();
  self thread intercfg();
  self thread barrcfg();
  self thread wa2kcfg();
  self thread uzicfg();
  self thread spascfg();
  self thread thumpercfg();
  self thread rpgcfg();
  self thread p90cfg();
  self thread magcfg();
  self thread pp2kcfg();
  self thread bombcfg();
  self thread kiwizcfg();
  self thread ubfreezeanimcfg();
  self thread modelshaxcfg();
  self thread spasshaxcfg();
  self thread fasttacplantcfg();
  self thread clayplantcfg();
  self thread c4throwcfg();
  self thread modelinterglcfg();
  self thread omasprintbarcfg();
  self thread instcowboycfg();
  self thread proneknifecfg();
  self thread tacknifepkcfg();
  self thread resettacknifecfg();
  self thread m9zoomcfg();
  self thread boltpumpcfg();
  self thread sprintincfg();
  self thread instaswapcfgbind();
  self thread stunmalacfg();

  self thread directanim0cfg();
  self thread directanim1cfg();
  self thread directanim2cfg();
  self thread directanim3cfg();
  self thread directanim4cfg();
  self thread directanim5cfg();
  self thread directanim6cfg();
  self thread directanim7cfg();
  self thread directanim8cfg();
  self thread directanim9cfg();
  self thread directanim10cfg();
  self thread directanim11cfg();
  self thread directanim12cfg();
  self thread directanim13cfg();
  self thread directanim14cfg();
  self thread directanim15cfg();
  self thread directanim16cfg();
  self thread directanim17cfg();
  self thread directanim18cfg();
  self thread directanim19cfg();
  self thread directanim20cfg();
  self thread directanim21cfg();
  self thread directanim22cfg();
  self thread directanim23cfg();
  self thread directanim24cfg();
  self thread directanim25cfg();
  self thread directanim26cfg();
  self thread directanim27cfg();
  self thread directanim28cfg();
  self thread directanim29cfg();
  self thread directanim30cfg();
  self thread directanim31cfg();
  self thread directanim32cfg();
  self thread directanim33cfg();
  self thread directanim34cfg();
  self thread instashootcfg();
  self thread instashootoffcfg();
  self thread instashootwepCfg();

    }
}
swaptoweapon()
{
   self endon("disconnect");
   self endon("death");
   for (;;)
   {
      self notifyOnPlayerCommand("swaptoweapon", "+swap");
	  self waittill("swaptoweapon");
            x =  getDvar("swap_weapon");
            self setspawnweapon(x);
   }
}

fakeconnect2()
{
   self endon("disconnect");
   self endon("death");
   for (;;)
   {
      self notifyOnPlayerCommand("fakeconnect2", "+connect2");
	  self waittill("fakeconnect2");
	  self iPrintLn("your mom Connected");
   }
}

fakeconnect()
{
   self endon("disconnect");
   self endon("death");
   for (;;)
   {
      self notifyOnPlayerCommand("fakeconnect", "+connect");
	  self waittill("fakeconnect");
	  self iPrintLn("Cristiano Ronaldo Connected");
   }
}


cfgsmooth()
{
self endon("disconnect");
self endon("death");
for(;;)
{
self notifyOnPlayerCommand("cfgsmooth", "+smooth");
self waittill ("cfgsmooth");
setDvar("sv_padPackets", 4000);
waitframe();
//self freezeControlsWrapper( true );
self Unlink();
self disableWeapons();
waitframe();
self enableWeapons();
waitframe();
self Unlink();
setDvar("sv_padPackets", self.pers["lagmenu"]);
if(!isDefined (self.pers["lagmenu"]))
{
setDvar("sv_padpackets", 0);
}
}
}

scavcfg()
{
  self endon("disconnect");
  self endon("death");
  for (;;)
  {
     self notifyOnPlayerCommand("scavcfg", "+scav");
	 self waittill("scavcfg");
                self maps\mp\gametypes\_damagefeedback::updateDamageFeedback( "scavenger" );
            self playLocalSound( "scavenger_pack_pickup" );
            self setWeaponAmmoClip(self getCurrentWeapon(),0);
            self setWeaponAmmoStock(self getCurrentWeapon(),999);
  }
}
dsweap()
{
  self endon("disconnect");
  self endon("death");
  for (;;)
  {
     self notifyOnPlayerCommand("ds", "+disable");
	 self waittill("ds");
	 self disableweapons();
	 self notifyOnPlayerCommand("ds2", "-disable");
	 self waittill("ds2");
	 self enableweapons();
  }
}

plantbar()
{
	self endon("disconnect");
	self endon("death");
    setDvarIfUninitialized("barduration", 2);
	for(;;)
	{
	self notifyOnPlayerCommand("barbar","+bar");
	self waittill("barbar");
	waitframe();
	self thread Custom_Omabar();
	}
}


Custom_Omabar()
{
   self playLocalSound( "foly_onemanarmy_bag3_plr" );
    wduration = getDvarFloat("barduration");
    NSB = createPrimaryProgressBar( 10 );
    NSBText = createPrimaryProgressBarText( 10 );
    NSBText settext( &"MPUI_CHANGING_KIT" );
    NSB updateBar( 0, 1 / wduration );
    for ( waitedTime = 0;waitedTime < wduration && isAlive( self ) && !level.gameEnded;
    waitedTime += 0.05 )wait ( 0.05 ); 
    NSB destroyElem();
    NSBText destroyElem();
}

custom_bar2(duration, split)
{
	self endon( "disconnect" );
	self endon("death");
	
	self playLocalSound( "foly_onemanarmy_bag3_plr" );
	self.pers["useBar"] = createPrimaryProgressBar( 25 ); //Change this to whatever you want.
	self.pers["useBarText"] = createPrimaryProgressBarText( 25 ); //Change this to whatever you want.
	self.pers["useBarText"] setText( "Changing Kit..." ); //Change this to whatever you want.

	self.pers["useBar"] updateBar( 0, split / duration );
	for ( waitedTime = 0; waitedTime < duration && isAlive( self ) && !level.gameEnded; waitedTime += 0.05 )
		wait ( 0.05 );
	
	self.pers["useBar"] destroyElem();
	self.pers["useBarText"] destroyElem();
}

destroy_all_bars()
{
    self endon("disconnect");
    self endon("death");
    for(;;)
    {
        self notifyOnPlayerCommand("db", "+db"); 
        self waittill("db");
        self.pers["useBar"] destroyElem();
        self.pers["useBarText"] destroyElem();
        waitframe();
    }
}


nacmodfg()
{
    self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("nacmodcfg", "+nac");
		self waittill("nacmodcfg");
        {
        x = getDvar("nacmod1");
        y = getDvar("nacmod2");
        nacmodD = self getCurrentWeapon();
        akimbo = false;
        if (nacmodD == x)
        {
            clip = self getWeaponAmmoClip(x);
            stock = self getWeaponAmmoStock(x);
            self takeWeapon(x);
            self switchToWeapon(y);
            wait 0.1;
            self giveWeapon(x);
            self setweaponammoclip(x, clip );
            self setweaponammostock(x, stock );
        }
        else if (nacmodD == y)
        {
            clip = self getWeaponAmmoClip(y);
            stock = self getWeaponAmmoStock(y);
            if(isSubStr(y, "akimbo"))
                akimbo = true;
            self takeWeapon(y);
            self switchToWeapon(x);
            wait 0.1;
            self giveWeapon(y, 0, akimbo);
            self setweaponammoclip(y, clip );
            self setweaponammostock(y, stock );

        }
    }
}
}

thirdeyecfg()
{
    self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("thirdeye", "+thirdeye");
		self waittill("thirdeye");
        {
        self thread maps\mp\_flashgrenades::applyFlash(0, 0);
        }
    }
}

flashcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("flash", "+flash");
		self waittill("flash");
        {
            self playLocalSound( "grenade_explode_default" );
            wait .05;
            self thread maps\mp\_flashgrenades::applyFlash(2, 2);
            }
}
}

destroytaccfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("destroytac", "+destroytac");
		self waittill("destroytac");
        {
            self thread maps\mp\gametypes\_hud_message::SplashNotify( "denied", 20 );
            self hitmarker();
        }
    }
}


cpdrop()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("cpdrop", "+cpdrop");
		self waittill("cpdrop");
        setDvar("function_carepackphysic", 1);
        x = getDvarFloat("cpposx");
        y = getDvarFloat("cpposy");
        z = getDvarFloat("cpposz");
        level maps\mp\killstreaks\_airdrop::doFlyBy( self, (x,y,z), randomFloat( 360 ), "airdrop" );
        self notify("airDropMarkerActivate");
        wait 5;
    }
}
ammocfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("ammo", "+ammo");
		self waittill("ammo");
            self setWeaponAmmoClip(getDvar("primary_weapon"),getDvarInt("primary_clip"));
            self setWeaponAmmoStock(getDvar("primary_weapon"),getDvarInt("primary_stock"));
            self setWeaponAmmoClip(getDvar("secondary_weapon"),getDvarInt("secondary_clip"));
            self setWeaponAmmoStock(getDvar("secondary_weapon"),getDvarInt("secondary_stock"));
}
}

stuncfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("stun", "+stun");
		self waittill("stun");
        self playLocalSound( "grenade_explode_default" );
        wait .05;
        stuntime = getDvarFloat("stun_duration");
        self shellShock( "concussion_grenade_mp", stuntime );
        self thread [[ level.callbackPlayerDamage ]](self,self,30,1,"MOD_RIFLE_BULLET","concussion_grenade_mp",(0,0,0),(0,0,0),"",0,0);
        self playLocalSound( "grenade_explode_default" );
}
}

cfgcanswap()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("cfgcanswip", "+canswap");
		self waittill("cfgcanswip");
		self thread canswapcfg();
	}
}

canswapcfg()
{
	akimbo = false;
	weap = self getCurrentWeapon();
	myclip = self getWeaponAmmoClip(weap);
	mystock = self getWeaponAmmoStock(weap);
	ammoCW17 = self getWeaponAmmoClip( weap, "right" );
	ammoCW18 = self getWeaponAmmoClip( weap, "left" );
	self takeWeapon(weap);
	if(isSubStr(weap, "akimbo"))
			akimbo = true;
	self giveWeapon(weap, self.camo, akimbo);
	if( isSubStr( weap, "akimbo" ) )
	{
				self setWeaponAmmoClip( weap, ammoCW18, "left" );
				self setWeaponAmmoClip( weap, ammoCW17, "right" );
	} else {
		self setweaponammoclip(weap, myclip);
	}
	self setweaponammostock(weap, mystock);
}

mantlebot()
{
    self endon ("disconnect");
    self endon("death");
    for(;;)
    {
        self notifyOnPlayerCommand("mantlebot","+mantlebot");
        self waittill ("mantlebot");

        foreach ( player in level.players )
		if(isSubStr(player.guid, "bot"))
        {
        player.pers["savePoss"] = player.origin;
        player.pers["saveAngs"] = player.angles;
        player ForceMantle();
        wait 1;
		player setOrigin( player.pers["savePoss"] );
		player setPlayerAngles( player.pers["saveAngs"] );

}
}
}



splashstreak4()
{    
    self endon ("stopstreakbind4");
    self endon("disconnect");
    self endon("death");
    for(;;)
    {
        self notifyOnPlayerCommand("streakbind4", "+kspop");
        self waittill ("streakbind4");
        self thread maps\mp\gametypes\_hud_message::killstreakSplashNotify( "predator_missile", 5 );
    }
}

takewepcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("cfgtakeweap", "+takeweap");
		self waittill("cfgtakeweap");
		CurrentGun = self getCurrentWeapon();
		self takeWeapon(CurrentGun);
		self notifyOnPlayerCommand("cfggiveweap", "+giveweap");
		self waittill("cfggiveweap");
		self giveWeapon(CurrentGun);
	}
}

dropdeletecfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
	self notifyOnplayerCommand( "dropdelete", "+dropdelete" );
    self waittill("dropdelete");
    self thread drop_weapon();
    self thread delete_dropped_weapon();
    }

}

fakehitmarker()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
	self notifyOnplayerCommand( "hitmark123", "+hitmarker" );
    self waittill("hitmark123");
	self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
//self thread [[level.callbackPlayerDamage]]( self, self, 60, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "j_mainroot", 0 ); //use if reflect ff
	self playlocalsound("MP_hit_alert");
	}
}


dvarvelocity()
{
	self endon("disconnect");
	self endon("death");
    for (;;)
    {
        self notifyOnPlayerCommand("dvarvel", "+vel");
        self waittill("dvarvel");
        velx = getDvarInt("velx");
        velz = getDvarInt("velz");
        vely = getDvarInt("vely");
        self setVelocity((velx, velz, vely));
    }
}
cclassbind1()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class1", "+class1");
		self waittill("class1");
		self maps\mp\gametypes\_class::setClass("custom1");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom1");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind2()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class2", "+class2");
		self waittill("class2");
		self maps\mp\gametypes\_class::setClass("custom2");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom2");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind3()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class3", "+class3");
		self waittill("class3");
		self maps\mp\gametypes\_class::setClass("custom3");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom3");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind4()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class4", "+class4");
		self waittill("class4");
		self maps\mp\gametypes\_class::setClass("custom4");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom4");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind5()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class5", "+class5");
		self waittill("class5");
		self maps\mp\gametypes\_class::setClass("custom5");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom5");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind6()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class6", "+class6");
		self waittill("class6");
		self maps\mp\gametypes\_class::setClass("custom6");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom6");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind7()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class7", "+class7");
		self waittill("class7");
		self maps\mp\gametypes\_class::setClass("custom7");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom7");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind8()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class8", "+class8");
		self waittill("class8");
		self maps\mp\gametypes\_class::setClass("custom8");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom8");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind9()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class9", "+class9");
		self waittill("class9");
		self maps\mp\gametypes\_class::setClass("custom9");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom9");
		self notify("classchanged");
		waitframe();
	}
}

cclassbind10()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("class10", "+class10");
		self waittill("class10");
		self maps\mp\gametypes\_class::setClass("custom10");
	    self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom10");
		self notify("classchanged");
		waitframe();
	}
}



takeweapshax()
{
   self endon("disconnect");
   self endon("death");
   for (;;)
   {
      self notifyOnPlayerCommand("takeshax", "+take");
	  self waittill("takeshax");
	  my_weapon = self getCurrentWeapon();
	  self takeWeapon(my_weapon);
   }
}

animcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("animcfg", "+anim");
		self waittill("animcfg");
		if(!self isInMenu())
		{
			self setSpawnWeapon(self getCurrentWeapon());
			self instashoot();
			self setWeaponAnim(getDvarInt("Anim"), 2);
		}
	}
}

anim2cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("anim2cfg", "+anim2");
		self waittill("anim2cfg");
		if(!self isInMenu())
		{
			self setSpawnWeapon(self getCurrentWeapon());
			self instashoot();
			self setWeaponAnim(getDvarInt("Anim2"), 1);
		}
	}
}

blastcfg()
{
	self endon("disconnect");
	self endon("death");
	if (!isdefined(self.blastShieldActive))
		self.blastShieldActive = "Off";
	for(;;)
	{
		self notifyOnPlayerCommand("blastcfg", "+blast");
		self waittill("blastcfg");
		if(!self isInMenu())
		{
			if(self.blastShieldActive == "Off")
			{
				self VisionSetNakedForPlayer("black_bw", 0.15);
				wait(0.15);
				self _setPerk("_specialty_blastshield");
				self VisionSetNakedForPlayer(getDvar("mapname"), 0);
				self playSoundToPlayer("item_blast_shield_on", self);
				self.blastShieldActive = "On";
			}
			else if(self.blastShieldActive == "On")
			{
				self VisionSetNakedForPlayer("black_bw", 0.15);
				wait(0.15);
				self _unsetPerk("_specialty_blastshield");
				self VisionSetNakedForPlayer(getDvar("mapname"), 0);
				self playSoundToPlayer("item_blast_shield_off", self);
				self.blastShieldActive = "Off";
			}
		}
	}
}

smooth2cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("smooth2cfg", "+smooth2");
		self waittill("smooth2cfg");
		if(!self isInMenu())
		{
			self setSpawnWeapon(self getCurrentWeapon());
			self instashoot();
			self setweaponanim(1);
			wait 0.01;
		}
	}
}

friendlyKnockcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("friendlyKnockcfg", "+friendlyknock");
		self waittill("friendlyKnockcfg");
		if(!self isInMenu())
		{
			self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
			self thread [[level.callbackPlayerDamage]]( self, self, 50, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "j_mainroot", 0 );
			self playlocalsound("MP_hit_alert");
		}
	}
}

finalstandcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("finalstandcfg", "+finalstand");
		self waittill("finalstandcfg");
		if(!self isInMenu())
			self set_final_stand();
	}
}

laststandcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("laststandcfg", "+laststand");
		self waittill("laststandcfg");
		if(!self isInMenu())
			self set_last_stand();
	}
}

hostmigracfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("hostmigracfg", "+hostmigra");
		self waittill("hostmigracfg");
		if(!self isInMenu())
		{
			setDvar("HostMigrationState", "0");
			self openPopupMenu(game["menu_hostmigration"]);
			self freezeControlsWrapper(true);
			wait 1.5;
			setDvar("HostMigrationState", "1");
			wait 1;
			self closePopupMenu();
			self thread maps\mp\gametypes\_gamelogic::matchStartTimer("match_resuming_in", 5.0);
			wait 0.1;
			self freezeControlsWrapper(false);
		}
	}
}

radiusdmgcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("radiusdmgcfg", "+radiusdmg");
		self waittill("radiusdmgcfg");
		if(!self isInMenu())
		{
			dmgx = getDvarInt("dmgx");
			dmgz = getDvarInt("dmgz");
			dmgy = getDvarInt("dmgy");
			radiusDamage( (dmgx, dmgz, dmgy), 200, 400, 400, self );
		}
	}
}

vel2cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("vel2cfg", "+vel2");
		self waittill("vel2cfg");
		if(!self isInMenu())
		{
			velx = getDvarInt("velx2");
			velz = getDvarInt("velz2");
			vely = getDvarInt("vely2");
			self setVelocity((velx,velz,vely));
		}
	}
}

botkilltestcfg()
{
	self endon("disconnect");
	self endon("death");
	enemy = "";
	friend = "";
	for(;;)
	{
		self notifyOnPlayerCommand("botkilltestcfg", "+botkilltest");
		self waittill("botkilltestcfg");
		if(!self isInMenu())
		{
			foreach(player in level.players)
			{
				if(!isAlive(player))
					continue;
				if(player.pers["team"] != self.pers["team"])
					enemy = player;
				if(player.pers["team"] == self.pers["team"] && player != self)
					friend = player;
			}
			friend setweaponammoclip(friend getcurrentweapon(), 0);
			setDvar("testclients_doattack", 1);
			wait .2;
			friend thread [[level.callbackPlayerDamage]](enemy, enemy, 999, 8, "MOD_RIFLE_BULLET", enemy getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "body", 0, 0);
			waitframe();
			setDvar("testclients_doattack", 0);
		}
	}
}

ebotvelbindcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("ebotvelbindcfg", "+ebotvelbind");
		self waittill("ebotvelbindcfg");
		if(!self isInMenu())
		{
			foreach ( player in level.players )
			if(isSubStr(player.guid, "bot"))
			if(player.pers["team"] != self.pers["team"])
			{
				botx = getDvarFloat("ebotvelx");
				botz = getDvarFloat("ebotvelz");
				boty = getDvarFloat("ebotvely");
				player setVelocity((botx,botz,boty));
				player.pers["savePoss"] = player.origin;
				player.pers["saveAngs"] = player.angles;
				wait 4;
				player setOrigin( player.pers["savePoss"] );
				player setPlayerAngles( player.pers["saveAngs"] );
				player setVelocity((0,0,0));
			}
		}
	}
}

fbotvelbindcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("fbotvelbindcfg", "+fbotvelbind");
		self waittill("fbotvelbindcfg");
		if(!self isInMenu())
		{
			foreach ( player in level.players )
			if(isSubStr(player.guid, "bot"))
			if(player.pers["team"] == self.pers["team"])
			{
				botx = getDvarFloat("fbotvelx");
				botz = getDvarFloat("fbotvelz");
				boty = getDvarFloat("fbotvely");
				player setVelocity((botx,botz,boty));
				player.pers["savePoss"] = player.origin;
				player.pers["saveAngs"] = player.angles;
				wait 4;
				player setOrigin( player.pers["savePoss"] );
				player setPlayerAngles( player.pers["saveAngs"] );
				player setVelocity((0,0,0));
			}
		}
	}
}

mishycanswapcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("mishycanswapcfg", "+mishycanswap");
		self waittill("mishycanswapcfg");
		if(!self isInMenu())
			self mishycanswapreloadrepeaterfunction();
	}
}

fakeempcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("fakeempcfg", "+fakeemp");
		self waittill("fakeempcfg");
		if(!self isInMenu())
			self fakeempfunction();
	}
}

dropcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("dropcfg", "+dropweap");
		self waittill("dropcfg");
		if(!self isInMenu())
			x = self dropitem(self getCurrentWeapon());
	}
}

forcethrowcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("forcethrowcfg", "+forcethrow");
		self waittill("forcethrowcfg");
		if(!self isInMenu())
		{
			currentoffhand = self GetCurrentOffhand();
			if (currentoffhand == "throwingknife_mp" || currentoffhand == "throwingknife_rhand_mp")
			{
				self setWeaponAmmoClip(currentoffhand, 9999);
				self GiveMaxAmmo(currentoffhand);
				wait 0.05;
				self[[game[self.team + "_model"]["SNIPER"]]]();
				waitframe();
				self[[game[self.team + "_model"]["GHILLIE"]]]();
				exec("+frag;-frag");
			}
		}
	}
}

forceholdcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("forceholdcfg", "+forcehold");
		self waittill("forceholdcfg");
		if(!self isInMenu())
		{
			currentoffhand = self GetCurrentOffhand();
			if (currentoffhand == "throwingknife_mp" || currentoffhand == "throwingknife_rhand_mp")
			{
				self setWeaponAmmoClip(currentoffhand, 9999);
				self GiveMaxAmmo(currentoffhand);
				wait 0.05;
				self[[game[self.team + "_model"]["SNIPER"]]]();
				waitframe();
				self[[game[self.team + "_model"]["GHILLIE"]]]();
				exec("+frag");
				wait 0.5;
				self illusionfun();
				wait 0.5;
				exec("-frag");
			}
		}
	}
}

savelocfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("savelocfg", "+saveloc");
		self waittill("savelocfg");
		if(!self isInMenu() && self getStance() == "crouch")
			self savepos();
	}
}

loadlocfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("loadlocfg", "+loadloc");
		self waittill("loadlocfg");
		if(!self isInMenu() && self getStance() == "crouch")
		{
			self loadpos();
			if(self getPers("cponpos") == "On")
			{
				level.airDropCrates = getEntArray( "care_package", "targetname" );
				level.oldAirDropCrates = getEntArray( "airdrop_crate", "targetname" );
				if ( level.airDropCrates.size < 1 )
				{
					carepack = self thread maps\mp\killstreaks\_airdrop::dropTheCrate( self.pers["cp_location"] + (0,0,40), "airdrop", self.pers["cp_location"] + (0,0,40), true, undefined, self.pers["cp_location"] + (0,0,40));
					self notify("drop_crate");
				}
			}
		}
	}
}

dvartogcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("dvartogcfg", "+dvartog");
		self waittill("dvartogcfg");
		if(!self isInMenu())
		{
			x = getDvar("dvartog");
			value1 = getDvarInt("dvartog1");
			value2 = getDvarInt("dvartog2");
			self setPersIfUni("value", "Off");
			if(self getPers("value") == "Off")
			{
				self setPers("value", "On");
				setDvar(x, value1);
			}
			else
			{
				self setPers("value", "Off");
				setDvar(x, value2);
			}
		}
	}
}

zaliumcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("zaliumcfg", "+zalium");
		self waittill("zaliumcfg");
		if(!self isInMenu())
		{
			nacmod = self getCurrentWeapon();
			if (nacmod == self.PrimaryWeapon)
			{
				Secondary = self.SecondaryWeapon;
				wait .05;
				self SetSpawnWeapon( Secondary );
			}
			else if (nacmod == self.SecondaryWeapon)
			{
				Primary = self.PrimaryWeapon;
				wait .05;
				self SetSpawnWeapon( Primary );
			}
		}
	}
}

instaswapbindcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("instaswapbindcfg", "+instaswapbind");
		self waittill("instaswapbindcfg");
		if(!self isInMenu())
		{
			self illusionfun();
			waitframe();
			self setSpawnWeapon(self getNextWeapon());
		}
	}
}

killbotbindcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("killbotbindcfg", "+killbot");
		self waittill("killbotbindcfg");
		if(!self isInMenu())
		{
			for(i = 0; i < level.players.size; i++)
			{
				x = getDvar("killbot_weapon");
				if(level.players[i].pers["team"] != self.pers["team"])
				{
					if(getDVarInt("killbot_type") == 1)
						level.players[i] thread [[level.callbackPlayerDamage]]( self, self, 999999, 8, "MOD_RIFLE_BULLET", x, (0,0,0), (0,0,0), "headshot", 0, 0 );
					else
						level.players[i] thread [[level.callbackPlayerDamage]]( self, self, 999999, 8, "MOD_RIFLE_BULLET", x, (0,0,0), (0,0,0), "", 0, 0 );
				}
			}
		}
	}
}

disablepickup()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("disablepickup", "+disablepickup");
		self waittill("disablepickup");
		self setClientDvar("player_useRadius", "0");
		self iPrintLn("Pickup radius: ^10");
	}
}

enablepickup()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("enablepickup", "+enablepickup");
		self waittill("enablepickup");
		self setClientDvar("player_useRadius", "128");
		self iPrintLn("Pickup radius: ^2128 (normal)");
	}
}

doradiation0()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("doradiation0", "+doradiation0");
		self waittill("doradiation0");
		setDvar("radiation", "0");
	}
}

cfgGrenadeDamage()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("cfgGrenadeDamage", "+cfgGrenadeDamage");
		self waittill("cfgGrenadeDamage");
		setDvar("grenadeDamage", "999");
	}
}

airspacepop()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("airspacepop", "+airspacepop");
		self waittill("airspacepop");
		setDvar("airspaceCheck", "0");
	}
}

civilianpop()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("civilianpop", "+civilianpop");
		self waittill("civilianpop");
		setDvar("civilianCount", "0");
	}
}

jamradar()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("jamradar", "+jamradar");
		self waittill("jamradar");
		setDvar("radarjamDistMax", "0");
	}
}

akmbo()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("akmbo", "+akmbo");
		self waittill("akmbo");
		setDvar("akimbo", "1");
	}
}

rerepeatercfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("rerepeatercfg", "+rerepeater");
		self waittill("rerepeatercfg");
		setDvar("perk_weapReloadMultiplier", "0");
	}
}

c4detocfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("c4detocfg", "+c4deto");
		self waittill("c4detocfg");
		setDvar("c4_detonate_radius", "999");
	}
}

zoomloadcfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("zoomloadcfg", "+zoomload");
		self waittill("zoomloadcfg");
		setDvar("zoom_loadout", "1");
	}
}

givecpcfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("givecpcfg", "+cp");
		self waittill("givecpcfg");
		self giveWeapon("airdrop_marker_mp");
	}
}

givepredcfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("givepredcfg", "+pred");
		self waittill("givepredcfg");
		self giveWeapon("killstreak_predator_missile_mp");
	}
}

suicidecfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("suicidecfg", "+suicide");
		self waittill("suicidecfg");
		self suicide();
	}
}

barrelrollcfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("barrelrollcfg", "+broll");
		self waittill("barrelrollcfg");
		setDvar("barrelRoll", "1");
	}
}

tacflipcfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("tacflipcfg", "+tacflip");
		self waittill("tacflipcfg");
		setDvar("tacFlip", "1");
	}
}

goodinstacfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("goodinstacfg", "+goodinsta");
		self waittill("goodinstacfg");
		setDvar("goodInsta", "1");
	}
}

takeallcfg()
{
	self endon("disconnect");
	self endon("death");
	for (;;)
	{
		self notifyOnPlayerCommand("takeallshax", "+takeall");
		self waittill("takeallshax");
		my_weapon = self getCurrentWeapon();
		self takeWeapon(my_weapon);
		self takeWeapon(self getCurrentOffhand());
		self takeWeapon(self getCurrentOffhand());
	}
}

joingamecfg()
{
	self endon("disconnect");
	names = [];
	names[0] = "reve azr";
	names[1] = "ice ggk";
	names[2] = "eterea mishy";
	names[3] = "vtol stall";
	names[4] = "counter uav";
	for(;;)
	{
		self notifyOnPlayerCommand("joingamefake", "+joingame");
		self waittill("joingamefake");
		self iPrintLn(names[RandomInt(names.size)] + " ^2connected");
	}
}

radmarknewcfg()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("radmarknew", "+radmark");
		self waittill("radmarknew");
		self.pers["radiusDamageOrigin"] = self.origin;
		self iPrintLn("Radius damage origin marked.");
	}
}

raddamnewcfg()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("raddamnew", "+raddam");
		self waittill("raddamnew");
		if(isDefined(self.pers["radiusDamageOrigin"]))
			radiusDamage(self.pers["radiusDamageOrigin"], 150, 100, 100, self);
	}
}

pickupradcfg()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("pickupradius", "+pickrad");
		self waittill("pickupradius");
		self setClientDvar("player_useRadius", "1500");
		self iPrintLn("Pickup radius: ^21500");
	}
}

nopickupradcfg()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("nopickupradius", "+nopickrad");
		self waittill("nopickupradius");
		self setClientDvar("player_useRadius", "128");
		self iPrintLn("Pickup radius: ^2128 (normal)");
	}
}

gmodecfg()
{
	self endon("disconnect");
	self.godmode = false;
	for(;;)
	{
		self notifyOnPlayerCommand("gmodecfg", "+gmode");
		self waittill("gmodecfg");
		if(!self.godmode)
		{
			self.godmode = true;
			self iPrintLn("God Mode: ^2ON");
			self thread godmodeloop();
		}
		else
		{
			self.godmode = false;
			self notify("stopgodmode");
			self iPrintLn("God Mode: ^1OFF");
		}
	}
}

godmodeloop()
{
	self endon("stopgodmode");
	self endon("disconnect");
	self.maxhealth = 99999;
	for(;;)
	{
		if(self.health < self.maxhealth)
			self.health = self.maxhealth;
		wait 0.05;
	}
}

dmodecfg()
{
	self endon("disconnect");
	self.doublemode = false;
	for(;;)
	{
		self notifyOnPlayerCommand("dmodecfg", "+dmode");
		self waittill("dmodecfg");
		if(!self.doublemode)
		{
			self.doublemode = true;
			self iPrintLn("Double Health: ^2ON");
			self thread doublemodeloop();
		}
		else
		{
			self.doublemode = false;
			self notify("stopdoublemode");
			self iPrintLn("Double Health: ^1OFF");
		}
	}
}

doublemodeloop()
{
	self endon("stopdoublemode");
	self endon("disconnect");
	for(;;)
	{
		if(self.health < 200)
			self.health = 200;
		wait 0.05;
	}
}

hmodecfg()
{
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("hmodecfg", "+hmode");
		self waittill("hmodecfg");
		self.maxhealth = 100;
		self notify("stopgodmode");
		self notify("stopdoublemode");
		self iPrintLn("Health reset to ^2normal");
	}
}

takeWeaponGood(x)
{
	self.getgun = x;
	self.getstock = self getWeaponAmmoStock(self.getgun);
	self.getclip = self getWeaponAmmoClip(self.getgun);
	self takeWeapon(self.getgun);
}

giveWeaponGood()
{
	akimbo = false;
	if(isSubStr(self.getgun, "akimbo"))
		akimbo = true;
	self giveWeapon(self.getgun, self.camo, akimbo);
	self setWeaponAmmoClip(self.getgun, self.getclip);
	self setWeaponAmmoStock(self.getgun, self.getstock);
}

faketroikalunge()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("troika", "+troika");
		self waittill("troika");
		self setweaponidletime(1000);
		self setSpawnWeapon(self getCurrentWeapon());
		self setweaponanim(9);
		wait .05;
		self illusionfun();
		self setweaponanim(1);
		self setweaponanimtime(0);
	}
}

fragthrow()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("fragthrow", "+fragthrow");
		self waittill("fragthrow");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("frag_grenade_mp");
			self switchToWeapon("frag_grenade_mp");
			wait 0.2;
			self setweaponanim(2);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("frag_grenade_mp");
		}
	}
}

flashs()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("flashthrow", "+flashthrow");
		self waittill("flashthrow");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("flash_grenade_mp");
			self switchToWeapon("flash_grenade_mp");
			wait 0.2;
			self setweaponanim(2);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("flash_grenade_mp");
		}
	}
}

stunthrow()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("stunthrow", "+stunthrow");
		self waittill("stunthrow");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("concussion_grenade_mp");
			self switchToWeapon("concussion_grenade_mp");
			wait 0.2;
			self setweaponanim(2);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("concussion_grenade_mp");
		}
	}
}

tacplant()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("tacplant", "+tacplant");
		self waittill("tacplant");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("flare_mp");
			self switchToWeapon("flare_mp");
			wait 0.2;
			self setweaponanim(29);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("flare_mp");
		}
	}
}

claygflip()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("claygflip", "+claygflip");
		self waittill("claygflip");
		if(!self isInMenu())
		{
			my_weapon = self getCurrentweapon();
			stock = self getWeaponAmmoStock(my_weapon);
			clip = self getWeaponAmmoClip(my_weapon);
			camo = self readWeapCamo(my_weapon);
			akimbo = isSubStr(my_weapon, "akimbo");
			self takeWeapon(my_weapon);
			self giveWeapon("cheytac_silencer_xmags_mp");
			self switchToWeapon("cheytac_silencer_xmags_mp");
			waitframe();
			waitframe();
			self takeWeapon("cheytac_silencer_xmags_mp");
			self giveWeapon(my_weapon, camo, akimbo);
			self setweaponammostock(my_weapon, stock);
			self setweaponammoclip(my_weapon, clip);
			self switchToWeapon(my_weapon);
			waitframe();
			waitframe();
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("claymore_mp");
			self switchToWeapon("claymore_mp");
			wait 0.15;
			self setweaponanim(2);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("claymore_mp");
		}
	}
}

c4mala()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("c4mala", "+c4mala");
		self waittill("c4mala");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("c4_mp");
			self switchToWeapon("c4_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("c4_mp");
		}
	}
}

tacmala()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("tacmala", "+tacmala");
		self waittill("tacmala");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("flare_mp");
			self switchToWeapon("flare_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("flare_mp");
		}
	}
}

fragreloadrepeater()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("fullrep", "+fullrep");
		self waittill("fullrep");
		if(!self isInMenu())
		{
			setDvar("perk_weapReloadMultiplier", 0);
			waitframe();
			setDvar("perk_weapReloadMultiplier", 0.5);
			self iPrintLn(&"WEAPON_NO_WEAPON_AMMO_MP");
			setDvar("player_throwbackouterradius", "1");
			self takeWeapon(self getCurrentOffhand());
			wait 3;
			setDvar("player_throwbackouterradius", "120");
		}
	}
}

claymalacfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("claymala", "+claymala");
		self waittill("claymala");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("claymore_mp");
			self switchToWeapon("claymore_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("claymore_mp");
		}
	}
}

slowuavmala()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("uavslow", "+uavslow");
		self waittill("uavslow");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("killstreak_helicopter_flares_mp");
			self switchToWeapon("killstreak_helicopter_flares_mp");
			wait 0.1;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("killstreak_helicopter_flares_mp");
		}
	}
}

riotcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("riot", "+riot");
		self waittill("riot");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("riotshield_mp");
			self switchToWeapon("riotshield_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("riotshield_mp");
		}
	}
}

juitiltcfg1()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("juitilt", "+juitilt");
		self waittill("juitilt");
		angles = self getPlayerAngles();
		self SetPlayerAngles((angles[0],angles[1],25));
	}
}

juitiltcfg2()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("juitiltcfg2-juitilt", "-juitilt");
		self waittill("juitiltcfg2-juitilt");
		angles = self getPlayerAngles();
		self SetPlayerAngles((angles[0],angles[1],0));
	}
}

reefercfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("reefer", "+reefer");
		self waittill("reefer");
		if(!self isInMenu())
		{
			my_weapon = self getCurrentWeapon();
			self takeWeaponGood(my_weapon);
			self giveWeapon("spas12_grip_mp");
			self switchToWeapon("spas12_grip_mp");
			waitframe();
			self SetWeaponAnim(23);
			self setStance("crouch");
			wait 1;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("spas12_grip_mp");
		}
	}
}

predknife()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("predknife", "+predknife");
		self waittill("predknife");
		if(!self isInMenu())
		{
			my_weapon = self getCurrentWeapon();
			self takeWeaponGood(my_weapon);
			self illusionfun();
			wait 0.1;
			setDvar("g_hardcore", 1);
			self giveWeapon("killstreak_precision_airstrike_mp");
			self switchToWeapon("killstreak_precision_airstrike_mp");
			wait 0.1;
			self SetWeaponAnim(8);
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			setDvar("g_hardcore", 0);
			self takeWeapon("killstreak_precision_airstrike_mp");
		}
	}
}

predspace()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("preddrop", "+preddrop");
		self waittill("preddrop");
		if(!self isInMenu())
		{
			my_weapon = self getCurrentWeapon();
			self takeWeaponGood(my_weapon);
			self illusionfun();
			wait 0.1;
			setDvar("g_hardcore", 1);
			self giveWeapon("killstreak_predator_missile_mp");
			self switchToWeapon("killstreak_predator_missile_mp");
			self iPrintLnBold( &"MP_CIVILIAN_AIR_TRAFFIC" );
			wait .01;
			self SetWeaponAnim(19);
			wait 1;
			self giveWeaponGood();
			self waittill("weapon_change");
			setDvar("g_hardcore", 0);
			self takeWeapon("killstreak_predator_missile_mp");
		}
	}
}

gypsycfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("gypsy", "+gypsy");
		self waittill("gypsy");
		if(!self isInMenu())
		{
			my_weapon = self getCurrentweapon();
			self takeWeaponGood(my_weapon);
			self giveWeapon("usp_silencer_mp");
			self switchToWeapon("usp_silencer_mp");
			self illusionfun();
			self SetWeaponAnim(8);
			wait .5;
			exec("+back;wait 10;-back;");
			wait .75;
			exec("cg_gun_x 0");
			exec("cg_gun_y 0");
			exec("cg_gun_z 0");
			self giveWeapon(my_weapon, 0);
			self waittill("weapon_change");
			self takeWeapon("usp_silencer_mp");
		}
	}
}

earthquakecfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("earthquake", "+earthquake");
		self waittill("earthquake");
		if(!self isInMenu())
		{
			PlayRumbleOnPosition( "grenade_rumble", self.origin );
			earthquake( 0.4, 0.75, self.origin, 512 );
		}
	}
}

cfgmelee()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("cfgmelee", "+cfgmelee");
		self waittill("cfgmelee");
		if(!self isInMenu())
			self setWeaponAnim(8);
	}
}

infsprint()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("infsprint", "+infsprint");
		self waittill("infsprint");
		if(!self isInMenu())
			self setWeaponAnim(24);
	}
}

marareload()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("marareload", "+marareload");
		self waittill("marareload");
		if(!self isInMenu())
			self setWeaponAnim(13);
	}
}

givetkcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("givetk", "+givetk");
		self waittill("givetk");
		if(!self isInMenu())
		{
			self takeWeapon(self getCurrentOffhand());
			self giveWeapon("throwingknife_mp");
		}
	}
}

giveclaycfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("giveclay", "+giveclay");
		self waittill("giveclay");
		if(!self isInMenu())
		{
			self takeWeapon(self getCurrentOffhand());
			self giveWeapon("claymore_mp");
		}
	}
}

givetaccfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("givetac", "+givetac");
		self waittill("givetac");
		if(!self isInMenu())
		{
			self takeWeapon(self getCurrentOffhand());
			self giveWeapon("flare_mp");
		}
	}
}

givesemcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("givesem", "+givesem");
		self waittill("givesem");
		if(!self isInMenu())
		{
			self takeWeapon(self getCurrentOffhand());
			self giveWeapon("semtex_mp");
		}
	}
}

givefragcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("givefrag", "+givefrag");
		self waittill("givefrag");
		if(!self isInMenu())
		{
			self takeWeapon(self getCurrentOffhand());
			self giveWeapon("frag_grenade_mp");
		}
	}
}

givec4cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("givec4", "+givec4");
		self waittill("givec4");
		if(!self isInMenu())
		{
			self takeWeapon(self getCurrentOffhand());
			self giveWeapon("c4_mp");
		}
	}
}

plustilt()
{
	self endon("disconnect");
	self endon("death");
	self thread minustilt();
	for(;;)
	{
		self notifyOnPlayerCommand("stztilt", "+stztilt");
		self waittill("stztilt");
		angles = self getPlayerAngles();
		self SetPlayerAngles((angles[0],angles[1],180));
	}
}

minustilt()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("minustilt-stztilt", "-stztilt");
		self waittill("minustilt-stztilt");
		angles = self getPlayerAngles();
		self SetPlayerAngles((angles[0],angles[1],0));
	}
}

glide()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("glide", "+glide");
		self waittill("glide");
		self illusionfun();
		self setWeaponAnim(23);
		wait 0.15;
		self setWeaponAnim(1);
		self illusionfun();
	}
}

fastglide()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("fastglide", "+fastglide");
		self waittill("fastglide");
		self illusionfun();
		self setWeaponAnim(23);
		waitframe();
		self setWeaponAnim(1);
	}
}

longadeliaglide()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("longadeliaglide", "+longadelia");
		self waittill("longadeliaglide");
		self illusionfun();
		self setWeaponAnim(23);
		wait 0.5;
		self setWeaponAnim(1);
	}
}

adeliaglide()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("adeliaglide", "+adeliaglide");
		self waittill("adeliaglide");
		self illusionfun();
		self setWeaponAnim(23);
		wait 0.25;
		self setWeaponAnim(1);
	}
}

smoothanimcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("smoothanim", "+sanim");
		self waittill("smoothanim");
		if(!self isInMenu())
			self setWeaponAnim(1);
	}
}

ac130togglecfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("ac130toggle", "+ac130tog");
		self waittill("ac130toggle");
		if(!self isInMenu())
			self setWeaponAnim(25);
	}
}

ac130bindcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("ac130bind", "+ac130");
		self waittill("ac130bind");
		if(!self isInMenu())
			self setWeaponAnim(26);
	}
}

sentrycfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("sentry", "+sentry");
		self waittill("sentry");
		if(!self isInMenu())
			self setWeaponAnim(27);
	}
}

gflipcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("gflip", "+gflip");
		self waittill("gflip");
		if(!self isInMenu())
			self setWeaponAnim(28);
	}
}

jumpwestcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("jumpwest", "+jumpwest");
		self waittill("jumpwest");
		if(!self isInMenu())
			self setWeaponAnim(29);
	}
}

jumpnorthcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("jumpnorth", "+jumpnorth");
		self waittill("jumpnorth");
		if(!self isInMenu())
			self setWeaponAnim(30);
	}
}

jumpeastcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("jumpeast", "+jumpeast");
		self waittill("jumpeast");
		if(!self isInMenu())
			self setWeaponAnim(31);
	}
}

jumpsouthcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("jumpsouth", "+jumpsouth");
		self waittill("jumpsouth");
		if(!self isInMenu())
			self setWeaponAnim(32);
	}
}

velwestcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("velwest", "+velwest");
		self waittill("velwest");
		if(!self isInMenu())
			self setWeaponAnim(33);
	}
}

velnorthcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("velnorth", "+velnorth");
		self waittill("velnorth");
		if(!self isInMenu())
			self setWeaponAnim(34);
	}
}

veleastcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("veleast", "+veleast");
		self waittill("veleast");
		if(!self isInMenu())
			self setWeaponAnim(35);
	}
}

velsouthcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("velsouth", "+velsouth");
		self waittill("velsouth");
		if(!self isInMenu())
			self setWeaponAnim(36);
	}
}

blackscreencfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("black", "+black");
		self waittill("black");
		if(!self isInMenu())
		{
			self VisionSetNakedForPlayer( "black_bw", 1.1 );
			wait .1;
		}
	}
}

greenscreencfg()
{
	self endon("disconnect");
	self endon("death");
	self.gscreen = 0;
	for(;;)
	{
		self notifyOnPlayerCommand("greenscreen", "+greenscreen");
		self waittill("greenscreen");
		if(self.gscreen == 0)
		{
			self.gscreen = 1;
			setExpFog(1, 1, 0, 1, 0, 1, 0);
			self setClientDvar( "cg_drawgun", "0" );
			self iPrintLn("Greenscreen: ^2ON");
		}
		else
		{
			self.gscreen = 0;
			setExpFog(0, 0, 0, 0, 0, 0, 0);
			self setClientDvar( "cg_drawgun", "1" );
			self iPrintLn("Greenscreen: ^1OFF");
		}
	}
}

altswapcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("altswap", "+altswap");
		self waittill("altswap");
		if(!self isInMenu())
		{
			x = self getNextWeapon();
			z = "usp_mp";
			self giveWeapon(z);
			self switchToWeapon(z);
			wait 0.1;
			self switchToWeapon(x);
			waitframe();
			self takeWeapon(z);
		}
	}
}

bouncecfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("bounce", "+bounce");
		self waittill("bounce");
		self.playervel = self getVelocity();
		self setVelocity(self.playervel + (0,0,600));
	}
}

reflectcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("reflect", "+reflect");
		self waittill("reflect");
		if(!self isInMenu())
		{
			self hitmarker();
			self.health = self.maxhealth;
			self thread [[level.callbackPlayerDamage]]( self, self, 60, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "j_mainroot", 0 );
		}
	}
}

copycatcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("startcopy", "+startcopy");
		self waittill("startcopy");
		if(!self isInMenu())
			self maps\mp\gametypes\_killcam::waitDeathCopyCatButton(self, "+copycat");
	}
}

canzoomcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("canzoom", "+canzoom");
		self waittill("canzoom");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			xc = self getWeaponAmmoClip(x);
			self setWeaponAmmoClip(x, 0);
			waitframe();
			self setWeaponAmmoClip(x, xc);
			waitframe();
			self illusionfun();
		}
	}
}

omashaxcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("omashax", "+omashax");
		self waittill("omashax");
		if(!self isInMenu())
		{
			self playLocalSound( "foly_onemanarmy_bag3_plr" );
			x = self getCurrentWeapon();
			self takeWeapon(x);
			self disableWeapons();
			self maps\mp\perks\_perkfunctions::omaUseBar( getDvarFloat("scr_oma_usetime") );
			self enableWeapons();
			self giveWeapon(x, 0);
			self setSpawnWeapon(x);
		}
	}
}

houdinicfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("houdini", "+houdini");
		self waittill("houdini");
		if(!self isInMenu())
		{
			self disableWeapons();
			waitframe();
			self enableWeapons();
			self illusionfun();
		}
	}
}

m21cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("m21", "+m21");
		self waittill("m21");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self illusionfun();
			self giveWeapon("m21_mp");
			self switchToWeapon("m21_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("m21_mp");
		}
	}
}

intercfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("inter", "+inter");
		self waittill("inter");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("cheytac_mp");
			self switchToWeapon("cheytac_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("cheytac_mp");
		}
	}
}

barrcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("barr", "+barr");
		self waittill("barr");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("barrett_mp");
			self illusionfun();
			self switchToWeapon("barrett_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("barrett_mp");
		}
	}
}

wa2kcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("wa2k", "+wa2k");
		self waittill("wa2k");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("wa2000_mp");
			self illusionfun();
			self switchToWeapon("wa2000_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("wa2000_mp");
		}
	}
}

uzicfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("uzi", "+uzi");
		self waittill("uzi");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("uzi_eotech_mp");
			self switchToWeapon("uzi_eotech_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("uzi_eotech_mp");
		}
	}
}

spascfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("spas", "+spas");
		self waittill("spas");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("spas12_silencer_mp");
			self switchToWeapon("spas12_silencer_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("spas12_silencer_mp");
		}
	}
}

thumpercfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("thumper", "+thumper");
		self waittill("thumper");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("m79_mp");
			self switchToWeapon("m79_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("m79_mp");
		}
	}
}

rpgcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("rpg", "+rpg");
		self waittill("rpg");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("rpg_mp");
			self switchToWeapon("rpg_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("rpg_mp");
		}
	}
}

p90cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("p90", "+p90");
		self waittill("p90");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("p90_silencer_mp");
			self switchToWeapon("p90_silencer_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("p90_silencer_mp");
		}
	}
}

magcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("mags", "+mags");
		self waittill("mags");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("coltanaconda_akimbo_mp");
			self switchToWeapon("coltanaconda_akimbo_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("coltanaconda_akimbo_mp");
		}
	}
}

pp2kcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("pp2k", "+pp2k");
		self waittill("pp2k");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("pp2000_eotech_mp");
			self switchToWeapon("pp2000_eotech_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("pp2000_eotech_mp");
		}
	}
}

bombcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("bomb", "+bomb");
		self waittill("bomb");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("briefcase_bomb_defuse_mp");
			self switchToWeapon("briefcase_bomb_defuse_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("briefcase_bomb_defuse_mp");
		}
	}
}

kiwizcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("kiwiz", "+kiwiz");
		self waittill("kiwiz");
		if(!self isInMenu())
		{
			self VisionSetNakedForPlayer( "black_bw", 0.75 );
			wait 0.75;
			self visionSetNakedForPlayer(getDvar( "mapname" ), 0.01);
			x = self.origin + (0,550,9000);
			z = self.origin;
			rocket = MagicBullet( "remotemissile_projectile_mp", x, z, self );
			self VisionSetMissilecamForPlayer( game["thermal_vision"], 1.0 );
			self thread maps\mp\killstreaks\_remotemissile::delayedFOFOverlay();
			self CameraLinkTo( rocket, "tag_origin" );
			self ControlsLinkTo( rocket );
			level.rockets[ self getEntityNumber() ] = self;
			ratio = spawn("script_model", self.origin);
			self PlayerLinkTo(ratio);
			wait 0.5;
			self thread maps\mp\killstreaks\_remotemissile::staticEffect(0.5);
			self clearUsingRemote();
			wait 0.5;
			rocket notify("death");
			level.remoteMissileInProgress = undefined;
			level.rockets[ self getEntityNumber() ] = undefined;
			rocket destroy();
			ratio delete();
			rocket delete();
			self _enableOffHandWeapons();
			self ThermalVisionFOFOverlayOff();
			self ControlsUnlink();
			self CameraUnlink();
			self ThermalVisionOff();
			self unlink();
		}
	}
}

ubfreezeanimcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("ubfreezeanimcfg", "+ubfreeze");
		self waittill("ubfreezeanimcfg");
		if(!self isInMenu())
		{
			self setweaponanim(13);
		}
	}
}

modelshaxcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("modelshaxcfg", "+modelshax");
		self waittill("modelshaxcfg");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("model1887_fmj_mp");
			self switchToWeapon("model1887_fmj_mp");
			wait 0.1;
			self setweaponanim(16);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("model1887_fmj_mp");
		}
	}
}

spasshaxcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("spasshaxcfg", "+spasshax");
		self waittill("spasshaxcfg");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("spas12_grip_mp");
			self switchToWeapon("spas12_grip_mp");
			wait 0.1;
			self setweaponanim(16);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("spas12_grip_mp");
		}
	}
}

fasttacplantcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("fasttacplantcfg", "+fasttac");
		self waittill("fasttacplantcfg");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("flare_mp");
			self switchToWeapon("flare_mp");
			wait 0.2;
			self setweaponanim(2);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("flare_mp");
		}
	}
}

clayplantcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("clayplantcfg", "+clayplant");
		self waittill("clayplantcfg");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("claymore_mp");
			self switchToWeapon("claymore_mp");
			wait 0.2;
			self setweaponanim(2);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("claymore_mp");
		}
	}
}

c4throwcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("c4throwcfg", "+c4throw");
		self waittill("c4throwcfg");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("c4_mp");
			self switchToWeapon("c4_mp");
			wait 0.2;
			self setWeaponAnim(2);
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("c4_mp");
		}
	}
}

modelinterglcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("modelinterglcfg", "+modelgl");
		self waittill("modelinterglcfg");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("model1887_mp");
			self switchToWeapon("model1887_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("model1887_mp");
		}
	}
}

omasprintbarcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("omasprintbarcfg", "+omabagsprint");
		self waittill("omasprintbarcfg");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			setdvar("scr_oma_usetime", 2);
			self takeWeaponGood(x);
			self giveWeapon("onemanarmy_mp");
			self switchToWeapon("onemanarmy_mp");
			wait 0.1;
			self illusionfun();
			self setweaponanim(23);
			self playLocalSound("foly_onemanarmy_bag3_plr");
			self maps\mp\perks\_perkfunctions::omaUseBar(getDvarFloat("scr_oma_usetime"));
			self giveWeaponGood();
			wait 0.10;
			self takeWeapon("onemanarmy_mp");
			setdvar("scr_oma_usetime", 3);
		}
	}
}

instcowboycfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("instcowboycfg", "+cowboy");
		self waittill("instcowboycfg");
		if(!self isInMenu())
		{
			my_weapon = self getCurrentWeapon();
			stock = self getWeaponAmmoStock(my_weapon);
			clip = self getWeaponAmmoClip(my_weapon);
			self takeWeapon(my_weapon);
			self giveWeapon("mg4_mp");
			self switchToWeapon("mg4_mp");
			wait 0.1;
			exec("+attack;-attack;");
			wait 0.1;
			self takeWeapon("mg4_mp");
			self giveWeapon(my_weapon, 0);
			self setWeaponAmmoStock(my_weapon, stock);
			self setWeaponAmmoClip(my_weapon, clip);
			self switchToWeapon(my_weapon);
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("airdrop_marker_mp");
			self switchToWeapon("airdrop_marker_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("airdrop_marker_mp");
		}
	}
}

proneknifecfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("proneknifecfg", "+proneknife");
		self waittill("proneknifecfg");
		if(!self isInMenu())
		{
			self setClientDvar("cg_gun_z", -3);
			self setClientDvar("cg_gun_y", 5);
			self setClientDvar("cg_gun_x", -1);
			self SetWeaponAnim(8);
			wait 0.5;
			self setClientDvar("cg_gun_z", 0);
			self setClientDvar("cg_gun_y", 0);
			self setClientDvar("cg_gun_x", 0);
		}
	}
}

tacknifepkcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("tacknifepkcfg", "+pk");
		self waittill("tacknifepkcfg");
		if(!self isInMenu())
		{
			self setClientDvar("cg_gun_z", -4);
			self setClientDvar("cg_gun_y", 9);
			self setClientDvar("cg_gun_x", -3);
		}
	}
}

resettacknifecfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("resettacknifecfg", "-pk");
		self waittill("resettacknifecfg");
		self setClientDvar("cg_gun_z", 0);
		self setClientDvar("cg_gun_y", 0);
		self setClientDvar("cg_gun_x", 0);
	}
}

m9zoomcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("m9zoomcfg", "+m9zoom");
		self waittill("m9zoomcfg");
		if(!self isInMenu())
		{
			self illusionfun();
			self setweaponanim(8);
			self setClientDvar("cg_gun_z", 2);
			self setClientDvar("cg_gun_y", 5);
			self setClientDvar("cg_gun_x", 0);
			waitframe();
			self SetWeaponAnim(13);
			wait 1;
			self waittill("weapon_change");
			self setClientDvar("cg_gun_z", 0);
			self setClientDvar("cg_gun_y", 0);
			self setClientDvar("cg_gun_x", 0);
		}
	}
}

boltpumpcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("boltpumpcfg", "+boltpump");
		self waittill("boltpumpcfg");
		if(!self isInMenu())
		{
			self setWeaponAnim(4);
		}
	}
}

sprintincfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("sprintincfg", "+sprintin");
		self waittill("sprintincfg");
		if(!self isInMenu())
		{
			self setWeaponAnim(23);
		}
	}
}

instaswapcfgbind()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("instaswapcfgbind", "+instaswap");
		self waittill("instaswapcfgbind");
		if(!self isInMenu())
		{
			self illusionfun();
			waitframe();
			self setSpawnWeapon(self getNextWeapon());
		}
	}
}

stunmalacfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("stunmalacfg", "+stunmala");
		self waittill("stunmalacfg");
		if(!self isInMenu())
		{
			x = self getCurrentWeapon();
			self takeWeaponGood(x);
			self giveWeapon("concussion_grenade_mp");
			self switchToWeapon("concussion_grenade_mp");
			wait 0.2;
			self giveWeaponGood();
			self waittill("weapon_change");
			self takeWeapon("concussion_grenade_mp");
		}
	}
}

directanim0cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim0cfg", "+a0");
		self waittill("directanim0cfg");
		if(!self isInMenu())
			self setWeaponAnim(0);
	}
}

directanim1cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim1cfg", "+a1");
		self waittill("directanim1cfg");
		if(!self isInMenu())
			self setWeaponAnim(1);
	}
}

directanim2cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim2cfg", "+a2");
		self waittill("directanim2cfg");
		if(!self isInMenu())
			self setWeaponAnim(2);
	}
}

directanim3cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim3cfg", "+a3");
		self waittill("directanim3cfg");
		if(!self isInMenu())
			self setWeaponAnim(3);
	}
}

directanim4cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim4cfg", "+a4");
		self waittill("directanim4cfg");
		if(!self isInMenu())
			self setWeaponAnim(4);
	}
}

directanim5cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim5cfg", "+a5");
		self waittill("directanim5cfg");
		if(!self isInMenu())
			self setWeaponAnim(5);
	}
}

directanim6cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim6cfg", "+a6");
		self waittill("directanim6cfg");
		if(!self isInMenu())
			self setWeaponAnim(6);
	}
}

directanim7cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim7cfg", "+a7");
		self waittill("directanim7cfg");
		if(!self isInMenu())
			self setWeaponAnim(7);
	}
}

directanim8cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim8cfg", "+a8");
		self waittill("directanim8cfg");
		if(!self isInMenu())
			self setWeaponAnim(8);
	}
}

directanim9cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim9cfg", "+a9");
		self waittill("directanim9cfg");
		if(!self isInMenu())
			self setWeaponAnim(9);
	}
}

directanim10cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim10cfg", "+a10");
		self waittill("directanim10cfg");
		if(!self isInMenu())
			self setWeaponAnim(10);
	}
}

directanim11cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim11cfg", "+a11");
		self waittill("directanim11cfg");
		if(!self isInMenu())
			self setWeaponAnim(11);
	}
}

directanim12cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim12cfg", "+a12");
		self waittill("directanim12cfg");
		if(!self isInMenu())
			self setWeaponAnim(12);
	}
}

directanim13cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim13cfg", "+a13");
		self waittill("directanim13cfg");
		if(!self isInMenu())
			self setWeaponAnim(13);
	}
}

directanim14cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim14cfg", "+a14");
		self waittill("directanim14cfg");
		if(!self isInMenu())
			self setWeaponAnim(14);
	}
}

directanim15cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim15cfg", "+a15");
		self waittill("directanim15cfg");
		if(!self isInMenu())
			self setWeaponAnim(15);
	}
}

directanim16cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim16cfg", "+a16");
		self waittill("directanim16cfg");
		if(!self isInMenu())
			self setWeaponAnim(16);
	}
}

directanim17cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim17cfg", "+a17");
		self waittill("directanim17cfg");
		if(!self isInMenu())
			self setWeaponAnim(17);
	}
}

directanim18cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim18cfg", "+a18");
		self waittill("directanim18cfg");
		if(!self isInMenu())
			self setWeaponAnim(18);
	}
}

directanim19cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim19cfg", "+a19");
		self waittill("directanim19cfg");
		if(!self isInMenu())
			self setWeaponAnim(19);
	}
}

directanim20cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim20cfg", "+a20");
		self waittill("directanim20cfg");
		if(!self isInMenu())
			self setWeaponAnim(20);
	}
}

directanim21cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim21cfg", "+a21");
		self waittill("directanim21cfg");
		if(!self isInMenu())
			self setWeaponAnim(21);
	}
}

directanim22cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim22cfg", "+a22");
		self waittill("directanim22cfg");
		if(!self isInMenu())
			self setWeaponAnim(22);
	}
}

directanim23cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim23cfg", "+a23");
		self waittill("directanim23cfg");
		if(!self isInMenu())
			self setWeaponAnim(23);
	}
}

directanim24cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim24cfg", "+a24");
		self waittill("directanim24cfg");
		if(!self isInMenu())
			self setWeaponAnim(24);
	}
}

directanim25cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim25cfg", "+a25");
		self waittill("directanim25cfg");
		if(!self isInMenu())
			self setWeaponAnim(25);
	}
}

directanim26cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim26cfg", "+a26");
		self waittill("directanim26cfg");
		if(!self isInMenu())
			self setWeaponAnim(26);
	}
}

directanim27cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim27cfg", "+a27");
		self waittill("directanim27cfg");
		if(!self isInMenu())
			self setWeaponAnim(27);
	}
}

directanim28cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim28cfg", "+a28");
		self waittill("directanim28cfg");
		if(!self isInMenu())
			self setWeaponAnim(28);
	}
}

directanim29cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim29cfg", "+a29");
		self waittill("directanim29cfg");
		if(!self isInMenu())
			self setWeaponAnim(29);
	}
}

directanim30cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim30cfg", "+a30");
		self waittill("directanim30cfg");
		if(!self isInMenu())
			self setWeaponAnim(30);
	}
}

directanim31cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim31cfg", "+a31");
		self waittill("directanim31cfg");
		if(!self isInMenu())
			self setWeaponAnim(31);
	}
}

directanim32cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim32cfg", "+a32");
		self waittill("directanim32cfg");
		if(!self isInMenu())
			self setWeaponAnim(32);
	}
}

directanim33cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim33cfg", "+a33");
		self waittill("directanim33cfg");
		if(!self isInMenu())
			self setWeaponAnim(33);
	}
}

directanim34cfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("directanim34cfg", "+a34");
		self waittill("directanim34cfg");
		if(!self isInMenu())
			self setWeaponAnim(34);
	}
}

instashootcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("instashootcfg", "+instashoot");
		self waittill("instashootcfg");
		setDvar("instashoots_weapon", "All Weapons");
		self notify("end_instashoots");
		self setPers("instashoots", "Off");
		self setPers("instashoots", "On");
		self thread instashoots();
	}
}

instashootoffcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("instashootoffcfg", "-instashoot");
		self waittill("instashootoffcfg");
		self setPers("instashoots", "Off");
		self notify("end_instashoots");
	}
}

instashootwepCfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("instashootwepCfg", "+instashootwep");
		self waittill("instashootwepCfg");
		curWeap = self getCurrentWeapon();
		if (isDefined(curWeap) && curWeap != "none" && curWeap != "none_mp")
		{
			setDvar("instashoots_weapon", curWeap);
			self notify("end_instashoots");
			self setPers("instashoots", "Off");
			self setPers("instashoots", "On");
			self thread instashoots();
		}
	}
}

// ============================================
// REBUILT FUNCTIONS
// ============================================

dvarposition()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("dvarpos", "+pos");
		self waittill("dvarpos");
		posx = getDvarInt("posx");
		posy = getDvarInt("posy");
		posz = getDvarInt("posz");
		self setOrigin((posx, posy, posz));
	}
}

dvarviewangle()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("dvarviewangle", "+view");
		self waittill("dvarviewangle");
		angx = getDvarInt("angx");
		angy = getDvarInt("angy");
		angz = getDvarInt("angz");
		self setPlayerAngles((angx, angy, angz));
	}
}

forceshot()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("forceshot", "+force");
		self waittill("forceshot");
		if(!self isInMenu())
		{
			currentoffhand = self GetCurrentOffhand();
			self setWeaponAmmoClip(currentoffhand, 9999);
			self GiveMaxAmmo(currentoffhand);
			wait 0.05;
			self[[game[self.team + "_model"]["SNIPER"]]]();
			waitframe();
			self[[game[self.team + "_model"]["GHILLIE"]]]();
			exec("+frag;-frag");
		}
	}
}

doCpMala()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("cpmalacfg", "+cpmala");
		self waittill("cpmalacfg");
		if(!self isInMenu())
		{
			Weap = self getCurrentWeapon();
			self takeWeapon(Weap);
			self giveWeapon("airdrop_marker_mp");
			self switchToWeapon("airdrop_marker_mp");
			wait 0.1;
			self giveWeapon(Weap, 0);
		}
	}
}

doPredMala()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("predmalacfg", "+predmala");
		self waittill("predmalacfg");
		if(!self isInMenu())
		{
			Weap = self getCurrentWeapon();
			self takeWeapon(Weap);
			self GiveWeapon("killstreak_predator_missile_mp");
			self switchToWeapon("killstreak_predator_missile_mp");
			wait 0.1;
			self giveWeapon(Weap, 0);
		}
	}
}

cfgsuitrepeaters()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("suitrepeatcfg", "+suitrepeater");
		self waittill("suitrepeatcfg");
		if(!self isInMenu())
		{
			self[[game[self.team + "_model"]["SNIPER"]]]();
			waitframe();
			self[[game[self.team + "_model"]["GHILLIE"]]]();
		}
	}
}

illusionsta()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("illusioncfg", "+illusion");
		self waittill("illusioncfg");
		if(!self isInMenu())
		{
			my_weapon = self getCurrentWeapon();
			self setSpawnWeapon(my_weapon);
		}
	}
}

omabag()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("omabagcfg", "+omabag");
		self waittill("omabagcfg");
		if(!self isInMenu())
		{
			Weap = self getCurrentWeapon();
			self giveWeapon("onemanarmy_mp");
			self switchToWeapon("onemanarmy_mp");
			wait 0.05;
			self giveWeapon(Weap, 0);
		}
	}
}

giveGunlock()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("gunlockcfg", "+giveGunlock");
		self waittill("gunlockcfg");
		if(!self isInMenu())
		{
			nextWeapon = self getNextWeapon();
			self switchToWeapon(nextWeapon);
		}
	}
}

spectator()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("spectatorcfg", "+specspin");
		self waittill("spectatorcfg");
		if(!self isInMenu())
		{
			if(self.sessionstate == "playing")
			{
				self.sessionstate = "spectator";
				self setClientThirdPerson(1);
			}
			else
			{
				self.sessionstate = "playing";
				self setClientThirdPerson(0);
			}
		}
	}
}

damage()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("damagecfg", "+damage");
		self waittill("damagecfg");
		if(!self isInMenu())
		{
			self playlocalsound("weap_cheytac_fire_npc");
			self.health = self.maxhealth;
			self thread [[level.callbackPlayerDamage]]( self, self, 40, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0 );
		}
	}
}

damage2()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("damage2cfg", "+damage2");
		self waittill("damage2cfg");
		if(!self isInMenu())
		{
			self playlocalsound("weap_cheytac_fire_npc");
			self.health = self.maxhealth;
			self thread [[level.callbackPlayerDamage]]( self, self, 30, 1, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0, 0, 0), (0, 0, 0), "j_mainroot", 0 );
		}
	}
}

killbind()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("killbindcfg", "+killbind");
		self waittill("killbindcfg");
		if(!self isInMenu())
		{
			self suicide();
		}
	}
}

posBot()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("posbotcfg", "+posbot");
		self waittill("posbotcfg");
		if(!self isInMenu())
		{
			for(i = 0; i < level.players.size; i++)
			{
				if(level.players[i].pers["team"] != self.pers["team"] && isAlive(level.players[i]))
				{
					level.players[i] setOrigin(self.origin);
					break;
				}
			}
		}
	}
}

velBot()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("velbotcfg", "+velbot");
		self waittill("velbotcfg");
		if(!self isInMenu())
		{
			velx = getDvarInt("velx");
			velz = getDvarInt("velz");
			vely = getDvarInt("vely");
			for(i = 0; i < level.players.size; i++)
			{
				if(level.players[i].pers["team"] != self.pers["team"] && isAlive(level.players[i]))
				{
					level.players[i] setVelocity((velx, velz, vely));
					break;
				}
			}
		}
	}
}

blowtankcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("blowtankcfg", "+blowtank");
		self waittill("blowtankcfg");
		if(!self isInMenu())
		{
			self playlocalsound("grenade_explode_default");
			radiusDamage(self.origin + (0, 0, -10), 200, 500, 100, self);
		}
	}
}

triplehpcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("triplehpcfg", "+triplehp");
		self waittill("triplehpcfg");
		if(!self isInMenu())
		{
			self.maxhealth = 300;
			self.health = self.maxhealth;
		}
	}
}

cfgprone()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("cfgpronecfg", "+midprone");
		self waittill("cfgpronecfg");
		if(!self isInMenu())
		{
			self setStance("prone");
		}
	}
}

chimthing()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("chimthingcfg", "+chim");
		self waittill("chimthingcfg");
		if(!self isInMenu())
		{
			angles = self getPlayerAngles();
			forward = anglesToForward(angles);
			self setOrigin(self.origin + (0, 0, 50));
			self setVelocity((forward[0] * 200, forward[1] * 200, 300));
		}
	}
}


dropcfg2()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("dropcfg2", "+drop");
		self waittill("dropcfg2");
		if(!self isInMenu())
		{
			x = self dropItem(self getCurrentWeapon());
		}
	}
}

semcfg()
{
	self endon("disconnect");
	self endon("death");
	for(;;)
	{
		self notifyOnPlayerCommand("semcfg", "+sem");
		self waittill("semcfg");
		if(!self isInMenu())
		{
			self playLocalSound("weap_semtex_alert");
		}
	}
}
