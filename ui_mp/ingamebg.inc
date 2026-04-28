// background overlay
itemDef
{
	style			WINDOW_STYLE_FILLED
	rect			0 0 640 480 HORIZONTAL_ALIGN_FULLSCREEN VERTICAL_ALIGN_FULLSCREEN
	backcolor		0 0 0 0.75
	visible			1
	decoration
}

// gradient_top
itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			0 0 0 0 HORIZONTAL_ALIGN_FULLSCREEN 0
	background		"gradient_top"
	visible			1
	decoration
}

// gradient_bottom
itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			0 0 0 0 HORIZONTAL_ALIGN_FULLSCREEN 0
	background		"gradient_bottom"
	visible			1
	decoration
}

#ifndef BACKGROUND_PC_OPTIONS
#ifdef BACKGROUND_SP
BACKGROUND_IMAGE("mw2_main_sp_image")
#endif

#ifdef BACKGROUND_CO
BACKGROUND_IMAGE("mw2_main_co_image")
#endif

#ifdef BACKGROUND_MP
BACKGROUND_IMAGE("mw2_main_mp_image")
#endif

#ifdef BACKGROUND_IW4
BACKGROUND_IMAGE("mw2_main_mp_image")
#endif
#endif