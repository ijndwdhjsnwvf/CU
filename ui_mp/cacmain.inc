#define CHOICE_X_START			0
#define CHOICE_Y_START			0

#include "ui_mp/menustyle.inc"
#include "ui/choices_setup_common.menu"
#define OPENMENUONRESPONSE(dvar,response,menuArg) \
	if ( dvarString( dvar ) == response )  { open menuArg } 	
	
	menuDef
	{
		name			CAC_MENU_NAME
		rect			0 0 640 480
		focuscolor		COLOR_FOCUSED
		style			WINDOW_STYLE_FILLED
		blurWorld		3.0
		onEsc 
		{
			scriptMenuResponse "back";
		}

		#include "ui_mp/zetiq/ingamebg.inc"

		itemDef
		{
			rect 48 30 0 0
			text			"CREATE YOUR LOADOUT"
			textfont		UI_FONT_NORMAL
			forecolor       COLOR_TITLE
			textscale		TEXTSIZE_TITLE
			textStyle 		6
			visible			1
			decoration
		}

		#define BACK_OPEN	;
		#include "ui_mp/navcontrols.inc"
		
		#define CAC_MAIN_ACTION(response)\
			play "mouse_click"; \
			execnow "set subMenu "response;\
			OPENMENUONRESPONSE(subMenu,primary,primary_submenus)\
			if(getplayerdata( "customClasses" , localVarInt("classIndex") , "weaponSetups" , 1 , "weapon" ) != "onemanarmy") { \ 
				OPENMENUONRESPONSE(subMenu,secondary,secondary_submenus)\
			}\
			OPENMENUONRESPONSE(subMenu,equipment,equipment_menu)\
			OPENMENUONRESPONSE(subMenu,offhand,offhand_menu)\
			OPENMENUONRESPONSE(subMenu,perk_1,perk1_menu)\
			OPENMENUONRESPONSE(subMenu,perk_2,perk2_menu)\
			OPENMENUONRESPONSE(subMenu,perk_3,perk3_menu)\
			if(dvarString(subMenu) == "primary") { scriptMenuResponse "type,primary"; } \
			if(dvarString(subMenu) == "secondary") { scriptMenuResponse "type,secondary";) } \
			if (response == "done") { close self; scriptMenuResponse "done"; }
		
		#define BUTTON_DBUTTON_AL( itemNum, name, response ) \
		CHOICE_BUTTON_BG( itemNum, 0 ) \
		CHOICE_HIGHLIGHT( itemNum, 0 ) \
		CHOICE_BUTTON_VIS_NOHI( itemNum, name, CAC_MAIN_ACTION(response), when(1) ) \
		CHOICE_DBUTTON_VIS_NOHI( itemNum, name, when(0) )\
		
		BUTTON_DBUTTON_AL(1,"Primary","primary")
		BUTTON_DBUTTON_AL(2,"Secondary","secondary")
		BUTTON_DBUTTON_AL(3,"Equipment","equipment")
		BUTTON_DBUTTON_AL(4,"Special Grenade","offhand")
		BUTTON_DBUTTON_AL(5,"Perk 1","perk_1")
		BUTTON_DBUTTON_AL(6,"Perk 2","perk_2")
		BUTTON_DBUTTON_AL(7,"Perk 3","perk_3")	
		BUTTON_DBUTTON_AL(8, "Equip Loadout!", "done")
		
		// CAC_LOADOUT_INGAME CLASS CHOICE ====================================================
        #define STAT_CAC_PRIMARY                		tableLookup("mp/statstable.csv", 4, getplayerdata( "customClasses" , localVarInt("classIndex") , "weaponSetups" , 0 , "weapon" ), 0)
        #define STAT_CAC_PRIMARY_ATTACHMENT     		tableLookup("mp/attachmentTable.csv", 4, getplayerdata( "customClasses" , localVarInt("classIndex") , "weaponSetups" , 0 , "attachment" , 0 ), 9)
		#define STAT_CAC_PRIMARY_SECOND_ATTACHMENT	    tableLookup("mp/attachmentTable.csv", 4, getplayerdata( "customClasses" , localVarInt("classIndex") , "weaponSetups" , 0 , "attachment" , 1 ), 9)
        #define STAT_CAC_SECONDARY              		tableLookup("mp/statstable.csv", 4, getplayerdata( "customClasses" , localVarInt("classIndex") , "weaponSetups" , 1 , "weapon" ), 0)
        #define STAT_CAC_SECONDARY_ATTACHMENT   		tableLookup("mp/attachmentTable.csv", 4, getplayerdata( "customClasses" , localVarInt("classIndex") , "weaponSetups" , 1 , "attachment" , 0 ), 9)
		#define STAT_CAC_SECONDARY_SECOND_ATTACHMENT	tableLookup("mp/attachmentTable.csv", 4, getplayerdata( "customClasses" , localVarInt("classIndex") , "weaponSetups" , 1 , "attachment" , 1 ), 9)
        #define STAT_CAC_SPECIAL_GRENADE        		tableLookup("mp/perktable.csv", 1, getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 0 ), 3)
        #define STAT_CAC_CAMO                 			tablelookup("mp/camotable.csv",1, getplayerdata( "customClasses" , localVarInt("classIndex") , "weaponSetups" , 0 , "camo" ) ,4)
		#define STAT_CAC_OFFHAND						tablelookup( "mp/statsTable.csv" , 4 , getplayerdata( "customClasses" , localVarInt("classIndex") , "specialGrenade" ) , 6 )
		#define STAT_CAC_PERK1							tablelookup( "mp/perkTable.csv" , 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 1 ) , 3 ) + "_upgrade"
		#define STAT_CAC_PERK2							tablelookup( "mp/perkTable.csv" , 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 2 ) , 3 ) + "_upgrade"
		#define STAT_CAC_PERK3							tablelookup( "mp/perkTable.csv" , 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 3 ) , 3 ) + "_upgrade"
        #include "ui_mp/zetiq/cac_loadout.inc"
	}
	
	// including weapon data
	#include "ui_mp/weaponinfo.menu"
    
	#include "ui_mp/popupstyle.inc" 
	#include "ui/choices_setup_popmenu.menu"
	
	#undef CHOICE_SIZE_X
	#define CHOICE_SIZE_X           216

	#undef NEW_X_OFFSET         
	#define NEW_X_OFFSET    (0-CHOICE_SIZE_X)

	#undef NEW_Y_OFFSET         
	#define NEW_Y_OFFSET    (0-2)
	#undef CHOICE_Y_START
	#define CHOICE_Y_START 1

    // ====================================================================================================
    // primary / secondary submenus =======================================================================
    // ====================================================================================================

	#define LOCAL_SUBMENU_WINDOW \
		PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH) 0 0 CHOICE_POPUP_HEIGHT( 5 ) CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "white", CHOICE_POPUP_BORDER_COLOR, 0, 0, CHOICE_POPUP_BORDER_COLOR visible when( 1 ) ) \
		LOADOUT_PLATING_RAW( CHOICE_POPUP_WIDTH 8, -4, -2, 280, (CHOICE_POPUP_HEIGHT( 10 ) -4), CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN visible when( dvarString("ui_sub_highlighted") == "riotshield"), 0, 0 )\
		/* weapon image*/ \
		PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+6) 30 256 48 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "gradient_bottom", 1 1 1 0.3, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when( dvarString("ui_sub_highlighted") == "riotshield" ) ) \
		PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+72) -6 180 90 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, tablelookup("mp/statstable.csv",4,riotshield,6), 1 1 1 1, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when( dvarString("ui_sub_highlighted") == "riotshield" ) ) \
		/* weapon title*/\
		PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 58 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/statstable.csv",4,riotshield,3), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE visible when( dvarString("ui_sub_highlighted") == "riotshield" ) ) \
		/* weapon desc unlocked*/\
		PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 80 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/statstable.csv",4,riotshield,7), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR visible when(dvarString("ui_sub_highlighted") == "riotshield") )\
		
	#define PRIMARY_SUBMENU_ACTION( subRef )\
			play "mouse_click";\
			exec "set ui_sub_highlighted "subRef;\
			OPENMENUONRESPONSE(ui_sub_highlighted,assault,cac_assault)\
			OPENMENUONRESPONSE(ui_sub_highlighted,smg,cac_smg)\
			OPENMENUONRESPONSE(ui_sub_highlighted,sniper,cac_sniper)\
			OPENMENUONRESPONSE(ui_sub_highlighted,lmg,cac_lmg)\
			OPENMENUONRESPONSE(ui_sub_highlighted,machinepistol,cac_machinepistol)\
			OPENMENUONRESPONSE(ui_sub_highlighted,shotgun,cac_shotgun)\
			OPENMENUONRESPONSE(ui_sub_highlighted,handgun,cac_handgun)\
			OPENMENUONRESPONSE(ui_sub_highlighted,rocket,cac_rocket)\
			if ( dvarString("ui_sub_highlighted") == "overkill" ) { open primary_submenus }\ 
			if(dvarString("ui_sub_highlighted") == "riotshield") { close "primary_submenus"; scriptMenuResponse "gun,riotshield";scriptMenuResponse "attachment,none" }\
			close self;
					
	#define SUB_FOCUS_ACTION( subRef ) \
			exec "set ui_sub_highlighted "subRef;
		
	#define LOCAL_SUBMENU_ITEM(itemNum, subName, subRef )\
        CHOICE_BUTTON_FOCUS_VIS_NOHI( itemNum, subName, PRIMARY_SUBMENU_ACTION( subRef ), \
        SUB_FOCUS_ACTION( subRef ), ;, when(1) ) \
        CHOICE_HIGHLIGHT( itemNum, when(1) ) \
        execKey itemNum { PRIMARY_SUBMENU_ACTION( subRef ) } \

	#undef  UI_FOCUSFIRST
	#define UI_FOCUSFIRST "ui_sub_highlighted"
		
	#define LOCAL_SUBMENU_GROUP( pos, y_offset )\
	menuDef {\
		IMPROVED_POPUP_SETUP_ONOPEN( "primary_submenus", 5, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" assault; set ui_inside_popup assault";, 0 )\
		LOCAL_SUBMENU_WINDOW\
		LOCAL_SUBMENU_ITEM( 1, "@MENU_ASSAULT_RIFLES_CAPS", "assault")\
		LOCAL_SUBMENU_ITEM( 2, "@MENU_SMGS_CAPS", "smg")\
		LOCAL_SUBMENU_ITEM( 3, "@MENU_LMGS_CAPS", "lmg")\
		LOCAL_SUBMENU_ITEM( 4, "@MENU_SNIPER_RIFLES_CAPS", "sniper")\
		LOCAL_SUBMENU_ITEM( 5, "@MENU_RIOT_SHIELD_CAPS", "riotshield")\
	}\
	menuDef {\
		IMPROVED_POPUP_SETUP_ONOPEN( "secondary_submenus", 5, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" machinepistol;set ui_inside_popup machinepistol";, 0 )\		
		LOCAL_SUBMENU_WINDOW\
		LOCAL_SUBMENU_ITEM( 1, "@MENU_MACHINE_PISTOLS_CAPS", "machinepistol")\
		LOCAL_SUBMENU_ITEM( 2, "@MENU_SHOTGUNS_CAPS", "shotgun")\
		LOCAL_SUBMENU_ITEM( 3, "@MENU_HANDGUNS_CAPS", "handgun")\
		LOCAL_SUBMENU_ITEM( 4, "@MENU_ROCKETS_CAPS", "rocket")\
		LOCAL_SUBMENU_ITEM( 5, "OVERKILL", "overkill")\
	}
	
	LOCAL_SUBMENU_GROUP( 1, 37 )
	
	// ====================================================================================================
    // primary weapons ====================================================================================
    // ====================================================================================================
	#define LOCAL_WEAPON_INFO_WINDOW \
		/* weapon information side frame*/ \
		PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH-6) -4 280 CHOICE_POPUP_HEIGHT( 10 ) CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "white", CHOICE_POPUP_BORDER_COLOR, 1, 2, CHOICE_POPUP_BORDER_COLOR visible when( 1 ) ) \
		LOADOUT_PLATING_RAW( CHOICE_POPUP_WIDTH 8, -4, -2, 280, (CHOICE_POPUP_HEIGHT( 10 ) -4), CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN visible when( 1 ), 0, 0 )\
		/* weapon image*/ \
		PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+6) 30 256 48 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "gradient_bottom", 1 1 1 0.3, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when( 1 ) ) \
		PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+72) -6 180 90 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, tablelookup("mp/statstable.csv",4,dvarString("ui_primary_highlighted"),6), 1 1 1 1, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when( 1 ) ) \
		/* weapon title*/\
		PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 58 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/statstable.csv",4,dvarString("ui_primary_highlighted"),3), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE visible when( 1 ) ) \
		/* weapon desc unlocked*/\
		PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 80 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/statstable.csv",4,dvarString("ui_primary_highlighted"),7), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR visible 1 )\
		
    #define LOCAL_PRIMARY_WEAPON_ACTION( weaponRef ) \
        play "mouse_click"; \
		if(dvarString( ui_primary_highlighted ) != "ak47classic") { OPENMENUONRESPONSE(ui_sub_highlighted,assault,assault_attach_menu) }\
		if(dvarString( ui_primary_highlighted ) == "ak47classic") { OPENMENUONRESPONSE(ui_sub_highlighted,assault,special_assault_attach_menu) }\
		if(dvarString( ui_primary_highlighted ) != "ak74u" && dvarString( ui_primary_highlighted ) != "peacekeeper") { OPENMENUONRESPONSE(ui_sub_highlighted,smg,smg_attach_menu) }\
		if(dvarString( ui_primary_highlighted ) == "ak74u") { OPENMENUONRESPONSE(ui_sub_highlighted,smg,special_smg_attach_menu) }\
		OPENMENUONRESPONSE(ui_sub_highlighted,lmg,lmg_attach_menu)\
		if(dvarString( ui_primary_highlighted ) != "m40a3" && dvarString( ui_primary_highlighted ) != "dragunov") { OPENMENUONRESPONSE(ui_sub_highlighted,sniper,sniper_attach_menu) }\
		OPENMENUONRESPONSE(ui_sub_highlighted,machinepistol,mpistol_attach_menu)\
		if(dvarString( ui_primary_highlighted ) != "ranger" && dvarString( ui_primary_highlighted ) != "model1887") { OPENMENUONRESPONSE(ui_sub_highlighted,shotgun,shotgun_attach_menu) }\
		if(dvarString( ui_primary_highlighted ) == "ranger" || dvarString( ui_primary_highlighted ) == "model1887") { OPENMENUONRESPONSE(ui_sub_highlighted,shotgun,special_shotgun_attach_menu) }\
		if(dvarString( ui_primary_highlighted ) != "coltanaconda" && dvarString( ui_primary_highlighted ) != "deserteagle" && dvarString( ui_primary_highlighted ) != "deserteaglegold") { OPENMENUONRESPONSE(ui_sub_highlighted,handgun,handgun_attach_menu) }\
		if(dvarString( ui_primary_highlighted ) == "coltanaconda" || dvarString( ui_primary_highlighted ) == "deserteagle" || dvarString( ui_primary_highlighted ) == "deserteaglegold") { OPENMENUONRESPONSE(ui_sub_highlighted,handgun,special_handgun_attach_menu) }\
		scriptMenuResponse "gun,"weaponRef;\
		if(weaponRef == "peacekeeper" ||weaponRef == "m40a3" || weaponRef == "dragunov" || weaponRef == "at4" || weaponRef == "m79" || weaponRef == "stinger" || weaponRef == "javelin" || weaponRef == "rpg" ) { close "cac_smg"; close "cac_sniper"; close "cac_rocket"; close "primary_submenus"; close "secondary_submenus"; scriptMenuResponse "attachment,none"; }
		
	#define WI_FOCUS_ACTION( weaponRef ) \
		exec "set ui_primary_highlighted "weaponRef;

    #define LOCAL_WEAPON_ITEM( itemNum, weaponName, weaponRef )\
        CHOICE_BUTTON_FOCUS_VIS_NOHI( itemNum, weaponName, LOCAL_PRIMARY_WEAPON_ACTION( weaponRef ), \
        WI_FOCUS_ACTION( weaponRef ), ;, when(1) ) \
        CHOICE_HIGHLIGHT( itemNum, when(1) ) \
        execKey itemNum { LOCAL_PRIMARY_WEAPON_ACTION( weaponRef ) } \

	#undef  WI_FOCUSFIRST
	#define WI_FOCUSFIRST "ui_primary_highlighted"
	
    // primary weapon items
    #define LOCAL_MASTER_WEAPON_GROUP( pos, y_offset )\
    menuDef {\
        IMPROVED_POPUP_SETUP_ONOPEN( "cac_assault", 10, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "WI_FOCUSFIRST" m4; set ui_inside_popup assault";, 0 )\
		onClose{open "primary_submenus";}\
        LOCAL_WEAPON_INFO_WINDOW\
        LOCAL_WEAPON_ITEM( 1, "M4A1", "m4")\
		LOCAL_WEAPON_ITEM( 2, "FAMAS", "famas")\
		LOCAL_WEAPON_ITEM( 3, "SCAR-H", "scar")\
		LOCAL_WEAPON_ITEM( 4, "TAR-21", "tavor")\
		LOCAL_WEAPON_ITEM( 5, "FAL", "fal")\
		LOCAL_WEAPON_ITEM( 6, "M16A4", "m16")\
		LOCAL_WEAPON_ITEM( 7, "ACR", "masada")\
		LOCAL_WEAPON_ITEM( 8, "F2000", "fn2000")\
        LOCAL_WEAPON_ITEM( 9, "AK-47", "ak47")\
        LOCAL_WEAPON_ITEM( 10, "AK-47 Classic", "ak47classic")\
	}\
    menuDef {\
        IMPROVED_POPUP_SETUP_ONOPEN( "cac_smg", 10, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "WI_FOCUSFIRST" mp5k;set ui_inside_popup specops";, 0 )\
		onClose{open "primary_submenus";}\
        LOCAL_WEAPON_INFO_WINDOW\
        LOCAL_WEAPON_ITEM( 1, "MP5K", "mp5k")\
        LOCAL_WEAPON_ITEM( 2, "UMP45", "ump45")\
        LOCAL_WEAPON_ITEM( 3, "Vector", "kriss")\
		LOCAL_WEAPON_ITEM( 4, "P90", "p90")\
		LOCAL_WEAPON_ITEM( 5, "Mini-Uzi", "uzi")\
		LOCAL_WEAPON_ITEM( 6, "AK74-U", "ak74u")\
		LOCAL_WEAPON_ITEM( 7, "Peacekeeper", "peacekeeper")\
    }\
    menuDef {\
        IMPROVED_POPUP_SETUP_ONOPEN( "cac_lmg", 10, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "WI_FOCUSFIRST" sa80; set ui_inside_popup demolitions";, 0 )\
		onClose{open "primary_submenus";}\
        LOCAL_WEAPON_INFO_WINDOW\
        LOCAL_WEAPON_ITEM( 1, "L86 LSW", "sa80")\
		LOCAL_WEAPON_ITEM( 2, "RPD", "rpd")\
		LOCAL_WEAPON_ITEM( 3, "MG4", "mg4")\
		LOCAL_WEAPON_ITEM( 4, "AUG HBAR", "aug")\
		LOCAL_WEAPON_ITEM( 5, "M240", "m240")\
    }\
    menuDef {\
        IMPROVED_POPUP_SETUP_ONOPEN( "cac_sniper", 10, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "WI_FOCUSFIRST" cheytac; set ui_inside_popup sniper";, 0 )\
		onClose{open "primary_submenus";}\
        LOCAL_WEAPON_INFO_WINDOW\
        LOCAL_WEAPON_ITEM( 1, "Intervention", "cheytac")\
		LOCAL_WEAPON_ITEM( 2, "Barrett .50cal", "barrett")\
		LOCAL_WEAPON_ITEM( 3, "WA2000", "wa2000")\
		LOCAL_WEAPON_ITEM( 4, "M21 EBR", "m21")\
		LOCAL_WEAPON_ITEM( 5, "M40A3", "m40a3")\
		LOCAL_WEAPON_ITEM( 6, "DRAGUNOV", "dragunov")\
    }\
	menuDef {\
        IMPROVED_POPUP_SETUP_ONOPEN( "cac_machinepistol", 10, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "WI_FOCUSFIRST" pp2000; set ui_inside_popup sniper";, 0 )\
		onClose{open "secondary_submenus";}\
        LOCAL_WEAPON_INFO_WINDOW\
        LOCAL_WEAPON_ITEM( 1, "PP2000", "pp2000")\
		LOCAL_WEAPON_ITEM( 2, "G18", "glock")\
		LOCAL_WEAPON_ITEM( 3, "M93 Raffica", "beretta393")\
		LOCAL_WEAPON_ITEM( 4, "TMP", "tmp")\
    }\
	menuDef {\
        IMPROVED_POPUP_SETUP_ONOPEN( "cac_shotgun", 10, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "WI_FOCUSFIRST" spas12; set ui_inside_popup sniper";, 0 )\
		onClose{open "secondary_submenus";}\
        LOCAL_WEAPON_INFO_WINDOW\
        LOCAL_WEAPON_ITEM( 1, "SPAS-12", "spas12")\
		LOCAL_WEAPON_ITEM( 2, "AA-12", "aa12")\
		LOCAL_WEAPON_ITEM( 3, "Striker", "striker")\
		LOCAL_WEAPON_ITEM( 4, "Ranger", "ranger")\
		LOCAL_WEAPON_ITEM( 5, "M1014", "m1014")\
		LOCAL_WEAPON_ITEM( 6, "Model 1887", "model1887")\
    }\
	menuDef {\
        IMPROVED_POPUP_SETUP_ONOPEN( "cac_handgun", 10, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "WI_FOCUSFIRST" usp; set ui_inside_popup sniper";, 0 )\
		onClose{open "secondary_submenus";}\
        LOCAL_WEAPON_INFO_WINDOW\
        LOCAL_WEAPON_ITEM( 1, "USP .45", "usp")\
		LOCAL_WEAPON_ITEM( 2, ".44 Magnum", "coltanaconda")\
		LOCAL_WEAPON_ITEM( 3, "M9", "beretta")\
		LOCAL_WEAPON_ITEM( 4, "Desert Eagle", "deserteagle")\
		LOCAL_WEAPON_ITEM( 5, "Gold Desert Eagle", "deserteaglegold")\
    }\
	menuDef {\
        IMPROVED_POPUP_SETUP_ONOPEN( "cac_rocket", 10, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "WI_FOCUSFIRST" at4; set ui_inside_popup sniper";, 0 )\
		onClose{open "secondary_submenus";}\
        LOCAL_WEAPON_INFO_WINDOW\
        LOCAL_WEAPON_ITEM( 1, "AT4-HS", "at4")\
		LOCAL_WEAPON_ITEM( 2, "Thumper x 2", "m79")\
		LOCAL_WEAPON_ITEM( 3, "Stinger", "stinger")\
		LOCAL_WEAPON_ITEM( 4, "Javelin", "javelin")\
		LOCAL_WEAPON_ITEM( 5, "RPG-7 x2", "rpg")\
    }
	
	LOCAL_MASTER_WEAPON_GROUP( 1, 37 )
	
	// ====================================================================================================
    // attachment selection ===============================================================================
    // ====================================================================================================
    #define LOCAL_ATTACHMENT_INFO_WINDOW \
        /* attachment information side frame*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH-6) -4 280 CHOICE_POPUP_HEIGHT( 11 ) CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "white", CHOICE_POPUP_BORDER_COLOR, 1, 2, CHOICE_POPUP_BORDER_COLOR visible when( dvarString(ui_inside_popup) != "camo" ) ) \
        LOADOUT_PLATING_RAW( CHOICE_POPUP_WIDTH 8, -4, -2, 280, (CHOICE_POPUP_HEIGHT( 11 )-4), CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN visible when( dvarString(ui_inside_popup) != "camo" ), 0, 0 ) \
        /* attachment image*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+6) 30 256 48 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "gradient_bottom", 1 1 1 0.3, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when( dvarString(ui_inside_popup) != "camo" ) ) \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+182) 6 64 64 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, tablelookup("mp/attachmentTable.csv",4,dvarString(ui_attachment_highlighted),6), 1 1 1 1, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when( dvarString(ui_inside_popup) != "camo" ) ) \
        /* attachment title*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 58 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/attachmentTable.csv",4,dvarString(ui_attachment_highlighted),3), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE visible when( dvarString(ui_inside_popup) != "camo" ) ) \
        /* attachment desc unlocked*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 80 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/attachmentTable.csv",4,dvarString(ui_attachment_highlighted),7), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR visible 1 )\

    #define LOCAL_ATTACHMENT_ACTION( attachRef ) \
		play "mouse_click";\
		if (dvarString( subMenu ) == "primary") { \
			close "assault_attach_menu"; \
			close "special_assault_attach_menu"; \
			close "smg_attach_menu"; \
			close "special_smg_attach_menu"; \
			close "lmg_attach_menu"; \
			close "sniper_attach_menu"; \
			close "cac_assault"; \
			close "cac_smg"; \
			close "cac_lmg"; \
			close "cac_sniper"; \
			close "primary_submenus"; \
			open "camo_menu"; \
		} \
		if (dvarString( subMenu ) == "secondary") { \
			close "assault_attach_menu"; \
			close "special_assault_attach_menu"; \
			close "smg_attach_menu"; \
			close "special_smg_attach_menu"; \
			close "lmg_attach_menu"; \
			close "sniper_attach_menu"; \
			close "mpistol_attach_menu"; \
			close "shotgun_attach_menu"; \
			close "special_shotgun_attach_menu"; \
			close "handgun_attach_menu"; \
			close "special_handgun_attach_menu"; \
			close "cac_machinepistol"; \
			close "cac_shotgun"; \
			close "cac_handgun"; \
			close "secondary_submenus"; \
			close "cac_assault"; \
			close "cac_smg"; \
			close "cac_lmg"; \
			close "cac_sniper"; \
			close "primary_submenus"; \
		} \
		scriptMenuResponse "attachment,"attachRef; \
		
	#define LOCAL_ATTACHMENT_ITEM( itemNum, attachName, attachRef )\
        CHOICE_BUTTON_FOCUS_VIS_NOHI( itemNum, attachName, LOCAL_ATTACHMENT_ACTION( attachRef ), \
        execnow "set ui_attachment_highlighted "attachRef, ;, when(1) ) \
        CHOICE_HIGHLIGHT( itemNum, when(1) ) \
        execKey itemNum { LOCAL_ATTACHMENT_ACTION( attachRef ) } \
		
	#undef  UI_FOCUSFIRST
		#define UI_FOCUSFIRST "ui_attachment_highlighted"
		
	#define LOCAL_ATTACHMENT_MASTER_GROUP(pos, y_offset)\	
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "assault_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
        LOCAL_ATTACHMENT_ITEM( 2, "Grenade Launcher", "gl" )\
        LOCAL_ATTACHMENT_ITEM( 3, "Red Dot Sight", "reflex" )\
		LOCAL_ATTACHMENT_ITEM( 4, "Silencer", "silencer" )\
		LOCAL_ATTACHMENT_ITEM( 5, "ACOG Scope", "acog" )\
		LOCAL_ATTACHMENT_ITEM( 6, "FMJ", "fmj" )\
		LOCAL_ATTACHMENT_ITEM( 7, "Shotgun", "shotgun" )\
		LOCAL_ATTACHMENT_ITEM( 8, "Holographic Sight", "eotech" )\
		LOCAL_ATTACHMENT_ITEM( 9, "Heartbeat Sensor", "heartbeat" )\
		LOCAL_ATTACHMENT_ITEM( 10, "Thermal", "thermal" )\
		LOCAL_ATTACHMENT_ITEM( 11, "Extended Mags", "xmags" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "special_assault_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
        LOCAL_ATTACHMENT_ITEM( 2, "Grenade Launcher", "gl" )\
        LOCAL_ATTACHMENT_ITEM( 3, "Red Dot Sight", "reflex" )\
		LOCAL_ATTACHMENT_ITEM( 4, "Silencer", "silencer" )\
		LOCAL_ATTACHMENT_ITEM( 5, "ACOG Scope", "acog" )\
		LOCAL_ATTACHMENT_ITEM( 6, "FMJ", "fmj" )\
		LOCAL_ATTACHMENT_ITEM( 7, "Extended Mags", "xmags" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "smg_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
        LOCAL_ATTACHMENT_ITEM( 2, "Rapid Fire", "rof" )\
        LOCAL_ATTACHMENT_ITEM( 3, "Red Dot Sight", "reflex" )\
		LOCAL_ATTACHMENT_ITEM( 4, "Silencer", "silencer" )\
		LOCAL_ATTACHMENT_ITEM( 5, "ACOG Scope", "acog" )\
		LOCAL_ATTACHMENT_ITEM( 6, "FMJ", "fmj" )\
		LOCAL_ATTACHMENT_ITEM( 7, "Akimbo", "akimbo" )\
		LOCAL_ATTACHMENT_ITEM( 8, "Holographic Sight", "eotech" )\
		LOCAL_ATTACHMENT_ITEM( 9, "Thermal", "thermal" )\
		LOCAL_ATTACHMENT_ITEM( 10, "Extended Mags", "xmags" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "special_smg_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
		LOCAL_ATTACHMENT_ITEM( 2, "ACOG Scope", "acog" )\
		LOCAL_ATTACHMENT_ITEM( 3, "Extended Mags", "xmags" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "lmg_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
        LOCAL_ATTACHMENT_ITEM( 2, "Grip", "grip" )\
        LOCAL_ATTACHMENT_ITEM( 3, "Red Dot Sight", "reflex" )\
		LOCAL_ATTACHMENT_ITEM( 4, "Silencer", "silencer" )\
		LOCAL_ATTACHMENT_ITEM( 5, "ACOG Scope", "acog" )\
		LOCAL_ATTACHMENT_ITEM( 6, "FMJ", "fmj" )\
		LOCAL_ATTACHMENT_ITEM( 7, "Holographic Sight", "eotech" )\
		LOCAL_ATTACHMENT_ITEM( 8, "Heartbeat Sensor", "heartbeat" )\
		LOCAL_ATTACHMENT_ITEM( 9, "Thermal", "thermal" )\
		LOCAL_ATTACHMENT_ITEM( 10, "Extended Mags", "xmags" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "sniper_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
		LOCAL_ATTACHMENT_ITEM( 2, "Silencer", "silencer" )\
		LOCAL_ATTACHMENT_ITEM( 3, "ACOG Scope", "acog" )\
		LOCAL_ATTACHMENT_ITEM( 4, "FMJ", "fmj" )\
		LOCAL_ATTACHMENT_ITEM( 5, "Heartbeat Sensor", "heartbeat" )\
		LOCAL_ATTACHMENT_ITEM( 6, "Thermal", "thermal" )\
		LOCAL_ATTACHMENT_ITEM( 7, "Extended Mags", "xmags" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "mpistol_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
		LOCAL_ATTACHMENT_ITEM( 2, "Red Dot Sight", "reflex" )\
		LOCAL_ATTACHMENT_ITEM( 3, "Silencer", "silencer" )\
		LOCAL_ATTACHMENT_ITEM( 4, "FMJ", "fmj" )\
		LOCAL_ATTACHMENT_ITEM( 5, "Akimbo", "akimbo" )\
		LOCAL_ATTACHMENT_ITEM( 6, "Holographic Sight", "eotech" )\
		LOCAL_ATTACHMENT_ITEM( 7, "Extended Mags", "xmags" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "shotgun_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
		LOCAL_ATTACHMENT_ITEM( 2, "Red Dot Sight", "reflex" )\
		LOCAL_ATTACHMENT_ITEM( 3, "Silencer", "silencer" )\
		LOCAL_ATTACHMENT_ITEM( 4, "Grip", "grip" )\
		LOCAL_ATTACHMENT_ITEM( 5, "FMJ", "fmj" )\
		LOCAL_ATTACHMENT_ITEM( 6, "Holographic Sight", "eotech" )\
		LOCAL_ATTACHMENT_ITEM( 7, "Extended Mags", "xmags" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "special_shotgun_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
		LOCAL_ATTACHMENT_ITEM( 2, "Akimbo", "akimbo" )\
		LOCAL_ATTACHMENT_ITEM( 3, "FMJ", "fmj" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "handgun_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
		LOCAL_ATTACHMENT_ITEM( 2, "FMJ", "fmj" )\
		LOCAL_ATTACHMENT_ITEM( 3, "Silencer", "silencer" )\
		LOCAL_ATTACHMENT_ITEM( 4, "Akimbo", "akimbo" )\
		LOCAL_ATTACHMENT_ITEM( 5, "Tactical Knife", "tactical" )\
		LOCAL_ATTACHMENT_ITEM( 6, "Extended Mags", "xmags" )\
    }\
	menuDef{\
		IMPROVED_POPUP_SETUP_ONOPEN( "special_handgun_attach_menu", 11, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup attach";, 0 )\
        LOCAL_ATTACHMENT_INFO_WINDOW\
		LOCAL_ATTACHMENT_ITEM( 1, "None", "none" )\
		LOCAL_ATTACHMENT_ITEM( 2, "FMJ", "fmj" )\
		LOCAL_ATTACHMENT_ITEM( 3, "Akimbo", "akimbo" )\
		LOCAL_ATTACHMENT_ITEM( 4, "Tactical Knife", "tactical" )\
    }\
	
	LOCAL_ATTACHMENT_MASTER_GROUP(1, 37)
	
    // ====================================================================================================
    // special grenade selection ==========================================================================
    // ====================================================================================================
    #define LOCAL_SGRENADE_INFO_WINDOW \
        /* special grenade information side frame*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH-6) -4 280 CHOICE_POPUP_HEIGHT(5) CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "white", CHOICE_POPUP_BORDER_COLOR, 1, 2, CHOICE_POPUP_BORDER_COLOR ) \
        LOADOUT_PLATING_RAW( CHOICE_POPUP_WIDTH 8, -4, -2, 280, (CHOICE_POPUP_HEIGHT(5)-4), CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN visible when( dvarString(ui_inside_popup) != "attachment" ), 0, 0 )\
        /* special grenade image*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+6) 6 256 48 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "gradient_bottom", 1 1 1 0.3, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when( dvarString(ui_inside_popup) != "attachment" ) ) \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+178) -6 64 64 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, tablelookup("mp/statstable.csv",4,dvarString("ui_sgrenade_highlighted"),6), 1 1 1 1, 0, 2, CHOICE_POPUP_BORDER_COLOR ) \
        /* special grenade title*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 34 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/statstable.csv",4,dvarString("ui_sgrenade_highlighted"),3), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE ) \
        /* special grenade desc unlocked*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 56 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/statstable.csv",4,dvarString("ui_sgrenade_highlighted"),7), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR ) \

    #define LOCAL_SGRENADE_ACTION( weaponRef ) \
            play "mouse_click"; \
			close "offhand_menu"; \
			scriptMenuResponse "special,"weaponRef;
        
    #define LOCAL_SGRENADE_ITEM( itemNum, weaponName, weaponRef )\
        CHOICE_BUTTON_FOCUS_VIS_NOHI( itemNum, weaponName, LOCAL_SGRENADE_ACTION( weaponRef ), \
        execnow "set ui_sgrenade_highlighted "weaponRef, ;, when(1) ) \
        CHOICE_HIGHLIGHT( itemNum, when(1) ) \
        execKey itemNum { LOCAL_SGRENADE_ACTION( weaponRef ) } \
		
    // hackaround to work for PC's floating mouse unfocusing
    #undef  UI_FOCUSFIRST
    #define UI_FOCUSFIRST "ui_sgrenade_highlighted"
    
    // special grenade selection popup menus
    menuDef 
    {
       IMPROVED_POPUP_SETUP_ONOPEN( "offhand_menu", 5, (CHOICE_X( 3 )), (CHOICE_Y( 4 )+10-35), ;, execnow "set "UI_FOCUSFIRST" flash_grenade; set ui_inside_popup grenade";, 1 )
        onClose{ execnow "set ui_inside_popup 0"; }
        LOCAL_SGRENADE_INFO_WINDOW
        LOCAL_SGRENADE_ITEM( 1, "Flash Grenade x2", "flash_grenade" )
        LOCAL_SGRENADE_ITEM( 2, "Stun Grenade x2", "concussion_grenade" )
		LOCAL_SGRENADE_ITEM( 3, "Smoke Grenade x1", "smoke_grenade" )
    }
	
	// ====================================================================================================
    // grenade selection ==================================================================================
    // ====================================================================================================
    #define LOCAL_GRENADE_INFO_WINDOW \
        /* special grenade information side frame*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH-6) -4 280 CHOICE_POPUP_HEIGHT(7) CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "white", CHOICE_POPUP_BORDER_COLOR, 1, 2, CHOICE_POPUP_BORDER_COLOR ) \
        LOADOUT_PLATING_RAW( CHOICE_POPUP_WIDTH 8, -4, -2, 280, (CHOICE_POPUP_HEIGHT(7)-4), CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN visible when( dvarString(ui_inside_popup) != "attachment" ), 0, 0 )\
        /* special grenade image*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+6) 6 256 48 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "gradient_bottom", 1 1 1 0.3, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when(1) ) \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+178) -6 64 64 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, tablelookup("mp/perktable.csv",1,dvarString("ui_grenade_highlighted"),3), 1 1 1 1, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when(1)) \
        /* special grenade title*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 34 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/perktable.csv",1,dvarString("ui_grenade_highlighted"),2), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE ) \
        /* special grenade desc unlocked*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 56 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/perktable.csv",1,dvarString("ui_grenade_highlighted"),4), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR ) \

    #define LOCAL_GRENADE_ACTION( weaponRef ) \
            play "mouse_click"; \
			close "equipment_menu";  \
			scriptMenuResponse "lethal,"weaponRef;
        
    #define LOCAL_GRENADE_ITEM( itemNum, weaponName, weaponRef )\
        CHOICE_BUTTON_FOCUS_VIS_NOHI( itemNum, weaponName, LOCAL_GRENADE_ACTION( weaponRef ), \
        execnow "set ui_grenade_highlighted "weaponRef, ;, when(1) ) \
        CHOICE_HIGHLIGHT( itemNum, when(1) ) \
        execKey itemNum { LOCAL_SGRENADE_ACTION( weaponRef ) } \
		
    // hackaround to work for PC's floating mouse unfocusing
    #undef  UI_FOCUSFIRST
    #define UI_FOCUSFIRST "ui_grenade_highlighted"
    
    // special grenade selection popup menus
    menuDef
	{
		IMPROVED_POPUP_SETUP_ONOPEN( "equipment_menu", 7, (CHOICE_X( 3 )), (CHOICE_Y( 3 )+10-35), ;, execnow "set "UI_FOCUSFIRST" frag_grenade_mp; set ui_inside_popup sgrenade";, 1 )
        onClose{ execnow "set ui_inside_popup 0"; }
        LOCAL_GRENADE_INFO_WINDOW
        LOCAL_GRENADE_ITEM( 1, "Frag", "frag_grenade_mp" )
        LOCAL_GRENADE_ITEM( 2, "Semtex", "semtex_mp" )
		LOCAL_GRENADE_ITEM( 3, "Throwing Knife", "throwingknife_mp" )
		LOCAL_GRENADE_ITEM( 4, "Tactical Insertion", "specialty_tacticalinsertion" )
		LOCAL_GRENADE_ITEM( 5, "Blast Shield", "specialty_blastshield" )
		LOCAL_GRENADE_ITEM( 6, "Claymore", "claymore_mp" )
		LOCAL_GRENADE_ITEM( 7, "C4", "c4_mp" )
    }
	
	// ====================================================================================================
    // perk selection =====================================================================================
    // ====================================================================================================
    #define LOCAL_PERK_INFO_WINDOW \
        /* special perk information side frame*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH-6) -4 280 CHOICE_POPUP_HEIGHT(6) CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "white", CHOICE_POPUP_BORDER_COLOR, 1, 2, CHOICE_POPUP_BORDER_COLOR ) \
        LOADOUT_PLATING_RAW( CHOICE_POPUP_WIDTH 8, -4, -2, 280, (CHOICE_POPUP_HEIGHT(6)-4), CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN visible when( dvarString(ui_inside_popup) != "attachment" ), 0, 0 )\
        /* special perk image*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+6) 6 256 48 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "gradient_bottom", 1 1 1 0.3, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when(1) ) \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+178) -6 64 64 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, tablelookup("mp/perktable.csv",1,dvarString("ui_perk_highlighted"),3) + "_upgrade" , 1 1 1 1, 0, 2, CHOICE_POPUP_BORDER_COLOR visible when(1)) \
        /* special perk title*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 34 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/perktable.csv",1,dvarString("ui_perk_highlighted"),2), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE ) \
        /* special perk desc unlocked*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 56 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/perktable.csv",1,dvarString("ui_perk_highlighted"),4), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR ) \
		/* special perk desc unlocked*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 96 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/perktable.csv",1,dvarString("ui_perkpro_highlighted"),4), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR ) \

    #define LOCAL_PERK_ACTION( weaponRef, perkRef ) \
            play "mouse_click"; \
			close "perk1_menu"; \
			close "perk2_menu"; \
			close "perk3_menu"; \
			scriptMenuResponse "perk,"weaponRef;
			
        
    #define LOCAL_PERK_ITEM( itemNum, weaponName, weaponRef, perkRef )\
        CHOICE_BUTTON_FOCUS_VIS_NOHI( itemNum, weaponName, LOCAL_PERK_ACTION( weaponRef, perkRef ), \
        execnow "set ui_perk_highlighted "weaponRef;execnow "set ui_perkpro_highlighted "perkRef,; , when(1) ) \
        CHOICE_HIGHLIGHT( itemNum, when(1) ) \
        execKey itemNum { LOCAL_PERK_ACTION( weaponRef, perkRef ) } \
		
    #undef  UI_FOCUSFIRST
    #define UI_FOCUSFIRST "ui_perk_highlighted"
	
	#undef 	PRO_FOCUSFIRST
	#define PRO_FOCUFIRST "ui_perkpro_highlighted"
    
	#define LOCAL_PERK_GROUP(pos, y_offset)\
    menuDef {\
		IMPROVED_POPUP_SETUP_ONOPEN( "perk1_menu", 6, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" specialty_marathon;set "PRO_FOCUFIRST" specialty_fastmantle; set ui_inside_popup perk1";, 1 )\
		LOCAL_PERK_INFO_WINDOW\
        LOCAL_PERK_ITEM( 1, "Marathon Pro", "specialty_marathon", "specialty_fastmantle" )\
        LOCAL_PERK_ITEM( 2, "Sleight of Hand Pro", "specialty_fastreload", "specialty_quickdraw" )\
		LOCAL_PERK_ITEM( 3, "Scavenger Pro", "specialty_scavenger", "specialty_extraammo" )\
		LOCAL_PERK_ITEM( 4, "Bling Pro", "specialty_bling", "specialty_secondarybling" )\
		LOCAL_PERK_ITEM( 5, "One Man Army Pro", "specialty_onemanarmy", "specialty_omaquickchange" )\
    }\
	menuDef {\
		IMPROVED_POPUP_SETUP_ONOPEN( "perk2_menu", 6, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" specialty_bulletdamage;set "PRO_FOCUFIRST" specialty_armorpiercing; set ui_inside_popup perk2";, 1 )\
		LOCAL_PERK_INFO_WINDOW\
        LOCAL_PERK_ITEM( 1, "Stopping Power Pro", "specialty_bulletdamage", "specialty_armorpiercing" )\
        LOCAL_PERK_ITEM( 2, "Lightweight Pro", "specialty_lightweight", "specialty_fastsprintrecovery" )\
		LOCAL_PERK_ITEM( 3, "Hardline Pro", "specialty_hardline", "specialty_rollover" )\
		LOCAL_PERK_ITEM( 4, "Cold-Blooded Pro", "specialty_coldblooded", "specialty_spygame" )\
		LOCAL_PERK_ITEM( 5, "Danger Close Pro", "specialty_explosivedamage", "specialty_dangerclose" )\
    }\
	menuDef {\
		IMPROVED_POPUP_SETUP_ONOPEN( "perk3_menu", 6, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" specialty_extendedmelee;set "PRO_FOCUFIRST" specialty_falldamage; set ui_inside_popup perk3";, 1 )\
		LOCAL_PERK_INFO_WINDOW\
        LOCAL_PERK_ITEM( 1, "Commando Pro", "specialty_extendedmelee", "specialty_falldamage" )\
        LOCAL_PERK_ITEM( 2, "Steady Aim Pro", "specialty_bulletaccuracy", "specialty_holdbreath" )\
		LOCAL_PERK_ITEM( 3, "Scrambler Pro", "specialty_localjammer", "specialty_delaymine" )\
		LOCAL_PERK_ITEM( 4, "Ninja Pro", "specialty_heartbreaker", "specialty_quieter" )\
		LOCAL_PERK_ITEM( 5, "SitRep Pro", "specialty_detectexplosive", "specialty_selectivehearing" )\
		LOCAL_PERK_ITEM( 6, "Last Stand Pro", "specialty_pistoldeath", "specialty_laststandoffhand" )\
    }
	
	LOCAL_PERK_GROUP( 1, -47 )
	
	 // ====================================================================================================
    // camo skin selection ================================================================================
    // ====================================================================================================
    #define LOCAL_CAMO_INFO_WINDOW \
        /* camo information side frame*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH-6) -4 280 CHOICE_POPUP_HEIGHT( 9 ) CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "white", CHOICE_POPUP_BORDER_COLOR, 1, 2, CHOICE_POPUP_BORDER_COLOR ) \
        LOADOUT_PLATING_RAW( CHOICE_POPUP_WIDTH 8, -4, -2, 280, (CHOICE_POPUP_HEIGHT( 9 )-4), CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0, 0 )\
        /* camo image*/ \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+6) 30 256 48 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "gradient_bottom", 1 1 1 0.3, 0, 2, CHOICE_POPUP_BORDER_COLOR ) \
        PREPROC_SHADER_DRAW_ALIGNED( (CHOICE_POPUP_WIDTH+72) 0 180 64 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, tablelookup("mp/camotable.csv",1,dvarString("ui_camo_highlighted"),4), 1 1 1 0.75, 1, 7, 0.2 0.2 0.225 1 ) \
        /* camo title*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 58 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/camotable.csv",1,dvarString("ui_camo_highlighted"),2), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE ) \
        /* camo desc unlocked*/\
        PREPROC_TEXT_DRAW_ALIGNED_EXP( (CHOICE_POPUP_WIDTH+10) 80 256 20 CHOICE_HORIZONTAL_ALIGN CHOICE_VERTICAL_ALIGN, 0 0, "@"+tablelookup("mp/camotable.csv",1,dvarString("ui_camo_highlighted"),3), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR visible when( 1 ) )\

    #define LOCAL_CAMO_ACTION( camoRef ) \
            play "mouse_click"; \
			close "camo_menu"; \
			scriptMenuResponse "camo,"camoRef;

    #define LOCAL_CAMO_ITEM( itemNum, camoName, camoRef, visArg )\
        CHOICE_HIGHLIGHT( itemNum, visArg ) \
        CHOICE_BUTTON_FOCUS_VIS_NOHI( itemNum, camoName, LOCAL_CAMO_ACTION( camoRef ), execnow "set ui_camo_highlighted "camoRef;, ;, visArg )  \
        execKey itemNum { LOCAL_CAMO_ACTION( camoRef ) }

    // hackaround to work for PC's floating mouse unfocusing
    #undef  UI_FOCUSFIRST
    #define UI_FOCUSFIRST "ui_camo_highlighted"
    
    // camo skin selection for primary weapon popup menu
    #define LOCAL_CAMO_GROUP( pos, y_offset )\
    menuDef \
    {\
		IMPROVED_POPUP_SETUP_ONOPEN( "camo_menu", 9, (CHOICE_X( pos )), (CHOICE_Y( pos )-y_offset), ;, execnow "set "UI_FOCUSFIRST" none; set ui_inside_popup camo";, 0 )\
        onClose{onLeave;} \
        LOCAL_CAMO_INFO_WINDOW\
        LOCAL_CAMO_ITEM( 1, "None", "none", 1 )\
        LOCAL_CAMO_ITEM( 2, "Desert", "desert", 1 )\
        LOCAL_CAMO_ITEM( 3, "Arctic", "arctic", 1 )\
        LOCAL_CAMO_ITEM( 4, "Woodland", "woodland", 1 )\
        LOCAL_CAMO_ITEM( 5, "Digital", "digital", 1 )\
        LOCAL_CAMO_ITEM( 6, "Urban", "red_urban", 1 )\
        LOCAL_CAMO_ITEM( 7, "Blue Tiger", "blue_tiger", 1 )\
        LOCAL_CAMO_ITEM( 8, "Red Tiger", "red_tiger", 1 )\
        LOCAL_CAMO_ITEM( 9, "Fall", "orange_fall", 1 )\
    }
	
	LOCAL_CAMO_GROUP( 1, 37 )
	
	// close all 2nd and 3rd layer popups on end action
    #define PREPROC_ATTACH_CLOSEALL \
    close "assault_attach_menu"; \
    close "special_assault_attach_menu"; \
    close "handgun_attach_menu"; \
	close "special_handgun_attach_menu"; \
    close "smg_attach_menu"; \
	close "special_smg_attach_menu"; \
	close "lmg_attach_menu"; \
    close "shotgun_attach_menu"; \
    close "special_shotgun_attach_menu"; \
	close "mpistol_attach_menu"; \
    close "sniper_attach_menu"; \
    close "primary_submenus"; \
    close "secondary_submenus"; \
	close "equipment_menu"; \
    close "offhand_menu"; \
    close "perk1_menu"; \
    close "perk2_menu"; \
	close "perk3_menu"; \
    close "cac_assault"; \
    close "cac_smg"; \
    close "cac_lmg"; \
	close "cac_sniper"; \
	close "cac_handgun"; \
	close "cac_machinepistol"; \
	close "cac_shotgun"; \
	close "cac_rocket"; 
	
	#include "ui/safearea_hd.menu"