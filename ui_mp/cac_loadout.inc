	#define LOADOUT_WIDTH           305

	#define ORIGIN_LOADOUT_X				(-(LOADOUT_WIDTH - RIGHTITEM_OFFSET))
	#define ORIGIN_LOADOUT_Y				-10
	#define ORIGIN_LOADOUT         			ORIGIN_LOADOUT_X ORIGIN_LOADOUT_Y

/* ================================================================================= */
/* ================================ LOADOUT DISPLAY ================================ */
/* ================================================================================= */

// CAC loadout main frame =================

    #define LOADOUT_ALIGN   RIGHTITEM_ALIGN VERTICAL_ALIGN_TOP    
    
    #define LOADOUT_PLATING( py, ph, vis_gradient_top, vis_gradient_bottom ) \
            LOADOUT_PLATING_RAW( ORIGIN_LOADOUT, 0, py, (LOADOUT_WIDTH+8), ph, LOADOUT_ALIGN, vis_gradient_top, vis_gradient_bottom )
        
    // background frame --------
    PREPROC_SHADER_DRAW_ALIGNED( -24 8 -20 368 LOADOUT_ALIGN, ORIGIN_LOADOUT, "gradient", 1 1 1 0.65, 0, 0, 0 0 0 0 )
    PREPROC_SHADER_DRAW_ALIGNED( (LOADOUT_WIDTH+4) 8 20 368 LOADOUT_ALIGN, ORIGIN_LOADOUT, "gradient", 1 1 1 0.65, 0, 0, 0 0 0 0 )

    // primary weapon camo
    PREPROC_SHADER_DRAW_ALIGNED( -4 16 (LOADOUT_WIDTH+8) 80 LOADOUT_ALIGN, ORIGIN_LOADOUT, STAT_CAC_CAMO, 1 1 1 1, 0, 1, 1 1 1 1) 
	/* creator */			LOADOUT_PLATING( -19, 8, 1, 1 )
    /* top bar */           LOADOUT_PLATING( 16, 8, 1, 1 )
    /* weapon divider */    LOADOUT_PLATING( 104, 8, 1, 1 )
    /* grenade plate */     LOADOUT_PLATING( 188, 8, 1, 1 )
	/* bottom bar */        LOADOUT_PLATING( 225, 8, 1, 1 )
	/* Perk 1 */        	LOADOUT_PLATING( 275, 8, 1, 1 )
	/* Perk 2 */        	LOADOUT_PLATING( 325, 8, 1, 1 )
	/* Perk 3 */        	LOADOUT_PLATING( 375, 8, 1, 1 )


