// Desc: GearHead basic scene description
// Auth: Michael Horvath
// Home: http://isometricland.net
// Created:
// Updated: 2016/02/16
// Dependencies:
//   1. LightSysIV, http://www.ignorancia.org/en/index.php?page=Lightsys
//   2. VEG.INC, by Joerg Schrammel and Stig Bachmann Nielsen.
//   3. sphere.inc, by Shuhei Kawachi
//   4. makerock.inc, by John van Sickle and Bob Hughes
//   5. grasspatch.inc, by Josh English


// -------------------------------------------------------------
// Standard includes

#version 3.7;

#include "stdinc.inc"
#include "textures.inc"
#include "woods.inc"
#include "stones.inc"
#include "glass.inc"
#include "metals.inc"
#include "functions.inc"
#include "CIE.inc"			// http://www.ignorancia.org/en/index.php?page=Lightsys
#include "lightsys.inc"			// http://www.ignorancia.org/en/index.php?page=Lightsys
#include "lightsys_constants.inc"	// http://www.ignorancia.org/en/index.php?page=Lightsys


// -------------------------------------------------------------
// Default values. These can be pre-declared in your scene.

#ifndef (Seed) #declare Seed = seed(8829464); #end			// the default seed value for random functions.
#ifndef (FrameSeed) #declare FrameSeed = seed(8829464 * frame_number); #end			// the default seed value for random functions.
#ifndef (Width)	#declare Width = 64; #end				// the default width of a tile.
#ifndef (Height) #declare Height = 80; #end				// the default Height of a tile. 80 = old style, 57 = short style
#ifndef (WallThick) #declare WallThick = Width/4; #end			// broken or not implemented properly
#ifndef (WallStretch) #declare WallStretch = (Width-WallThick)/2; #end	// broken or not implemented properly
#ifndef (Cols) #declare Cols = 4; #end					// the default number of columns of bricks.
#ifndef (Rows) #declare Rows = 12; #end					// the default number of rows of bricks.
#ifndef (Tiles) #declare Tiles = 1; #end				// the default size of the scene, measured in tiles. Use this to zoom in/out.
#ifndef (Rotate) #declare Rotate = 0; #end				// the default camera y-axis rotation angle. By default the camera points in the negative X and negative Z direction.
#ifndef (Lights_Method) #declare Lights_Method = 4; #end		// obsolete. the default lighting scheme. (default 1)
#ifndef (Lights_Intensity) #declare Lights_Intensity = 0.7; #end	// obsolete. a modifier of light intensity (multiply by 1/2 for mecha)
#ifndef (Ambient_Factor) #declare Ambient_Factor = 0.1; #end		// the default proportion of light within the scene that originates from ambient sources. (note: both the texture and light source must support this.) (default is 0.2. 1/3 is good; multiply by 1/2 for mecha)
#ifndef (Diffuse_Factor) #declare Diffuse_Factor = 0.9; #end		// the default value for Diffuse (default is 0.6. 0.5 is good if radiosity is on.)
#ifndef (Use_Radiosity) #declare Use_Radiosity = 0; #end		// turns radiosity on/off. (Recommend leaving this off. have to decrease diffuse if it is on.)
#ifndef (Use_Shadows) #declare Use_Shadows = 1; #end			// turns shadows on/off. (Recommend turning this off for walls that are always covered by a roof.) Not used often.
#ifndef (Use_Isometric) #declare Use_Isometric = 1; #end		// turns orthographic projection on/off. (Required by certain special effects.) Not used often.
#ifndef (Show_GridMarker) #declare Show_GridMarker = 0; #end		// use this to orient the sprite within a template
#ifndef (Show_BasicFloor) #declare Show_BasicFloor = 0; #end		// renders a plain, 1-tile floor beneath the scene.
#ifndef (Show_BasicCube) #declare Show_BasicCube = 0; #end		// renders a plain, 1-tile white cube for lighting testing.
#ifndef (Show_AxisMarker) #declare Show_AxisMarker = 0; #end		// renders crosshairs in the center of the scene
#ifndef (Show_HeightScale) #declare Show_HeightScale = 0; #end		// renders a plane that show height in meters.
#ifndef (Show_CeilingMask) #declare Show_CeilingMask = 1; #end		// for walls, turns the top surface of the wall black
#ifndef (Bitmap_Height) #declare Bitmap_Height = 128; #end		// changes the camera's position. 0 for mecha, 1 for walls & terrain.
#ifndef (Scale_Mecha) #declare Scale_Mecha = 3/4; #end			// scales non-LDraw mecha by an additional amount
#ifndef (Scale_LDraw) #declare Scale_LDraw = Scale_Mecha * 4/5; #end	// scales LDraw mecha by an additional amount
#ifndef (Subdivision) #declare Subdivision = 0; #end			// turn on/off mesh subdivision. This requires a special EXE available on the Internet.
#ifndef (Camera_Mode) #declare Camera_Mode = 1; #end
#ifndef (Rand_Colors) #declare Rand_Colors = 0; #end
#ifndef (Nice_Render) #declare Nice_Render = 0; #end
#ifndef (BG_Color) #declare BG_Color = -1; #end				// 0 = black, 1 = blue, -1 = transparent
#ifndef (Meters) #declare Meters = Width; #end
#declare Lightsys_Scene_Scale	= Meters * 100;
#declare light_lumens	= 2;						// float
#declare light_temp	= Daylight(6100);				// float
#declare light_color	= Light_Color(light_temp,light_lumens);		// vector

