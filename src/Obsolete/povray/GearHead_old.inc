// Desc: GearHead basic scene description
// Auth: Michael Horvath
// Home: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm
// Last Updated: 07/31/06

// Notes:
// Old values: Lights_Method = 5; Ambient_Factor = 1/3; Diffuse_Factor = 0.6; Lights_Intensity = 1; Use_Radiosity = 0;
// Oldest values: Lights_Method = 1; Ambient_Factor = 1/3; Diffuse_Factor = 1.0; Lights_Intensity = 1; Use_Radiosity = 0;
// Light_Intensity should generally be halved for mecha. (Colors tend to be a bit brighter after GearHead does its palette-swapping.)
// Another OK set is: Lights_Method = 5; Ambient_Factor = 1/3; Diffuse_Factor = 0.5; Lights_Intensity = 1; Use_Radiosity = 1;

// Standard includes
#include "stdinc.inc"
#include "textures.inc"
#include "woods.inc"
#include "stones.inc"
#include "glass.inc"
#include "metals.inc"

//0.7//1.0
//1.4//0.3
//2.0//0.7

// Default values: these can be redeclared in your scene.
#ifndef (Seed) #declare Seed = seed(8829464); #end		// the default seed value for random functions.
#ifndef (Width) #declare Width = 64; #end			// the default width of a tile.
#ifndef (Height) #declare Height = 80; #end			// the default Height of a tile.
#ifndef (Cols) #declare Cols = 4; #end				// the default number of columns of bricks.
#ifndef (Rows) #declare Rows = 12; #end				// the default number of rows of bricks.
#ifndef (Tiles) #declare Tiles = 1; #end			// the default size of the scene, measured in tiles. Use this to zoom in/out.
#ifndef (Rotate) #declare Rotate = 0; #end			// the default camera y-axis rotation angle. By default the camera points in the negative X and negative Z direction.
#ifndef (Lights_Method) #declare Lights_Method = 9; #end	// the default lighting scheme.
#ifndef (Lights_Intensity) #declare Lights_Intensity = 0.7; #end	// a modifier of light intensity (multiply by 1/2 for mecha)
#ifndef (Ambient_Factor) #declare Ambient_Factor = 0.0; #end	// the default proportion of light within the scene that originates from ambient sources. (note: both the texture and light source must support this.) (default is 0.2. 1/3 is good; multiply by 1/2 for mecha)
#ifndef (Diffuse_Factor) #declare Diffuse_Factor = 0.7; #end	// the default value for Diffuse (default is 0.6. 0.5 is good if radiosity is on.)
#ifndef (Use_Radiosity) #declare Use_Radiosity = 1; #end	// turns radiosity on/off (recommend leaving this off. have to decrease diffuse if it is on.)
#ifndef (Use_Shadows) #declare Use_Shadows = 1; #end		// turns shadows on/off (recommend turning this off for walls that are always covered by rooves.)
#ifndef (Use_Isometric) #declare Use_Isometric = 1; #end	// turns the orthographic camera on/off.
#ifndef (Show_GridMarker) #declare Show_GridMarker = 0; #end	// use this to orient the sprite within a template
#ifndef (Show_BasicFloor) #declare Show_BasicFloor = 0; #end	// renders a plain, 1-tile floor beneath the scene.
#ifndef (Show_AxisMarker) #declare Show_AxisMarker = 0; #end	// renders crosshairs in the center of the scene
#ifndef (Sprite_Height) #declare Sprite_Height = 128; #end	// changes the camera's position. 0 for mecha, 1 for walls & terrain.
#ifndef (Scale_LDraw) #declare Scale_LDraw = 3/4; #end		// scales LDraw models by an additional amont


// -------------------------------------------------------------
// Sets direction based on the clock value.

#declare Count = clock * 16;
#declare No1 = mod(Count,4);
#declare No2 = floor(Count/4);
#if ((No1 = 1) | (No1 = 3))
	#ifndef (North) #declare North = true; #end		// Is the object connected on this side?
#else
	#ifndef (North) #declare North = false; #end
#end
#if ((No1 = 2) | (No1 = 3))
	#ifndef (East) #declare East  = true; #end		// ...
#else
	#ifndef (East) #declare East  = false; #end