// weapon loadout info display ============
	// by zetiq
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 95 -15 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@" + "#CAUCHEMAR", TEXTSIZE_TITLE, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
    // primary weapon name
    PREPROC_TEXT_DRAW_ALIGNED_EXP( 0 20 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@"+tablelookup("mp/statstable.csv", 0, STAT_CAC_PRIMARY, 3), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE)
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 0 20 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@"+tablelookup("mp/statstable.csv", 0, STAT_CAC_PRIMARY, 3), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE)
    // primary weapon attachment name
    //PREPROC_TEXT_DRAW_ALIGNED_EXP( 0 74 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@"+tablelookup("mp/attachmenttable.csv", 9, STAT_CAC_PRIMARY_ATTACHMENT, 3), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
    // primary weapon image
    PREPROC_SHADER_DRAW_ALIGNED( 135 10 180 90 LOADOUT_ALIGN, ORIGIN_LOADOUT, tablelookup( "mp/statstable.csv", 0, STAT_CAC_PRIMARY, 6 ), 1 1 1 1, 0, 1, 1 1 1 1) 
    // primary weapon attachment image
    PREPROC_SHADER_DRAW_ALIGNED( 2 50 32 32 LOADOUT_ALIGN, ORIGIN_LOADOUT, tablelookup( "mp/attachmenttable.csv", 9, STAT_CAC_PRIMARY_ATTACHMENT, 6 ), 1 1 1 1, 0, 1, 1 1 1 1)  
	PREPROC_SHADER_DRAW_ALIGNED( 42 50 32 32 LOADOUT_ALIGN, ORIGIN_LOADOUT, tablelookup( "mp/attachmenttable.csv", 9, STAT_CAC_PRIMARY_SECOND_ATTACHMENT, 6 ), 1 1 1 1, 0, 1, 1 1 1 1 visible when( getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 1 ) == "specialty_bling" ) )
  
    // second weapon name
    PREPROC_TEXT_DRAW_ALIGNED_EXP( 0 108 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@" + tablelookup("mp/statstable.csv", 0, STAT_CAC_SECONDARY, 3), TEXTSIZE_DEFAULT, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE )
    // second weapon attachment name
    //PREPROC_TEXT_DRAW_ALIGNED_EXP( 0 162 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@"+tablelookup("mp/attachmenttable.csv", 9, STAT_CAC_SECONDARY_ATTACHMENT, 3), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
    // second weapon image
    PREPROC_SHADER_DRAW_ALIGNED( 135 98 180 90 LOADOUT_ALIGN, ORIGIN_LOADOUT, tablelookup( "mp/statstable.csv", 0, STAT_CAC_SECONDARY, 6 ), 1 1 1 1, 0, 1, 1 1 1 1) 
    // second weapon attachment image
    PREPROC_SHADER_DRAW_ALIGNED( 2 138 32 32 LOADOUT_ALIGN, ORIGIN_LOADOUT, tablelookup( "mp/attachmenttable.csv", 9, STAT_CAC_SECONDARY_ATTACHMENT, 6 ), 1 1 1 1, 0, 1, 1 1 1 1)
	PREPROC_SHADER_DRAW_ALIGNED( 42 138 32 32 LOADOUT_ALIGN, ORIGIN_LOADOUT, tablelookup( "mp/attachmenttable.csv", 9, STAT_CAC_SECONDARY_SECOND_ATTACHMENT, 6 ), 1 1 1 1, 0, 1, 1 1 1 1 visible when( getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 1 ) == "specialty_bling" ) )
	
	// grenade text  ------------
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 35 192 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@" + tablelookup( "mp/perkTable.csv" , 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 0 ) , 2 ), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
    // grenade icons ------------
    PREPROC_SHADER_DRAW_ALIGNED( 5 192 22 22 LOADOUT_ALIGN, ORIGIN_LOADOUT, STAT_CAC_SPECIAL_GRENADE, 1 1 1 1, 0, 1, 1 1 1 1) 
	// offhand text  ------------
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 160 192 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, locstring( "@MPUI_N_XN" ,"@" + tablelookup( "mp/statsTable.csv" , 4 , getplayerdata( "customClasses" , localVarInt("classIndex") , "specialGrenade" ) , 3 ), int( tablelookup( "mp/statsTable.csv" , 4 , getplayerdata( "customClasses" , localVarInt("classIndex") , "specialGrenade" ) , 5 ) ) ), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
	// offhand icons ------------
    PREPROC_SHADER_DRAW_ALIGNED( 130 192 22 22 LOADOUT_ALIGN, ORIGIN_LOADOUT, STAT_CAC_OFFHAND, 1 1 1 1, 0, 1, 1 1 1 1) 
	
	// perk 1 text  ------------
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 55 225 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@" + tablelookup( "mp/perkTable.csv" , 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 1 ) , 9 ), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 55 240 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@" + tablelookup( "mp/perkTable.csv" , 1 , tablelookup ("mp/perkTable.csv", 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 1 ), 8) , 4 ), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
	// perk 1 icon  ------------
    PREPROC_SHADER_DRAW_ALIGNED( 5 225 40 40 LOADOUT_ALIGN, ORIGIN_LOADOUT, STAT_CAC_PERK1, 1 1 1 1, 0, 1, 1 1 1 1) 
	
	// perk 2 text  ------------
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 55 275 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@" + tablelookup( "mp/perkTable.csv" , 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 2 ) , 9 ), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 55 290 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@" + tablelookup( "mp/perkTable.csv" , 1 , tablelookup ("mp/perkTable.csv", 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 2 ), 8) , 4 ), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
	// perk 2 icon  ------------
    PREPROC_SHADER_DRAW_ALIGNED( 5 275 40 40 LOADOUT_ALIGN, ORIGIN_LOADOUT, STAT_CAC_PERK2, 1 1 1 1, 0, 1, 1 1 1 1) 
	
	// perk 3 text  ------------
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 55 325 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@" + tablelookup( "mp/perkTable.csv" , 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 3 ) , 9 ), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
	PREPROC_TEXT_DRAW_ALIGNED_EXP( 55 340 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, "@" + tablelookup( "mp/perkTable.csv" , 1 , tablelookup ("mp/perkTable.csv", 1 , getplayerdata( "customClasses" , localVarInt("classIndex") , "perks" , 3 ), 8) , 4 ), TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, CHOICE_TEXTCOLOR )
	// perk 3 icon  ------------
	PREPROC_SHADER_DRAW_ALIGNED( 5 325 40 40 LOADOUT_ALIGN, ORIGIN_LOADOUT, STAT_CAC_PERK3, 1 1 1 1, 0, 1, 1 1 1 1) 

    // grenade counts ------------
    //PREPROC_TEXT_DRAW_ALIGNED_EXP( 0 192 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, 1, TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE visible when( 1) )
    //PREPROC_TEXT_DRAW_ALIGNED_EXP( 40 192 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, 1, TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE visible when(1) )
	//PREPROC_TEXT_DRAW_ALIGNED_EXP( 40 192 (LOADOUT_WIDTH+8) 20 LOADOUT_ALIGN, ORIGIN_LOADOUT, 1, TEXTSIZE_SMALL, 0, 0, ITEM_ALIGN_MIDDLE_LEFT, COLOR_TITLE visible when(1) )	
  