global_settings
{
	assumed_gamma 1.0
}


// -------------------------------------------------------------
// Misc. Macros

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

// used to convert pigments created in version 3.6 to version 3.7
#macro gamma_color_adjust(in_color)
	color srgbft in_color + <0,0,0,0,0>
#end

#macro Populate_Hyperbola(PopObject, MaxCount, RandSeed, Flip)
	union
	{
		#local Count = 0;
		#while (Count < MaxCount)
			#local T_Value = rand(RandSeed);
			#local U_Value = rand(RandSeed);
			object
			{
				PopObject
				scale Height
				rotate y * rand(RandSeed) * 360
				translate x * (T_Value * U_Value * Width - Width/2)
				translate z * ((1 - T_Value) * (1 - U_Value) * Width - Width/2)
//				translate x * Width * T_Value * cos(U_Value * pi / 2)
//				translate z * Width * T_Value * sin(U_Value * pi / 2)
				rotate y * (Flip * 180)
			}
			#local Count = Count + 1;
		#end
		clipped_by
		{
			box {<-Width,0,-Width,>,<Width,1000,Width,>}
		}
	}
#end

#macro Populate_Triangle(PopObject, MaxCount, RandSeed, Flip)
	union
	{
		#local old_points = array[MaxCount];
		#local Count = 0;
		#while (Count < MaxCount)
			#local T_Value = rand(RandSeed);
			#local U_Value = rand(RandSeed);
			#if ((T_Value + U_Value < 1) & (T_Value < 7/8) & (T_Value > 1/8) & (U_Value < 7/8) & (U_Value > 1/8))
				#local Point_new = <T_Value * Width - Width/2,0,U_Value * Width - Width/2>;
				#local bPass = 1;
				#if (Count > 0)
					#for (i, 0, Count-1)
						#local Point_old = old_points[i];
						#if (VDist(Point_old, Point_new) < Width/8)
							#local bPass = 0;
							#break
						#end
					#end
				#end
				#if (bPass = 1)
					object
					{
						PopObject
	//					sphere {0,1/20 pigment {color rgb x}}
						scale (rand(RandSeed) * 1/4 + 3/4)
						scale Height
						rotate y * rand(RandSeed) * 360
						translate Point_new
					}
					#local old_points[Count] = Point_new;
					#local Count = Count + 1;
				#end
			#end
		#end
		finish {Default_Finish}
		rotate y * Flip * 180
		clipped_by
		{
			box {<-Width,0,-Width,>,<+Width,1000,+Width,>}
		}
	}
#end

#macro vanglesXY(tVec2)
	#local fSgnX = 1;
	#local fSgnY = 1;
	#local tPrjB1 = vnormalize(<tVec2.x, 0, tVec2.z>);
	#if (tPrjB1.x != 0)
		#local fSgnX = tPrjB1.x/abs(tPrjB1.x) * -1;
	#end
	#local tPrjB1 = <tPrjB1.x,tPrjB1.y,max(min(tPrjB1.z,1),-1)>;
	#local fAngY = acosd(tPrjB1.z) * fSgnX;
	#local tPrjB2 = vnormalize(vrotate(tVec2, <0, fAngY, 0,>));
	#if (tPrjB2.y != 0)
		#local fSgnY = tPrjB2.y/abs(tPrjB2.y);
	#end
	#local tPrjB2 = <tPrjB2.x,tPrjB2.y,max(min(tPrjB2.z,1),-1)>;
	#local fAngX = acosd(tPrjB2.z) * fSgnY;
	<fAngX * -1, fAngY * -1, 0>
#end


// -------------------------------------------------------------
// Additional includes

