"Resource/UI/HudItemEffectMeter.res"
{
	HudItemEffectMeter
	{
		"fieldName"			"HudItemEffectMeter"
		"visible"			"1"
		"enabled"			"1"
		"xpos"				"c-50"
		"ypos"				"r94"
		"ypos_minmode"		"c+94"
		"wide"				"100"
		"tall"				"12"
		"MeterFG"			"White"
		"MeterBG"			"Gray"
	}
	
	"OutlineBorder"
	{	
		"ControlName"			"EditablePanel"
		"fieldName"				"OutlineBorder"
		"font"					"Default"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"100"
		"wide"					"100"
		"tall"					"10"			
		"visible"				"1"
		"enabled"				"1"
		"paintborder"			"1"
		"border"				"G_MeterBorder"
	}
	
	"ItemEffectMeterLabel"
	{
		"ControlName"			"CExLabel"
		"fieldName"				"ItemEffectMeterLabel"
		"xpos"					"0"
		"ypos"					"4"
		"zpos"					"10"
		"wide"					"100"
		"tall"					"8"
		"autoResize"			"0"
		"pinCorner"				"2"
		"visible"				"1"
		"enabled"				"1" // 0 = Black label text!
		"tabPosition"			"0"
		"labelText"				"#TF_BALL"
		"textAlignment"			"center"
		"dulltext"				"0"
		"brighttext"			"0"
		"font"					"Mine"
		"fgcolor_override"		"155 155 155 255"
		"textinsety"			"-1"
	}
	
	"ItemEffectMeter"
	{	
		"ControlName"			"ContinuousProgressBar"
		"fieldName"				"ItemEffectMeter"
		"font"					"Default"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"2"
		"wide"					"100"
		"tall"					"3"		
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"textAlignment"			"Left"
		"dulltext"				"0"
		"brighttext"			"0"
		"bgcolor_override"		"G_ItemMeterBg"
		"paintborder"			"0"
	}
	
}