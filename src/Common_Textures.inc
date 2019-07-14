// Desc: common textures
// Auth: Michael Horvath
// Home: http://isometricland.com

#default
{
	finish
	{
		ambient Ambient_Factor
		diffuse Diffuse_Factor
	}
}

// -------------------------------------------------------------
// Finishes

#declare Finish_Bright = finish
{
	diffuse 1
	ambient 1
	brilliance 1
	conserve_energy
}

#declare Finish_Stark = finish
{
	diffuse 1
	ambient 0
	brilliance 0
//	specular 0
	conserve_energy
}

#declare Finish_Normal = finish
{
	diffuse Diffuse_Factor	//0.7
	ambient Ambient_Factor	//0.3
//	brilliance 1
//	specular 0.2
//	conserve_energy
}

// use an include file here
#declare Finish_New = finish
{
	diffuse Diffuse_Factor	//0.7
	ambient Ambient_Factor	//0.3
	brilliance 1
	specular 0.2
	conserve_energy
}

#declare Default_Finish = Finish_Normal;

// -------------------------------------------------------------
// Textures

#declare Grade_Texture = texture
{
	pigment
	{
		gradient y
		color_map
		{
			[-1/4 rgbt <0,0,0,0>]
			[1    rgbt <0,0,0,1>]
		}
		scale Height
	}
	finish {Default_Finish}
}

#declare Plain_White = texture
{
	pigment {gamma_color_adjust(<1,1,1>)}
	finish {Default_Finish}
}

#declare Plain_Black = texture
{
	pigment {gamma_color_adjust(<0,0,0>)}
	finish {Default_Finish}
}

#declare Plain_Clear = texture
{
	pigment {gamma_color_adjust(<1,1,1>) transmit 1}
	finish {Default_Finish}
}

#declare Plain_Gray = texture
{
	pigment {gamma_color_adjust(<1,1,1>/2)}
	finish {Default_Finish}
}

#declare Plain_DarkGray = texture
{
	pigment {gamma_color_adjust(<1,1,1>/4)}
	finish {Default_Finish}
}

#declare Plain_VeryDarkGray = texture
{
	pigment {gamma_color_adjust(<1,1,1>/8)}
	finish {Default_Finish}
}

#declare Plain_LightGray = texture
{
	pigment {gamma_color_adjust(<1,1,1>*3/4)}
	finish {Default_Finish}
}

#declare Plain_VeryLightGray = texture
{
	pigment {gamma_color_adjust(<1,1,1>*7/8)}
	finish {Default_Finish}
}

#declare Plain_DarkGreen = texture
{
	pigment {gamma_color_adjust(<073,116,060,>/255)}
	finish {Default_Finish}
}

#declare Plain_Brown = texture
{
	pigment {gamma_color_adjust(<098,064,030,>/255)}
	finish {Default_Finish}
}

#declare Plain_Beige = texture
{
	pigment {gamma_color_adjust(<140,123,093,>/255)}
	finish {Default_Finish}
}

#declare Plain_Red = texture
{
	pigment {gamma_color_adjust(<255,000,000,>/255)}
	finish {Default_Finish}
}

#declare Plain_MedRed = texture
{
	pigment {gamma_color_adjust(<128,000,000,>/255)}
	finish {Default_Finish}
}

#declare Plain_QrtRed = texture
{
	pigment {gamma_color_adjust(<192,000,000,>/255)}
	finish {Default_Finish}
}

#declare Plain_LightRed = texture
{
	pigment {gamma_color_adjust(<192,000,000,>/255)}
	finish {Default_Finish}
}


#declare Plain_Green = texture
{
	pigment {gamma_color_adjust(<000,255,000,>/255)}
	finish {Default_Finish}
}

#declare Plain_MedGreen = texture
{
	pigment {gamma_color_adjust(<000,128,000,>/255)}
	finish {Default_Finish}
}

#declare Plain_QrtGreen = texture
{
	pigment {gamma_color_adjust(<000,192,000,>/255)}
	finish {Default_Finish}
}

#declare Plain_DarkAqua = texture
{
	pigment {gamma_color_adjust(<064,096,096,>/255)}
	finish {Default_Finish}
}

#declare Plain_Blue = texture
{
	pigment {gamma_color_adjust(<000,000,255,>/255)}
	finish {Default_Finish}
}

#declare Plain_DarkBlue = texture
{
	pigment{gamma_color_adjust(<000,000,136,>/255)}
	finish {Default_Finish}
}

#declare Plain_DarkSteelBlue = texture
{
	pigment{gamma_color_adjust(<064,064,128,>/255)}
	finish {Default_Finish}
}

#declare Plain_Yellow = texture
{
	pigment {gamma_color_adjust(<255,255,000,>/255)}
	finish {Default_Finish}
}

#declare Plain_MedYellow = texture
{
	pigment {gamma_color_adjust(<128,128,000,>/255)}
	finish {Default_Finish}
}

#declare Plain_QrtYellow = texture
{
	pigment {gamma_color_adjust(<224,224,000,>/255)}
	finish {Default_Finish}
}

#declare Plain_Pink = texture
{
	pigment {gamma_color_adjust(<191,064,095,>/255)}
	finish {Default_Finish}
}

#declare Plain_Magenta = texture
{
	pigment {gamma_color_adjust(<255,000,255,>/255)}
	finish {Default_Finish}
}
#declare Plain_Orange = texture
{
	pigment {gamma_color_adjust(<255,128,000,>/255)}
	finish {Default_Finish}
}
#declare Plain_Violet = texture
{
	pigment {gamma_color_adjust(<128,128,255,>/255)}
	finish {Default_Finish}
}

#if (Rand_Colors)
	#declare MTX = texture {pigment {gamma_color_adjust(<rand(Seed),rand(Seed),rand(Seed),>)} finish {F_MetalA}};
	#declare CTX = texture {pigment {gamma_color_adjust(<rand(Seed),rand(Seed),rand(Seed),>)} finish {F_MetalA}};
	#declare HTX = texture {pigment {gamma_color_adjust(<rand(Seed),rand(Seed),rand(Seed),>)} finish {F_MetalA}};
	#declare GTX = texture {Plain_Gray		finish {F_MetalA}};
	#declare BTX = texture {Plain_VeryDarkGray	finish {F_MetalA}};
	#declare WTX = texture {Plain_VeryLightGray	finish {F_MetalA}};
#else
	#declare MTX = Plain_QrtRed;
	#declare CTX = Plain_QrtGreen;
	#declare HTX = Plain_QrtYellow;
	#declare GTX = Plain_Gray;
	#declare BTX = Plain_VeryDarkGray;
	#declare WTX = Plain_VeryLightGray;
#end

#declare MMT = material {texture {MTX}}
#declare CMT = material {texture {CTX}}
#declare HMT = material {texture {HTX}}
#declare GMT = material {texture {GTX}}
#declare BMT = material {texture {BTX}}
#declare WMT = material {texture {WTX}}