#include "Common_Textures.inc"

// -------------------------------------------------------------
// Set direction based on the clock value.
// North is toward the top-left by default.
// +x is toward the bottom-left by default.
// +y is up by default.
// +z is toward the bottom-right by default.

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
	global_settings
	{
		radiosity
		{
			always_sample off
			brightness 0.3
		}
		ambient_light 0.0
		charset utf8
	}
#else
	global_settings
	{
		ambient_light 0.3
		charset utf8
	}
#end

// -------------------------------------------------------------
// Camera

#switch (Camera_Mode)
	// isometric, 3/4
	#case (1)
		#declare Camera_Diagonal	= cosd(45);
		#declare Camera_Distance	= Width * 64;
		#declare Camera_Vertical	= 225;
		#declare Camera_Horizontal	= 30;	
		#declare Camera_Aspect		= image_height/image_width;
		#declare Camera_Up		= +y * Camera_Diagonal * Width * Tiles;
		#declare Camera_Right		= +x * Camera_Diagonal * Width * Tiles / Camera_Aspect;
		#declare Camera_Location	= -z * Camera_Distance;
		#declare Camera_Direction	= +z * Camera_Distance;
		#declare Camera_LookAt		= Camera_Location + Camera_Direction;
		#declare Camera_Rotate		= <Camera_Horizontal,Camera_Vertical,0,>;
		#declare Camera_Scale		= 4;
		#declare Camera_Translate	= -<1,0,1,> * Bitmap_Height * 3/4 * Tiles;
		#declare Camera_Transform = transform
		{
			rotate		Camera_Rotate
			scale		Camera_Scale
			translate	Camera_Translate
		}
		camera
		{
			#if (Use_Isometric = 1)
				orthographic
			#else
				perspective
			#end
			up		Camera_Up
			right		Camera_Right
			location	Camera_Location
			direction	Camera_Direction
			transform {Camera_Transform}
		}
		#declare Camera_Location	= vtransform(Camera_Location, Camera_Transform);
		#declare Camera_LookAt		= vtransform(Camera_LookAt, Camera_Transform);
	#break
	// isometric, overhead
	#case (2)
		#declare Camera_Aspect		= image_height/image_width;
		#declare Camera_Distance	= Width * 64;
		#declare Camera_Up		= +z * Width * 2;
		#declare Camera_Right		= +x * Width * 2 / Camera_Aspect;
		#declare Camera_Location	= +y * Camera_Distance;
		#declare Camera_Direction	= -y * Camera_Distance;
		#declare Camera_LookAt		= Camera_Location + Camera_Direction;
		#declare Camera_Vertical	= 0;
		#declare Camera_Horizontal	= 0;
		#declare Camera_Rotate		= <Camera_Horizontal,Camera_Vertical,0,>;
		#declare Camera_Scale		= 1;
		#declare Camera_Translate	= <0,0,0,>;
		#declare Camera_Transform = transform
		{
			rotate		Camera_Rotate
			scale		Camera_Scale
			translate	Camera_Translate
		}
		camera
		{
			orthographic
			up		Camera_Up
			right		Camera_Right
			location	Camera_Location
			direction	Camera_Direction
			transform {Camera_Transform}
		}
		#declare Camera_Location	= vtransform(Camera_Location, Camera_Transform);
		#declare Camera_LookAt		= vtransform(Camera_LookAt, Camera_Transform);
	#break
	// isometric, side
	#case (3)
		#declare Camera_Diagonal	= cosd(45);
		#declare Camera_Distance	= Width * 64;
		#declare Camera_Vertical	= 180;
		#declare Camera_Horizontal	= 0;	
		#declare Camera_Aspect		= image_height/image_width;
		#declare Camera_Up		= +y * Camera_Diagonal * Width * Tiles;
		#declare Camera_Right		= +x * Camera_Diagonal * Width * Tiles / Camera_Aspect;
		#declare Camera_Location	= -z * Camera_Distance;
		#declare Camera_Direction	= +z * Camera_Distance;
		#declare Camera_LookAt		= Camera_Location + Camera_Direction;
		#declare Camera_Rotate		= <Camera_Horizontal,Camera_Vertical,0,>;
		#declare Camera_Scale		= 2;
		#declare Camera_Translate	= y * Height/2;
		#declare Camera_Transform = transform
		{
			rotate		Camera_Rotate
			scale		Camera_Scale
			translate	Camera_Translate
		}
		camera
		{
			#if (Use_Isometric = 1)
				orthographic
			#else
				perspective
			#end
			up		Camera_Up
			right		Camera_Right
			location	Camera_Location
			direction	Camera_Direction
			transform {Camera_Transform}
		}
		#declare Camera_Location	= vtransform(Camera_Location, Camera_Transform);
		#declare Camera_LookAt		= vtransform(Camera_LookAt, Camera_Transform);
	#break
	// OLD METHOD
	#case (4)
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
			#else
				perspective
			#end
			sky y
			up y * Diagonal * Tiles * image_height / image_width * 2
			right x * Diagonal * Tiles * 2
			location Camera_Location
			look_at Camera_LookAt
		}
	#break
	// Nice_Render
	#case (5)
		#declare Camera_Scale =		1;
		#declare Camera_Diagonal =	cos(radians(45)) * 64;
		#declare Camera_Vertical =	180;
		#declare Camera_Horizontal =	30;
		#declare Camera_Aspect =	image_height / image_width;
		#declare Camera_Distance =	1024;
		#declare Camera_Location	= -z * Camera_Distance;
		#declare Camera_Direction	= +z;
		#declare Camera_Transform = transform
		{
			rotate		+x * Camera_Horizontal
			translate	+z * Width/2
			rotate		+y * Camera_Vertical
			scale		Camera_Scale
		}
		camera
		{
			orthographic
			up		+y * Camera_Diagonal * Tiles * 2 * Camera_Aspect
			right		+x * Camera_Diagonal * Tiles * 2
			location	Camera_Location
			direction	Camera_Direction
			transform {Camera_Transform}
		}
		#declare Camera_Location	= vtransform(Camera_Location, Camera_Transform);
		#declare Camera_LookAt		= vtransform(Camera_LookAt, Camera_Transform);
	#break