#end
#if ((No2 = 1) | (No2 = 3))
	#ifndef (South) #declare South = true; #end		// ...
#else
	#ifndef (South) #declare South = false; #end
#end
#if ((No2 = 2) | (No2 = 3))
	#ifndef (West) #declare West  = true; #end		// ...
#else
	#ifndef (West) #declare West  = false; #end
#end


// -------------------------------------------------------------
// Misc. scene settings

#if (Use_Radiosity = 1)
	background {rgb 1}					// a white background
	global_settings
	{
		radiosity
		{
//			always_sample off
//			brightness 0.3
		}
		ambient_light color rgb 0
	}
#else
	background {color rgb <0, 0, 1,>}			// the scene background color
	global_settings
	{
		ambient_light color rgb Ambient_Factor
	}
#end

/*
// heavy fog
fog
{
	fog_type 2
	color rgb <.7, .8, .9>
	distance 300
	fog_alt 50
}
*/


// -------------------------------------------------------------
// Camera

#declare Camera_Scale = 4;
#declare Diagonal = cos(radians(45)) * 64;
#declare Camera_Location = vaxis_rotate(<1, 0, 1,>, <-1, 0, 1,>, 30) * Diagonal * Tiles;
#declare Camera_Location = Camera_Location * Camera_Scale;
#declare Camera_Location = Camera_Location + <(32-Sprite_Height) * Tiles, 0, (32-Sprite_Height) * Tiles>;
#declare Camera_Location = vaxis_rotate(Camera_Location, y, Rotate);
#declare Camera_LookAt = 0;
#declare Camera_LookAt = Camera_LookAt + <(32-Sprite_Height) * Tiles, 0, (32-Sprite_Height) * Tiles>;
#declare Camera_LookAt = vaxis_rotate(Camera_LookAt, y, Rotate);

camera
{
	#if (Use_Isometric = true)
		orthographic
	#end
	sky y
	up y * Diagonal * Tiles * image_height / image_width * 2
	right x * Diagonal * Tiles * 2
	location Camera_Location
	look_at Camera_LookAt
}


// -------------------------------------------------------------
// Lights. there are several methods inconsistantly used within GearHead. I try and mimic them here.

#switch (Lights_Method)
	// similar to #5
	#case (9)
		light_source
		{
		        -z * 1000
			color rgb (255 - 255 * Ambient_Factor)/255 * Lights_Intensity
		        rotate x * 75
		        rotate y * 240
			parallel
		        point_at 0
		        #if (Use_Shadows = 0)
		        	shadowless
		        #end
		}
	#break
#end


// -------------------------------------------------------------
// Textures

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
	diffuse Diffuse_Factor
	ambient 0.3
//	brilliance 1
//	specular 0.2
	conserve_energy
}

// Use with Lights_Method = 5, Ambient_Factor = 0.2
#declare Finish_Tweak = finish
{
	diffuse 0.6
	ambient 0.2/Ambient_Factor
	brilliance 1
//	specular 0.0005
	conserve_energy
}

//#declare Default_Finish = Finish_Ambient;
#declare Default_Finish = Finish_Normal;

#declare Plain_White = texture
{
	pigment{color rgb 1}
	finish {Default_Finish}
}

#declare Plain_Black = texture
{
	pigment{color rgb 0}
	finish {Default_Finish}
}

#declare Plain_Clear = texture
{
	pigment{color rgbt 1}
	finish {Default_Finish}
}

#declare Plain_Gray = texture
{
	pigment{color rgb 1/2}
	finish {Default_Finish}
}

#declare Plain_DarkGray = texture
{
	pigment{color rgb 1/4}
	finish {Default_Finish}
}

#declare Plain_LightGray = texture
{
	pigment{color rgb 3/4}
	finish {Default_Finish}
}

#declare Plain_DarkGreen = texture
{
	pigment{color rgb <073,116,060,>/255}
	finish {Default_Finish}
}

#declare Plain_DarkBlue = texture
{
	pigment{color rgb <000,000,136,>/255}
	finish {Default_Finish}
}

#declare Plain_Brown = texture
{
	pigment{color rgb <098,064,030,>/255}
	finish {Default_Finish}
}

#declare Plain_Beige = texture
{
	pigment{color rgb <140,123,093,>/255}
	finish {Default_Finish}
}