#end

// -------------------------------------------------------------
// Lights. There are several methods inconsistantly used within GearHead. I try and mimic them here.
// Don't make them shadowless!! Instead, hide whatever the shadows are being cast upon (such as the floors).

#switch (BG_Color)
	#case (0)
		background {color rgb 0}
	#break
	#case (1)
		background {color rgb z}
	#break
#end

#switch (Lights_Method)
	#case (1)
		light_source
		{
			-z * 1024
			light_color
			parallel
			rotate +x * 60
			rotate +y * 120
//			shadowless
		}
	#break
	#case (2)
		light_source
		{
			-z * 1024
			light_color
			parallel
			rotate +x * 60
			rotate +y * 120
			rotate +y * 90
//			shadowless
		}
	#break
	// Nice_Render
	#case (3)
		light_source
		{
			-z * 1024
			light_color
			parallel
			rotate +x * 60
			rotate +y * 120
			rotate +y * 135
//			shadowless
		}
	#break
	// suggested by someone on the newsgroup
	#case (4)
		light_source
		{
			-z * 1024
			light_color
			parallel
//			rotate <+50.019309,+180-153.434949,0.000000>
			rotate <+50,+25,0>
			rotate +y * 225
//			shadowless
		}
	#break
#end

// -------------------------------------------------------------
// Orientation markers

#declare Axis_Markers = union
{
	sphere
	{
		0,1
		pigment{gamma_color_adjust(<0,0,0,>)}
	}
	cylinder
	{
		0,+x*Width*2,1
		pigment{gamma_color_adjust(x)}
	}
	cylinder
	{
		0,+y*Width*2,1
		pigment{gamma_color_adjust(y)}
	}
	cylinder
	{
		0,+z*Width*2,1
		pigment{gamma_color_adjust(z)}
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
	translate -y * 0.0001
}

#declare Clip_Cylinder = cylinder
{
	#local Hgh = 24 / sin(pi/3);
	#local Rad = cos(pi/4) * Width;
	0, y * Hgh, Rad
	scale y * 2
}

#declare Height_Scale = plane
{
	-z,100
	pigment
	{
		gradient y
		color_map
		{
			[0 color rgb 0]
			[1 color rgb 1]
		}
		scale Meters
	}
}

#declare dummy_object = sphere {0,1 pigment {color rgbt 1}}

#if (Show_AxisMarker = 1)
	object {Axis_Markers}
#end

#if (Show_GridMarker = 1)
	object
	{
		Grid_Marker
		uv_mapping
		pigment {color rgb x+z}
	}
#end

#if (Show_BasicFloor = 1)
	object
	{
		Basic_Floor
		uv_mapping
		pigment {color rgb 1}
	}
#end

#if (Show_HeightScale = 1)
	object {Height_Scale}
#end

#if (Show_BasicCube = 1)
	box
	{
		-32, +32
		translate +y*32
		pigment {color srgb 1}
	}
#end