#declare Plain_Red = texture
{
	pigment{color rgb <255,000,000,>/255}
	finish {Default_Finish}
}

#declare Plain_MedRed = texture
{
	pigment{color rgb <128,000,000,>/255}
	finish {Default_Finish}
}

#declare Plain_QrtRed = texture
{
	pigment{color rgb <192,000,000,>/255}
	finish {Default_Finish}
}

#declare Plain_Green = texture
{
	pigment{color rgb <000,255,000,>/255}
	finish {Default_Finish}
}

#declare Plain_MedGreen = texture
{
	pigment{color rgb <000,128,000,>/255}
	finish {Default_Finish}
}

#declare Plain_QrtGreen = texture
{
	pigment{color rgb <000,192,000,>/255}
	finish {Default_Finish}
}

#declare Plain_Blue = texture
{
	pigment{color rgb <000,000,255,>/255}
	finish {Default_Finish}
}

#declare Plain_Yellow = texture
{
	pigment{color rgb <255,255,000,>/255}
	finish {Default_Finish}
}

#declare Plain_MedYellow = texture
{
	pigment{color rgb <128,128,000,>/255}
	finish {Default_Finish}
}

#declare Plain_QrtYellow = texture
{
	pigment{color rgb <224,224,000,>/255}
	finish {Default_Finish}
}

#declare Plain_Pink = texture
{
	pigment{color rgb <191,064,095,>/255}
	finish {Default_Finish}
}

#declare Plain_Magenta = texture
{
	pigment{color rgb <255,000,255,>/255}
	finish {Default_Finish}
}

#declare Main_Texture = Plain_QrtRed
#declare Complement_Texture = Plain_QrtGreen
#declare Highlight_Texture = Plain_QrtYellow
#declare MTX = Main_Texture;
#declare CTX = Complement_Texture;
#declare HTX = Highlight_Texture;


// -------------------------------------------------------------
// Orientation markers

#declare Axis_Markers = union
{
	sphere
	{
		0,1
		pigment{color rgb <0,0,0,>}
	}
	cylinder
	{
		0,x*Width/2,1
		pigment{color rgb <1,0,0,>}
	}
	cylinder
	{
		0,y*Width/2,1
		pigment{color rgb <0,1,0,>}
	}
	cylinder
	{
		0,z*Width/2,1
		pigment{color rgb <0,0,1,>}
	}
}

#declare Grid_Marker = polygon
{
	#local Wid = Width/2;
	#local NW = <0000,+000,-Wid,>;
	#local NE = <-Wid,+000,-Wid,>;
	#local SE = <-Wid,+000,0000,>;
	#local SW = <-Wid/2,+000,-Wid/2,>;
	4, NW, NE, SE, SW
	translate x * Width
	translate z * Width
}

#declare Basic_Floor = polygon
{
	#local Wid = Width/2;
	#local NW = <+Wid,+000,-Wid,>;
	#local NE = <-Wid,+000,-Wid,>;
	#local SE = <-Wid,+000,+Wid,>;
	#local SW = <+Wid,+000,+Wid,>;
	4, NW, NE, SE, SW
}

#declare Clip_Cylinder = cylinder
{
	#local Hgh = 24 / sin(pi/3);
	#local Rad = cos(pi/4) * Width;
	0, y * Hgh, Rad
	scale y * 2
}

#if (Show_AxisMarker = 1)
	object
	{
		Axis_Markers
	}
#end

#if (Show_GridMarker = 1)
	object
	{
		Grid_Marker
		uv_mapping
		texture{Plain_Magenta}
	}
#end

#if (Show_BasicFloor = 1)
	object
	{
		Basic_Floor
		uv_mapping
		texture{Plain_White}
	}

#end


// -------------------------------------------------------------
// Misc. Macros

#if (version >= 3.1)
	#macro PrintValue(Text, Value)
		#debug concat(Text, str(Value,0,-1),"\n")
	#end
	#macro RandSign(Stream)
		#local TempVar = 1;
		#if (rand(Stream) < 0.5)
			#local TempVar = -1;
		#else
			#local TempVar = 1;
		#end
		PrintValue("RandSign = ", TempVar)
		TempVar
	#end
#end
