// Title: GearHead walls prototypes
// Desc: the prototypes from which the wall objects are formed
// Auth: Michael Horvath
// Home: http://isometricland.com

#version 3.7

//#include "blockwall.inc"	// (New) POV-Ray Object Collection - Chris B.
#include "GearHead_logo.inc"	// GearHead logo converted in Inkscape

// -------------------------------------------------------------
// Wall decorations

#macro Window_Frame_Prototype()
	union
	{
		// window mortar padding
		difference
		{
			box
			{
				-1,1
				translate y
				scale 1/2
				scale x * (WindowDepth)
				scale z * (WindowWidth)
				scale y * (WindowHeight)
				translate y * BottomPad
			}
			box
			{
				-1,1
				translate y
				scale 1/2
				scale x * (Width)
				scale z * (WindowWidth - MortarWidth * 2)
				scale y * (WindowHeight - MortarWidth * 2)
				translate y * (BottomPad + MortarWidth)
			}
			texture {Window_Sill_Texture}
		}
		#if (AddWindowBars = true)
			union
			{
				cylinder {<0,BottomPad,0>,<0,BottomPad+WindowHeight,0>,Width/64}
				cylinder {<0,BottomPad,0>,<0,BottomPad+WindowHeight,0>,Width/64 translate z * +WindowWidth/4}
				cylinder {<0,BottomPad,0>,<0,BottomPad+WindowHeight,0>,Width/64 translate z * -WindowWidth/4}
				texture {Window_Frame_Texture}
			}
		#end
		#if (AddWindowSill = true)
			// window sill
			box
			{
				-1,1
				translate y
				scale 1/2
				scale x * (SillDepth)
				scale z * (SillWidth)
				scale y * (SillHeight)
				translate y * (BottomPad + MortarWidth)
				texture {Window_Sill_Texture}
			}
			// window frame
			difference
			{
				box
				{
					-1,1
					translate y
					scale 1/2
					scale x * (WindowFrameDepth)
					scale z * (WindowWidth - MortarWidth * 2)
					scale y * (WindowHeight - SillHeight)
					translate y * (BottomPad + MortarWidth + SillHeight)
				}
				box
				{
					-1,1
					translate y
					scale 1/2
					scale x * (Width)
					scale z * (WindowWidth - MortarWidth * 2 - WindowFrameWidth * 2)
					scale y * (WindowHeight - SillHeight - WindowFrameWidth * 2)
					translate y * (BottomPad + MortarWidth + SillHeight + WindowFrameWidth)
				}
				texture {Window_Frame_Texture}
			}
			#if ((AddWindowGlass = true) & (Is32Bit = 1))
				// window glass
				box
				{
					-1,1
					translate y
					scale 1/2
					scale x * (WindowFrameDepth)
					scale z * (WindowWidth - MortarWidth * 2 - WindowFrameWidth * 2)
					scale y * (WindowHeight - SillHeight - WindowFrameWidth * 2)
					translate y * (BottomPad + MortarWidth + SillHeight + WindowFrameWidth)
					texture {Window_Glass_Texture}
				}
			#end
		#else
			// window frame
			difference
			{
				box
				{
					-1,1
					translate y
					scale 1/2
					scale x * (WindowFrameDepth)
					scale z * (WindowWidth - MortarWidth * 2)
					scale y * (WindowHeight - MortarWidth * 2)
					translate y * (BottomPad + MortarWidth)
				}
				box
				{
					-1,1
					translate y
					scale 1/2
					scale x * (Width)
					scale z * (WindowWidth - MortarWidth * 2 - WindowFrameWidth * 2)
					scale y * (WindowHeight - MortarWidth * 2 - WindowFrameWidth * 2)
					translate y * (BottomPad + MortarWidth + WindowFrameWidth)
				}
				texture {Window_Frame_Texture}
			}
			#if ((AddWindowGlass = true) & (Is32Bit = 1))
				// window glass
				box
				{
					-1,1
					translate y
					scale 1/2
					scale x * (WindowFrameDepth)
					scale z * (WindowWidth - MortarWidth * 2 - WindowFrameWidth * 2)
					scale y * (WindowHeight - MortarWidth * 2 - WindowFrameWidth * 2)
					translate y * (BottomPad + MortarWidth + WindowFrameWidth)
					texture {Window_Glass_Texture}
				}
			#end
		#end
	}
#end

#macro Window_Hole_Prototype()
	#local temp_box = box
	{
		-1,1
		translate y
		scale 1/2
		scale x * (Width)
		scale z * (WindowWidth)
		scale y * (WindowHeight)
		translate y * BottomPad
		scale 1.00001
		texture {Plain_Clear}
	}
	#if ((North + South = 2) & (East + West = 0))
		object {temp_box}
	#end
	#if ((East + West = 2) & (North + South = 0))
		object {temp_box rotate y * 090}
	#end
#end

#macro Dollar_Deco_Object()
	#local Dollar_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local text_object = text
	{
		ttf "space age.ttf" "$"
		1/2, 0
	}
	union
	{
		object
		{
			text_object
			Center_Trans(text_object, x+y+z)
			scale <Width,Width,Width/2>
			translate -z * Width/8
			rotate y * 90
			translate y * Height/2
			texture {Dollar_Texture}
		}
		object
		{
			text_object
			Center_Trans(text_object, x+y+z)
			scale <Width,Width,Width/2>
			translate -z * Width/8
			rotate y * 90
			translate y * Height/2
			texture {Dollar_Texture}
			rotate y * 180
		}
	}
#end

#macro Gear_Deco_Object()
	#local Gear_Texture = texture {Plain_Green} texture {Grade_Texture};
	object
	{
		path8103
		translate <-AllShapes_CENTER_X,-1/2,-AllShapes_CENTER_Y>
		scale y * Width/2
		rotate y * -90
		rotate z * +90
		translate y * Height/2
		texture {Gear_Texture}
	}
#end

#macro RedCross_Deco_Object()
	#local RedCross_Texture = texture {Plain_Green} texture {Grade_Texture};
	union
	{
		box
		{
			-1,+1
			scale <Width/4,Width/3,Width/8>
		}
		box
		{
			-1,+1
			scale <Width/4,Width/8,Width/3>
		}
		translate y * Height/2
		texture {RedCross_Texture}
	}
#end

#macro Badge_Deco_Object()
	#local Badge_Texture = texture {Plain_Green} texture {Grade_Texture};
	#local text_object = text
	{
		ttf "opens___.ttf" "\u272b"	//	"\ue47d"
		1/2, 0
	}
	object
	{
		text_object
		Center_Trans(text_object, x+y+z)
		scale Width
		scale <4/3,4/3,1>
		rotate y * 90
		translate y * Height/2
		texture {Badge_Texture}
	}
#end

#macro Jack_Deco_Object()
	#local TempAngle = pi/2 - atan(1/cos(pi/4));
	#local jack_width = Width/16;
	#local jack_length = Width/2;
	#local jack_box = box
	{
		-1,+1
		scale <jack_length,jack_width,jack_width>
	}
	union
	{
		object {jack_box}
		object {jack_box rotate y * 90}
		object {jack_box rotate z * 90}
		rotate x * 45
		rotate z * degrees(TempAngle)
		translate y * sin(TempAngle) * jack_length
		texture {Jack_Texture}
	}
#end

#macro Caution_Deco_Object()
	union
	{
		polygon
		{
			4, <-1,-1>,<-1,+1>,<+1,+1>,<+1,-1>
			rotate z * 45
			rotate y * 90
			scale Width/8
			translate y * Height/2
			translate +z * Width/4
		}
		polygon
		{
			4, <-1,-1>,<-1,+1>,<+1,+1>,<+1,-1>
			rotate z * 45
			rotate y * 90
			scale Width/8
			translate y * Height/2
			translate -z * Width/4
		}
		texture {Caution_Texture}
	}
#end

// normal window with glass
#macro Window_Deco_Object_a()
	#ifndef (Rows) #declare Rows = 12; #end			// the wall is composed of this may rows of bricks
	#ifndef (Cols) #declare Cols = 4; #end			// the wall is composed of this many columns of bricks
	#ifndef (MortarWidth) #declare MortarWidth = 2;	#end	// the width of the mortar between bricks
	#ifndef (MortarDepth) #declare MortarDepth = 1/2; #end	// the depth of the mortar between bricks
	#ifndef (TopRow_Skip) #declare TopRow_Skip = 2; #end	// this many rows of bricks separate the window from the top of the wall
	#ifndef (BotRow_Skip) #declare BotRow_Skip = 2; #end	// this many rows of bricks separate the window from the bottom of the wall	
	#ifndef (Column_Skip) #declare Column_Skip = 2; #end	// this many columns of bricks separate the window from the sides of the wall
	#ifndef (AddWindowSill) #declare AddWindowSill = 1; #end
	#ifndef (AddWindowGlass) #declare AddWindowGlass = 1; #end
	#ifndef (AddWindowBars) #declare AddWindowBars = 0; #end
	#declare Window_Sill_Texture = texture {Plain_Gray} texture {Grade_Texture}
	#declare Window_Frame_Texture = texture {Plain_Green} texture {Grade_Texture}
	#declare Window_Glass_Texture = texture {Wall_Glass_Texture} texture {Grade_Texture}
	#declare WindowFrameWidth = Width/16;	// the width of the window frame, as well as the distance it is inset into the wall
	#declare WindowFrameDepth = Width/16;
	#declare BottomPad = Height/Rows * BotRow_Skip;
	#declare WindowHeight = Height - Height/Rows * (TopRow_Skip + BotRow_Skip);
	#declare WindowWidth = Width - Width/Cols * Column_Skip;
	#declare WindowDepth = WallThick - MortarDepth * 2;
	#declare SillHeight = Height/Rows - MortarWidth;
	#declare SillWidth = WindowWidth;	// - MortarWidth * 2
	#declare SillDepth = WindowDepth + Width/16;
	Window_Frame_Prototype()
#end

// window with steel bars instead of glass
#macro Window_Deco_Object_b()
	#ifndef (Rows) #declare Rows = 8; #end			// the wall is composed of this may rows of bricks
	#ifndef (Cols) #declare Cols = 4; #end			// the wall is composed of this many columns of bricks
	#ifndef (MortarWidth) #declare MortarWidth = 2;	#end	// the width of the mortar between bricks
	#ifndef (MortarDepth) #declare MortarDepth = 1/2; #end	// the depth of the mortar between bricks
	#ifndef (TopRow_Skip) #declare TopRow_Skip = 2; #end	// this many rows of bricks separate the window from the top of the wall
	#ifndef (BotRow_Skip) #declare BotRow_Skip = 2; #end	// this many rows of bricks separate the window from the bottom of the wall	
	#ifndef (Column_Skip) #declare Column_Skip = 2; #end	// this many columns of bricks separate the window from the sides of the wall
	#ifndef (AddWindowSill) #declare AddWindowSill = 0; #end
	#ifndef (AddWindowGlass) #declare AddWindowGlass = 0; #end
	#ifndef (AddWindowBars) #declare AddWindowBars = 1; #end
	#declare Window_Sill_Texture = texture {Plain_Gray} texture {Grade_Texture};
	#declare Window_Frame_Texture = texture {Plain_Gray} texture {Grade_Texture};
	#declare WindowFrameWidth = 0;		// the width of the window frame, as well as the distance it is inset into the wall
	#declare WindowFrameDepth = 0;
	#declare BottomPad = Height/Rows * BotRow_Skip;
	#declare WindowHeight = Height - Height/Rows * (TopRow_Skip + BotRow_Skip);
	#declare WindowWidth = Width - Width/Cols * Column_Skip;
	#declare WindowDepth = Width/3 - MortarDepth * 2;
	#declare SillHeight = Height/Rows - MortarWidth;
	#declare SillWidth = WindowWidth;	// - MortarWidth * 2
	#declare SillDepth = WindowDepth + Width/16;
	Window_Frame_Prototype()
#end

// -------------------------------------------------------------
// Flat walls

#macro Flat_Wall_Prototype(North,East,South,West)
	#ifndef (Hgh) #local Hgh = Height; #end
	#ifndef (Wid) #local Wid = Width/2; #end
	#ifndef (Bot) #local Bot = BotThick; #end
	#ifndef (Top) #local Top = TopThick; #end
	#ifndef (AddWindow) #local AddWindow = false; #end
	#local BotWid = Wid * Bot;
	#local TopWid = BotWid * Top;
	#local Ang = degrees(atan(Hgh/(BotWid-TopWid)));
	#if (TopWid > BotWid)
		#local Ang = Ang + 180;
	#end
	PrintValue("Ang = ", Ang)
	intersection
	{
		union
		{
			intersection
			{
				plane
				{
					y, 0
					rotate x * -Ang translate z * -BotWid
					texture {Wall_Texture rotate y * 180 * AlignY}
				}
				plane
				{
					y, 0
					rotate x * Ang translate z * BotWid
					texture {Wall_Texture rotate y * 000 * AlignY}
				}
			}
			intersection
			{
				plane
				{
					y, 0
					rotate z * Ang translate x * -BotWid
					texture {Wall_Texture rotate y * 270 * AlignY}
				}
				plane
				{
					y, 0
					rotate z * -Ang translate x * BotWid
					texture {Wall_Texture rotate y * 090 * AlignY}
				}
			}
		}
		#if (North = 0)
			plane
			{
				y, 0
				rotate x * -Ang translate z * -BotWid
				texture {Wall_Texture rotate y * 180 * AlignY}
			}
		#else
			plane {-z, Wid texture {Mask_Texture rotate y * 180 * AlignY}}
		#end
		#if (East = 0)
			plane
			{
				y, 0
				rotate z * Ang translate x * -BotWid
				texture {Wall_Texture rotate y * 270 * AlignY}
			}
		#else
			plane {-x, Wid texture {Mask_Texture rotate y * 270 * AlignY}}
		#end
		#if (South = 0)
			plane
			{
				y, 0
				rotate x * Ang translate z * BotWid
				texture {Wall_Texture rotate y * 000 * AlignY}
			}
		#else
			plane {z, Wid texture {Mask_Texture rotate y * 000 * AlignY}}
		#end
		#if (West = 0)
			plane
			{
				y, 0
				rotate z * -Ang translate x * BotWid
				texture {Wall_Texture rotate y * 090 * AlignY}
			}
		#else
			plane {x, Wid texture {Mask_Texture rotate y * 090 * AlignY}}
		#end
		plane {+y, Hgh texture {Roof_Texture}}
		plane {-y, 0 texture {Floor_Texture}}
	}
#end


// -------------------------------------------------------------
// Tubular walls

#macro Tube_Straight_Left_Proto()
	#ifndef (Hgh) #local Hgh = Height; #end
	#ifndef (Wid) #local Wid = Width/2; #end
	#local Pt1 = <0,Hgh,0,>;
	#local Pt2 = <Wid,Wid,0,>;
	#local Rad = VDist(Pt1, Pt2);
	PrintValue("Rad = ", Rad)
	union
	{
		union
		{
			box
			{
				<Wid,Hgh+1,Wid,>,
				<0,-1,0,>
				texture
				{
					Mask_Texture
				}
				clipped_by
				{
					plane {y, Hgh}
					plane {-y, 0}
				}
			}
			plane
			{
				y, Hgh
				texture {Roof_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,Wid,>, <0,-1,0,>}
				}
			}
			plane
			{
				y, 0
				texture {Floor_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,Wid,>, <0,-1,0,>}
				}
			}
			clipped_by
			{
				cylinder
				{
					<+Width,Wid,Width,>,
					<-Width,Wid,Width,>,
					Rad
					inverse
				}
			}
		}
		cylinder
		{
			<Wid,Wid,Width,>,
			<0,Wid,Width,>,
			Rad
			open
			texture
			{
				Wall_Texture
			}
			clipped_by
			{
				box
				{
					<Wid,Hgh,Wid,>,
					<0,0,0,>
				}
			}
		}
	}
#end

#macro Tube_Straight_Left_Shadow_Proto()
	#ifndef (Hgh) #local Hgh = Height; #end
	#ifndef (Wid) #local Wid = Width/2; #end
	#local Pt1 = <0,Hgh,0,>;
	#local Pt2 = <Wid,Wid,0,>;
	#local Rad = VDist(Pt1, Pt2);
	PrintValue("Rad = ", Rad)
	union
	{
		union
		{
			box
			{
				<Wid,Hgh+1,Wid,>,
				<0,-1,0,>
				texture
				{
					Mask_Texture
				}
				clipped_by
				{
					plane {y, Hgh}
					plane {-y, 0}
				}
			}
			plane
			{
				y, Hgh
				texture {Roof_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,Wid,>, <0,-1,0,>}
				}
			}
			plane
			{
				y, 0
				texture {Floor_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,Wid,>, <0,-1,0,>}
				}
			}
			clipped_by
			{
				cylinder
				{
					<+Width,Wid,Width,>,
					<-Width,Wid,Width,>,
					Rad
					inverse
				}
			}
		}
		cylinder
		{
			<Wid,Wid,Width,>,
			<0,Wid,Width,>,
			Rad
			open
			texture
			{
				Wall_Texture
			}
			clipped_by
			{
				box
				{
					<Wid,Hgh,Wid,>,
					<0,0,0,>
				}
			}
		}
		scale x * 4
		no_image
	}
#end

#macro Tube_Straight_Right_Proto()
	#ifndef (Hgh) #local Hgh = Height; #end
	#ifndef (Wid) #local Wid = Width/2; #end
	#local Pt1 = <0,Hgh,0,>;
	#local Pt2 = <Wid,Wid,0,>;
	#local Rad = VDist(Pt1, Pt2);
	PrintValue("Rad = ", Rad)
	union
	{
		union
		{
			box
			{
				<Wid,Hgh+1,-Wid,>,
				<0,-1,0,>
				texture
				{
					Mask_Texture
				}
				clipped_by
				{
					plane {y, Hgh}
					plane {-y, 0}
				}
			}
			plane
			{
				y, Hgh
				texture {Roof_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,-Wid,>, <0,-1,0,>}
				}
			}
			plane
			{
				y, 0
				texture {Floor_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,-Wid,>, <0,-1,0,>}
				}
			}
			clipped_by
			{
				cylinder
				{
					<+Width,Wid,-Width,>,
					<-Width,Wid,-Width,>,
					Rad
					inverse
				}
			}
		}
		cylinder
		{
			<Wid,Wid,-Width,>,
			<0,Wid,-Width,>,
			Rad
			open
			texture
			{
				Wall_Texture
			}
			clipped_by
			{
				box
				{
					<Wid,Hgh,-Wid,>,
					<0,0,0,>
				}
			}
		}
	}
#end

#macro Tube_Straight_Right_Shadow_Proto()
	#ifndef (Hgh) #local Hgh = Height; #end
	#ifndef (Wid) #local Wid = Width/2; #end
	#local Pt1 = <0,Hgh,0,>;
	#local Pt2 = <Wid,Wid,0,>;
	#local Rad = VDist(Pt1, Pt2);
	PrintValue("Rad = ", Rad)
	union
	{
		union
		{
			box
			{
				<Wid,Hgh+1,-Wid,>,
				<0,-1,0,>
				texture
				{
					Mask_Texture
				}
				clipped_by
				{
					plane {y, Hgh}
					plane {-y, 0}
				}
			}
			plane
			{
				y, Hgh
				texture {Roof_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,-Wid,>, <0,-1,0,>}
				}
			}
			plane
			{
				y, 0
				texture {Floor_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,-Wid,>, <0,-1,0,>}
				}
			}
			clipped_by
			{
				cylinder
				{
					<+Width,Wid,-Width,>,
					<-Width,Wid,-Width,>,
					Rad
					inverse
				}
			}
		}
		cylinder
		{
			<Wid,Wid,-Width,>,
			<0,Wid,-Width,>,
			Rad
			open
			texture
			{
				Wall_Texture
			}
			clipped_by
			{
				box
				{
					<Wid,Hgh,-Wid,>,
					<0,0,0,>
				}
			}
		}
	}
	scale x * 4
	no_image
#end


// isn't architecturally 'proper'. cheating.
#macro Tube_Corner_Inner_Old_Proto()
	#ifndef (Hgh) #local Hgh = Height; #end
	#ifndef (Wid) #local Wid = Width/2; #end
	#local Pt1 = <0,Hgh,0,>;
	#local Pt2 = <Wid,Wid,0,>;
	#local Rad = VDist(Pt1, Pt2);
	PrintValue("Rad = ", Rad)
	union
	{
		union
		{
			box
			{
				<Wid,Hgh+1,Wid,>,
				<0,-1,0,>
				texture
				{
					Mask_Texture
				}
				clipped_by
				{
					plane {y, Hgh}
					plane {-y, 0}
				}
			}
			plane
			{
				y, Hgh
				texture {Roof_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,Wid,>, <0,-1,0,>}
				}
			}
			plane
			{
				y, 0
				texture {Floor_Texture}
				clipped_by
				{
					box {<Wid,Hgh+1,Wid,>, <0,-1,0,>}
				}
			}
			clipped_by
			{
				sphere
				{
					<Rad,Wid,Rad,>,
					Rad
					inverse
				}
			}
		}
		sphere
		{
			// Should maybe use different coordinates. I didn't calculate it -- just guessed.
			<Rad,Wid,Rad,>,
			Rad
			texture
			{
				Wall_Texture
			}
			clipped_by
			{
				box
				{
					<Wid,Hgh,Wid,>,
					<0,0,0,>
				}
			}
		}
	}
#end

#macro Tube_Corner_Inner_Proto()
	#ifndef (Hgh) #local Hgh = Height; #end
	#ifndef (Wid) #local Wid = Width/2; #end
	#local Pt1 = <0,Hgh,0,>;
	#local Pt2 = <Wid,Wid,0,>;
	#local Rad = VDist(Pt1, Pt2);
	PrintValue("Rad = ", Rad)
	union
	{
		difference
		{
			union
			{
				box
				{
					<Wid,Hgh+1,Wid,>,
					<0,-1,0,>
					texture {Mask_Texture}
					clipped_by
					{
						plane {y, Hgh}
						plane {-y, 0}
					}
				}
				plane
				{
					y, Hgh
					texture {Roof_Texture}
					clipped_by
					{
						box {<Wid,Hgh+1,Wid,>, <0,-1,0,>}
					}
				}
				plane
				{
					y, 0
					texture {Floor_Texture}
					clipped_by
					{
						box {<Wid,Hgh+1,Wid,>, <0,-1,0,>}
					}
				}
			}
			sor
			{
				7,
				<+06.1,-11.3>
				<+06.1,-11.3>
				<+16.0,+00.0>
				<+25.6,+28.3>
				<+19.7,+57.6>
				<+00.0,+80.0>
				<+00.0,+80.0>
				translate <Wid,0,Wid,>
				texture {Wall_Texture}
				clipped_by
				{
					plane {y, Hgh}
					plane {-y, 0}
				}
			}
		}

	}
#end

#macro Tube_Corner_Outer_Proto()
	#ifndef (Hgh) #local Hgh = Height; #end
	#ifndef (Wid) #local Wid = Width/2; #end
	#local Pt1 = <0,Hgh,0,>;
	#local Pt2 = <Wid,Wid,0,>;
	#local Rad = VDist(Pt1, Pt2);
	PrintValue("Rad = ", Rad)
	union
	{
		union
		{
			box
			{
				<-Wid,Hgh+1,-Wid,>,
				<0,-1,0,>
				texture
				{
					Mask_Texture
				}
				clipped_by
				{
					plane {y, Hgh}
					plane {-y, 0}
				}
			}
			plane
			{
				y, Hgh
				texture {Roof_Texture}
				clipped_by
				{
					box {<-Wid,Hgh+1,-Wid,>, <0,-1,0,>}
				}
			}
			plane
			{
				y, 0
				texture {Floor_Texture}
				clipped_by
				{
					box {<-Wid,Hgh+1,-Wid,>, <0,-1,0,>}
				}
			}
			clipped_by
			{
				torus
				{
					Width,
					Rad
					translate y * Wid
					inverse
				}
			}
		}
		torus
		{
			Width,
			Rad
			translate y * Wid
			texture
			{
				Wall_Texture
			}
			clipped_by
			{
				box
				{
					<-Wid,Hgh,-Wid,>,
					<0,0,0,>
				}
			}
		}
	}
#end

#macro Tube_Wall_Prototype(North,East,South,West)
	union
	{
		// Straight portions
		#if (West = 1) 
			#if (South = 0)
				object
				{
					Tube_Straight_Left_Proto()
					rotate y * 000
				}
			#end
			#if (North = 0)
				object
				{
					Tube_Straight_Right_Proto()
					rotate y * 000
				}
			#end
			object
			{
				Tube_Straight_Left_Shadow_Proto()
				rotate y * 000
			}
			object
			{
				Tube_Straight_Right_Shadow_Proto()
				rotate y * 000
			}
		#end
		#if (South = 1)
			#if (East = 0)
				object
				{
					Tube_Straight_Left_Proto()
					rotate y * 270
				}
			#end
			#if (West = 0)
				object
				{
					Tube_Straight_Right_Proto()
					rotate y * 270
				}
			#end
			object
			{
				Tube_Straight_Left_Shadow_Proto()
				rotate y * 270
			}
			object
			{
				Tube_Straight_Right_Shadow_Proto()
				rotate y * 270
			}
		#end
		#if (East = 1)
			#if (North = 0)
				object
				{
					Tube_Straight_Left_Proto()
					rotate y * 180
				}
			#end
			#if (South = 0)
				object
				{
					Tube_Straight_Right_Proto()
					rotate y * 180
				}
			#end
			object
			{
				Tube_Straight_Left_Shadow_Proto()
				rotate y * 180
			}
			object
			{
				Tube_Straight_Right_Shadow_Proto()
				rotate y * 180
			}
		#end
		#if (North = 1) 
			#if (West = 0)
				object
				{
					Tube_Straight_Left_Proto()
					rotate y * 090
				}
			#end
			#if (East = 0)
				object
				{
					Tube_Straight_Right_Proto()
					rotate y * 090
				}
			#end
			object
			{
				Tube_Straight_Left_Shadow_Proto()
				rotate y * 090
			}
			object
			{
				Tube_Straight_Right_Shadow_Proto()
				rotate y * 090
			}
		#end
		// Curved portions
		#if (West + South = 2)
			object
			{
				Tube_Corner_Inner_Proto()
				rotate y * 000
			}
		#end
		#if (East + North = 0)
			object
			{
				Tube_Corner_Outer_Proto()
				rotate y * 000
			}
		#end
		#if (South + East = 2)
			object
			{
				Tube_Corner_Inner_Proto()
				rotate y * 270
			}
		#end
		#if (North + West = 0)
			object
			{
				Tube_Corner_Outer_Proto()
				rotate y * 270
			}
		#end
		#if (East + North = 2)
			object
			{
				Tube_Corner_Inner_Proto()
				rotate y * 180
			}
		#end
		#if (West + South = 0)
			object
			{
				Tube_Corner_Outer_Proto()
				rotate y * 180
			}
		#end
		#if (North + West = 2)
			object
			{
				Tube_Corner_Inner_Proto()
				rotate y * 90
			}
		#end
		#if (South + East = 0)
			object
			{
				Tube_Corner_Outer_Proto()
				rotate y * 90
			}
		#end
		no_shadow
	}
#end


// -------------------------------------------------------------
// Blocky walls

#macro Block_Wall_Intersection(Number1, Number2, GapWid)
	intersection
	{
		union
		{
			#local Count1 = 0;
			#while (Count1 < Number1)
				#local Count2 = 0;
				#local Modulos = mod(Count1*3,2);
				#local AddOne = Number2 + 1;
				#while (Count2 < AddOne)
					#local Count3 = 0;
					#while (Count3 < AddOne)
						box
						{
// too slow						Round_Box(<0,0,0,>, <Width,Height,Width,>, GapWid, false)
							<0,0,0,>, <Width,Height,Width,>
							scale <(Width-GapWid*Number2)/Width,(Height-GapWid*Number1)/Height,(Width-GapWid*Number2)/Width,>
							scale <1/Number2,1/Number1,1/Number2,>
							translate <-Width/2,0,-Width/2,>
							translate y * Count1 * Height/Number1
							translate x * Count2 * Width/Number2
							translate z * Count3 * Width/Number2
							translate GapWid	// - 0.00001
							#if (Modulos != 0)
								translate -x * Width/Number2/2
								translate -z * Width/Number2/2
							#else
								translate -x * Width/Number2
								translate -z * Width/Number2
							#end
						}
						#local Count3 = Count3 + 1;
					#end
					#local Count2 = Count2 + 1;
				#end
				#local Count1 = Count1 + 1;
			#end
			texture {Wall_Texture}
		}
		object {Flat_Wall_Prototype(North,East,South,West)}
	}
#end

// brick wall with windows
#macro Brick_Wall_Prototype(North,East,South,West)
	#ifndef (AddWindow)	#local AddWindow = false;	#end
	#ifndef (AddDollar)	#local AddDollar = false;	#end
	#ifndef (AddGear)	#local AddGear = false;		#end
	#ifndef (AddRedCross)	#local AddRedCross = false;	#end
	#ifndef (AddBadge)	#local AddBadge = false;	#end
	union
	{
		// patterned wall
		intersection
		{
			
			union
			{
				#local Count1 = 0;
				#local Number1 = Rows;
				#while (Count1 < Number1)
					object
					{
						// need to adjust topthick and botthick to take Count1 into account.
						#local Wid = Width/2;
						#local Hgh = Height/Number1;
						#local Offset = y * Count1 * Hgh;
						#local Wall_Texture = texture {Brick_Wall_Prototype_Texture translate -Offset}
						#local Mask_Texture = texture {Brick_Wall_Prototype_Texture translate -Offset}
						#local Roof_Texture = texture {Brick_Wall_Prototype_Texture translate -Offset}
						#local Floor_Texture = texture {Brick_Wall_Prototype_Texture translate -Offset}
						Flat_Wall_Prototype(North,East,South,West)
						translate Offset
					}
					#local Count1 = Count1 + 1;
				#end
			}
			object
			{
				#local Wid = Width/2;
				#local Hgh = Height;
				#local Offset = <0,0,0>;	// -0.01
				#local Wall_Texture = texture {Brick_Wall_Prototype_Texture translate -Offset}
				#local Mask_Texture = texture {Brick_Wall_Prototype_Texture translate -Offset}
				#local Roof_Texture = texture {Brick_Wall_Prototype_Texture translate -Offset}
				#local Floor_Texture = texture {Brick_Wall_Prototype_Texture translate -Offset}
				Block_Wall_Intersection(Rows, Cols, MortarWidth)
				translate Offset
			}
		}
		// mortar
		object
		{
			#local Wid = Width/2;
			#local Hgh = Height;
			#local Wall_Texture = texture {Mortar_Texture}	// this used to translate by MortarDepth as well, but what are the consequences?
			#local Mask_Texture = texture {Mortar_Texture translate MortarDepth}
			#local Roof_Texture = texture {Mortar_Texture translate MortarDepth}
			#local Floor_Texture = texture {Mortar_Texture translate MortarDepth}
			Flat_Wall_Prototype(North,East,South,West)
			translate -MortarDepth
		}
		// top mask
		intersection
		{
			#local Mask_Texture = texture {Roof_Mask_Texture}
			plane
			{
				y, 0
				texture {Mask_Texture}
				translate y * (Height + 0.00001)
			}
			object
			{
				#local Wall_Texture = texture {Plain_Clear}
				#local Mask_Texture = texture {Plain_Clear}
				#local Roof_Texture = texture {Plain_Clear}
				#local Floor_Texture = texture {Plain_Clear}
				Flat_Wall_Prototype(North,East,South,West)
				translate y * Height
			}
		}
	}
#end

// -------------------------------------------------------------
// Miscellaneous walls

#macro Razor_Wire_Prototype(North,East,South,West)
	#local RazrRat = RazrThk/RazrHgh;
	#local ScaleYZ = RazrHgh * RazrHgh / (RazrHgh + RazrThk * 2);
	#local Razor_Blade = mesh
	{
		#local P_1 = <-2,1,0,>;
		#local P_2 = <+2,1,0,>;
		#local P_3 = <-1,0,0,>;
		#local P_4 = <+1,0,0,>;
		triangle {P_1,P_2,P_4}
		triangle {P_4,P_3,P_1}
		rotate		y * +90
		rotate		z * -90
		scale		RazrRat
	}
	// razor wire on walltops
	#local Razor_Coil = union
	{
		#local RazrT1 = 0;
		#local RazrT2 = 0;
		#local iCount = 0;
		#while (iCount < RazrSt1)
			#local RazrT2 = iCount/RazrSt1;
			#local RazrT1 = (iCount + 1)/RazrSt1;
			#local P_1 = <1			* cos(RazrFq1 * RazrT1 * 2 * pi),	RazrT1,		1		* sin(RazrFq1 * RazrT1 * 2 * pi),>;
			#local P_2 = <(1 - RazrRat)	* cos(RazrFq1 * RazrT1 * 2 * pi),	RazrT1,		(1 - RazrRat)	* sin(RazrFq1 * RazrT1 * 2 * pi),>;
			#local P_3 = <1			* cos(RazrFq1 * RazrT2 * 2 * pi),	RazrT2,		1		* sin(RazrFq1 * RazrT2 * 2 * pi),>;
			#local P_4 = <(1 - RazrRat)	* cos(RazrFq1 * RazrT2 * 2 * pi),	RazrT2,		(1 - RazrRat)	* sin(RazrFq1 * RazrT2 * 2 * pi),>;
			mesh		// could be smoothed
			{
				triangle {P_1,P_2,P_4}
				triangle {P_4,P_3,P_1}
			}
			object
			{
				Razor_Blade
				rotate		-y * degrees(RazrFq1 * RazrT1 * 2 * pi)
				translate	P_1
			}
			object
			{
				Razor_Blade
				rotate		-y * degrees(RazrFq1 * RazrT1 * 2 * pi)
				rotate		+y * 180
				translate	P_2
			}
			#local iCount = iCount + 1;
		#end
		scale		<ScaleYZ,RazrWid,ScaleYZ,>
		rotate		z * 90
	}
	union
	{
		#if (North = 1)
			object
			{
				Razor_Coil
				rotate		y * 270
				translate y * (RazorY + RazrHgh)
			}
		#end
		#if (East = 1)
			object
			{
				Razor_Coil
				rotate		y * 000
				translate y * (RazorY + RazrHgh)
			}
		#end
		#if (South = 1)
			object
			{
				Razor_Coil
				rotate		y * 090
				translate y * (RazorY + RazrHgh)
			}
		#end
		#if (West = 1)
			object
			{
				Razor_Coil
				rotate		y * 180
				translate y * (RazorY + RazrHgh)
			}
		#end
		texture {Razor_Texture}
	}
#end

#macro ChrisB_Wall_Prototype(block_style)
	#local centerpillar = object
	{
		#declare Blockwall_BlockThickness = 1;
		#declare Blockwall_WallHeight = 1;
		#declare Blockwall_WallLength = 1;
		Blockwall(block_style)
		translate -z * 1/2
		translate -x * 1/2
		scale <Width/3,Height,Width/3>
	}
	#local sidepillar = object
	{
		#declare Blockwall_BlockThickness = 1;
		#declare Blockwall_WallHeight = 1;
		#declare Blockwall_WallLength = 1;
		Blockwall(block_style)
		translate -z * 1/2
		translate +x * 1/2
		scale <Width/3,Height,Width/3>
	}
	union
	{
		#if (South = 0)
			object {centerpillar rotate y * 000}
		#else
			object {centerpillar rotate y * 090}
		#end
		#if (North = 1)
			object {sidepillar rotate y * 090}
		#end
		#if (East = 1)
			object {sidepillar rotate y * 180}
		#end
		#if (South = 1)
			object {sidepillar rotate y * 270}
		#end
		#if (West = 1)
			object {sidepillar rotate y * 000}
		#end
	}
#end


#macro Corrugated_Wall_Prototype_a(North,East,South,West)
	#local Wid = Width/16;
	#local post_size = Width/32;
	#local length_long = Width/2-Wid/2;
	#local length_short = Wid*2;
	#local trans_long = Wid+length_long/2;
	#local sin_long = pi * 3;		// 7
	#local sin_short = pi * 1;		// 2
	#local corrugated_metal_a = isosurface
	{
		function {y+sin(x*sin_long)/sin_long}
		max_gradient 2
		open
		scale 1/2
		rotate x * 90
		translate y/2
		scale <length_long,Height-post_size*2,length_long>
		translate y * post_size
	}
	#local corrugated_metal_b = isosurface
	{
		function {y+sin(x*sin_short)/sin_short}
		max_gradient 2
		open
		scale 1/2
		rotate x * 90
		translate y/2
		scale <length_short,Height-post_size*2,length_short>
		translate y * post_size
	}
	union
	{
		union
		{
			#if (North = 1)
				object
				{
					corrugated_metal_a
					rotate y * 090
					translate <-Wid,0,-trans_long>
				}
				object
				{
					corrugated_metal_a
					rotate y * 090
					translate <+Wid,0,-trans_long>
				}
			#else
				object
				{
					corrugated_metal_b
					rotate y * 180
					translate <0,0,-Wid>
				}
			#end
			#if (East = 1)
				object
				{
					corrugated_metal_a
					translate <-trans_long,0,-Wid>
				}
				object
				{
					corrugated_metal_a
					translate <-trans_long,0,+Wid>
				}
			#else
				object
				{
					corrugated_metal_b
					rotate y * 090
					translate <-Wid,0,0>
				}
			#end
			#if (South = 1)
				object
				{
					corrugated_metal_a
					rotate y * 090
					translate <-Wid,0,+trans_long>
				}
				object
				{
					corrugated_metal_a
					rotate y * 090
					translate <+Wid,0,+trans_long>
				}
			#else
				object
				{
					corrugated_metal_b
					rotate y * 180
					translate <0,0,+Wid>
				}
			#end
			#if (West = 1)
				object
				{
					corrugated_metal_a
					translate <+trans_long,0,-Wid>
				}
				object
				{
					corrugated_metal_a
					translate <+trans_long,0,+Wid>
				}
			#else
				object
				{
					corrugated_metal_b
					rotate y * 090
					translate <+Wid,0,0>
				}
			#end
			texture {Sheet_Texture}
		}
		union
		{
			sphere {<-Wid,post_size,-Wid>, post_size}
			sphere {<-Wid,Height-post_size,-Wid>, post_size}
			sphere {<+Wid,post_size,-Wid>, post_size}
			sphere {<+Wid,Height-post_size,-Wid>, post_size}
			sphere {<+Wid,post_size,+Wid>, post_size}
			sphere {<+Wid,Height-post_size,+Wid>, post_size}
			sphere {<-Wid,post_size,+Wid>, post_size}
			sphere {<-Wid,Height-post_size,+Wid>, post_size}
			cylinder {<-Wid,post_size,-Wid>, <-Wid,Height-post_size,-Wid>, post_size}
			cylinder {<+Wid,post_size,-Wid>, <+Wid,Height-post_size,-Wid>, post_size}
			cylinder {<+Wid,post_size,+Wid>, <+Wid,Height-post_size,+Wid>, post_size}
			cylinder {<-Wid,post_size,+Wid>, <-Wid,Height-post_size,+Wid>, post_size}
			cylinder {<-Wid,post_size,-Wid>, <+Wid,post_size,-Wid>, post_size}
			cylinder {<-Wid,post_size,-Wid>, <-Wid,post_size,+Wid>, post_size}
			cylinder {<-Wid,Height-post_size,-Wid>, <+Wid,Height-post_size,-Wid>, post_size}
			cylinder {<-Wid,Height-post_size,-Wid>, <-Wid,Height-post_size,+Wid>, post_size}
			cylinder {<+Wid,post_size,+Wid>, <+Wid,post_size,-Wid>, post_size}
			cylinder {<+Wid,post_size,+Wid>, <-Wid,post_size,+Wid>, post_size}
			cylinder {<+Wid,Height-post_size,+Wid>, <+Wid,Height-post_size,-Wid>, post_size}
			cylinder {<+Wid,Height-post_size,+Wid>, <-Wid,Height-post_size,+Wid>, post_size}
			#if (North = 1)
				sphere {<-Wid,post_size,-Width/2>, post_size}
				sphere {<-Wid,Height-post_size,-Width/2>, post_size}
				sphere {<+Wid,post_size,-Width/2>, post_size}
				sphere {<+Wid,Height-post_size,-Width/2>, post_size}
				cylinder {<-Wid,post_size,-Width/2>, <+Wid,post_size,-Width/2>, post_size}
				cylinder {<-Wid,Height-post_size,-Width/2>, <+Wid,Height-post_size,-Width/2>, post_size}
				cylinder {<-Wid,post_size,-Width/2>, <-Wid,Height-post_size,-Width/2>, post_size}
				cylinder {<+Wid,post_size,-Width/2>, <+Wid,Height-post_size,-Width/2>, post_size}
				cylinder {<-Wid,post_size,-Width/2>, <-Wid,post_size,-Wid>, post_size}
				cylinder {<+Wid,post_size,-Width/2>, <+Wid,post_size,-Wid>, post_size}
				cylinder {<-Wid,Height-post_size,-Width/2>, <-Wid,Height-post_size,-Wid>, post_size}
				cylinder {<+Wid,Height-post_size,-Width/2>, <+Wid,Height-post_size,-Wid>, post_size}
			#end
			#if (East = 1)
				sphere {<-Width/2,post_size,-Wid>, post_size}
				sphere {<-Width/2,Height-post_size,-Wid>, post_size}
				sphere {<-Width/2,post_size,+Wid>, post_size}
				sphere {<-Width/2,Height-post_size,+Wid>, post_size}
				cylinder {<-Width/2,post_size,-Wid>, <-Width/2,post_size,+Wid>, post_size}
				cylinder {<-Width/2,Height-post_size,-Wid>, <-Width/2,Height-post_size,+Wid>, post_size}
				cylinder {<-Width/2,post_size,-Wid>, <-Width/2,Height-post_size,-Wid>, post_size}
				cylinder {<-Width/2,post_size,+Wid>, <-Width/2,Height-post_size,+Wid>, post_size}
				cylinder {<-Width/2,post_size,-Wid>, <-Wid,post_size,-Wid>, post_size}
				cylinder {<-Width/2,post_size,+Wid>, <-Wid,post_size,+Wid>, post_size}
				cylinder {<-Width/2,Height-post_size,-Wid>, <-Wid,Height-post_size,-Wid>, post_size}
				cylinder {<-Width/2,Height-post_size,+Wid>, <-Wid,Height-post_size,+Wid>, post_size}
			#end
			#if (South = 1)
				sphere {<-Wid,post_size,+Width/2>, post_size}
				sphere {<-Wid,Height-post_size,+Width/2>, post_size}
				sphere {<+Wid,post_size,+Width/2>, post_size}
				sphere {<+Wid,Height-post_size,+Width/2>, post_size}
				cylinder {<-Wid,post_size,+Width/2>, <+Wid,post_size,+Width/2>, post_size}
				cylinder {<-Wid,Height-post_size,+Width/2>, <+Wid,Height-post_size,+Width/2>, post_size}
				cylinder {<-Wid,post_size,+Width/2>, <-Wid,Height-post_size,+Width/2>, post_size}
				cylinder {<+Wid,post_size,+Width/2>, <+Wid,Height-post_size,+Width/2>, post_size}
				cylinder {<-Wid,post_size,+Width/2>, <-Wid,post_size,+Wid>, post_size}
				cylinder {<+Wid,post_size,+Width/2>, <+Wid,post_size,+Wid>, post_size}
				cylinder {<-Wid,Height-post_size,+Width/2>, <-Wid,Height-post_size,+Wid>, post_size}
				cylinder {<+Wid,Height-post_size,+Width/2>, <+Wid,Height-post_size,+Wid>, post_size}
			#end
			#if (West = 1)
				sphere {<+Width/2,post_size,-Wid>, post_size}
				sphere {<+Width/2,Height-post_size,-Wid>, post_size}
				sphere {<+Width/2,post_size,+Wid>, post_size}
				sphere {<+Width/2,Height-post_size,+Wid>, post_size}
				cylinder {<+Width/2,post_size,-Wid>, <+Width/2,post_size,+Wid>, post_size}
				cylinder {<+Width/2,Height-post_size,-Wid>, <+Width/2,Height-post_size,+Wid>, post_size}
				cylinder {<+Width/2,post_size,-Wid>, <+Width/2,Height-post_size,-Wid>, post_size}
				cylinder {<+Width/2,post_size,+Wid>, <+Width/2,Height-post_size,+Wid>, post_size}
				cylinder {<+Width/2,post_size,-Wid>, <+Wid,post_size,-Wid>, post_size}
				cylinder {<+Width/2,post_size,+Wid>, <+Wid,post_size,+Wid>, post_size}
				cylinder {<+Width/2,Height-post_size,-Wid>, <+Wid,Height-post_size,-Wid>, post_size}
				cylinder {<+Width/2,Height-post_size,+Wid>, <+Wid,Height-post_size,+Wid>, post_size}
			#end
			texture {Post_Texture}
		}
	}
#end

#macro Corrugated_Wall_Prototype_b(North,East,South,West)
	#local post_size = Width/16;
	#local sin_size = pi*4;
	#local corrugated_metal = isosurface
	{
		function {y+sin(x*sin_size)/sin_size}
		max_gradient 2
		open
		scale 1/2
		rotate x * 90
		translate y/2
		scale <Width/2,Height,Width/2>
	}
	#local metal_post = difference
	{
		box
		{
			<-post_size/2,0,-post_size/2>,
			<+post_size/2,Height,+post_size/2>
		}
		box
		{
			<-post_size/2,0,-post_size/2>,
			<+post_size/2,Height,+post_size/2>
			scale <0.8,1.1,0.8>
		}
	}
	union
	{
		#if (North = 1)
			object
			{
				corrugated_metal
				rotate y * 090
				translate <0,0,-Width/4>
			}
		#end
		#if (East = 1)
			object
			{
				corrugated_metal
				translate <-Width/4,0,0>
			}
		#end
		#if (South = 1)
			object
			{
				corrugated_metal
				rotate y * 090
				translate <0,0,+Width/4>
			}
		#end
		#if (West = 1)
			object
			{
				corrugated_metal
				translate <+Width/4,0,0>
			}
		#end
		texture {Sheet_Texture}
	}
#end

// -------------------------------------------------------------
// Fence posts

#macro Fence_Wall_Posts(North,East,South,West)
	union
	{
		#local Fence_Radius	= Width/64;
		#local Fence_Vector	= -z * Width/2;
		#local Radius_Vector	= +y * Fence_Radius;
		#local UpSky_Vector	= +y * Height - Radius_Vector;
		#local Fence_Section = union
		{
			cylinder {0,Fence_Vector,Fence_Radius translate Radius_Vector}
			cylinder {0,Fence_Vector,Fence_Radius translate UpSky_Vector}
			cylinder {Radius_Vector,UpSky_Vector,Fence_Radius translate Fence_Vector}
			sphere {Fence_Vector,Fence_Radius translate Radius_Vector}
			sphere {Fence_Vector,Fence_Radius translate UpSky_Vector}
		}
		#if (North + East + South + West > 0)
			cylinder {0,UpSky_Vector,Fence_Radius}
		#end
		#if (North = 1)
			object {Fence_Section rotate y * 000}
		#end
		#if (East = 1)
			object {Fence_Section rotate y * 090}
		#end
		#if (South = 1)
			object {Fence_Section rotate y * 180}
		#end
		#if (West = 1)
			object {Fence_Section rotate y * 270}
		#end
		texture {Post_Texture}
	}
#end

// -------------------------------------------------------------
// Bumpy stone

#macro MakeAgateBox(Scale,Translate)
	#local pig_1 = pigment
	{
		MakeAgatePigment
		scale 1/Scale
		translate -Translate
	}
	#local fn_1 = function {pigment {pig_1}}
	#local fn_2 = function {+x - fn_1(x,y,z).gray/16};
	#local fn_3 = function {-x - fn_1(x,y,z).gray/16};
	#local fn_4 = function {+z - fn_1(x,y,z).gray/16};
	#local fn_5 = function {-z - fn_1(x,y,z).gray/16};
	intersection
	{
		isosurface
		{
			function {fn_2(x,y,z) - 1/3}
			contained_by { box { -1, 1 } }
			max_gradient 5
			accuracy 0.0001
		}
		isosurface
		{
			function {fn_3(x,y,z) - 1/3}
			contained_by { box { -1, 1 } }
			max_gradient 5
			accuracy 0.0001
		}
		isosurface
		{
			function {fn_4(x,y,z) - 1/3}
			contained_by { box { -1, 1 } }
			max_gradient 5
			accuracy 0.0001
		}
		isosurface
		{
			function {fn_5(x,y,z) - 1/3}
			contained_by { box { -1, 1 } }
			max_gradient 5
			accuracy 0.0001
		}
		translate y
		translate Translate
		scale Scale
	}
#end

#macro Agate_Wall_Prototype(North,East,South,West)
	#ifndef (AddWindow) #local AddWindow = false; #end
	#local ScaleBox = <Width,Height,Width>/2;
	intersection
	{
		union
		{
			object {MakeAgateBox(ScaleBox,0)}
			#if (North = 1)
				object {MakeAgateBox(ScaleBox,-z/2-z/6)}
			#end
			#if (East = 1)
				object {MakeAgateBox(ScaleBox,-x/2-x/6)}
			#end
			#if (South = 1)
				object {MakeAgateBox(ScaleBox,+z/2+z/6)}
			#end
			#if (West = 1)
				object {MakeAgateBox(ScaleBox,+x/2+x/6)}
			#end
		}
		box
		{
			-1,+1
			translate y
			scale ScaleBox
			texture {Mask_Texture}
		}
		texture {Wall_Texture}
	}
#end

#macro MakeCrackleBox(Scale, Dirs)
	#local pig_1 = pigment
	{
		MakeCracklePigment
		scale 1/Scale
	}
	#local fn_1 = function {pigment {pig_1}}
	#if (Dirs = 1)
		#local fn_2 = function {+x - fn_1(x,y,z).gray/12 - 1};
	#else
		#local fn_2 = function {+x - fn_1(x,y,z).gray/12 - BotThick};
	#end
	#if (Dirs = 2)
		#local fn_3 = function {-x - fn_1(x,y,z).gray/12 - 1};
	#else
		#local fn_3 = function {-x - fn_1(x,y,z).gray/12 - BotThick};
	#end
	#if (Dirs = 3)
		#local fn_4 = function {+z - fn_1(x,y,z).gray/12 - 1};
	#else
		#local fn_4 = function {+z - fn_1(x,y,z).gray/12 - BotThick};
	#end
	#if (Dirs = 4)
		#local fn_5 = function {-z - fn_1(x,y,z).gray/12 - 1};
	#else
		#local fn_5 = function {-z - fn_1(x,y,z).gray/12 - BotThick};
	#end
	intersection
	{
		isosurface
		{
			function {fn_2(x,y,z)}
			contained_by { box { -1, 1 } }
			max_gradient 5
			accuracy 0.0001
		}
		isosurface
		{
			function {fn_3(x,y,z)}
			contained_by { box { -1, 1 } }
			max_gradient 5
			accuracy 0.0001
		}
		isosurface
		{
			function {fn_4(x,y,z)}
			contained_by { box { -1, 1 } }
			max_gradient 5
			accuracy 0.0001
		}
		isosurface
		{
			function {fn_5(x,y,z)}
			contained_by { box { -1, 1 } }
			max_gradient 5
			accuracy 0.0001
		}
		translate +y
		scale Scale
	}
#end

#macro Crackle_Wall_Prototype(North,East,South,West)
	#local ScaleBox = <Width,Height,Width>/2;
	intersection
	{
		union
		{
			object {MakeCrackleBox(ScaleBox,0)}
			#if (North = 1)
				object {MakeCrackleBox(ScaleBox,4)}
			#end
			#if (East = 1)
				object {MakeCrackleBox(ScaleBox,2)}
			#end
			#if (South = 1)
				object {MakeCrackleBox(ScaleBox,3)}
			#end
			#if (West = 1)
				object {MakeCrackleBox(ScaleBox,1)}
			#end
		}
		box
		{
			-1, +1
			translate +y
			scale ScaleBox
			texture {Mask_Texture}
		}
		texture {Wall_Texture}
	}
#end

#macro Fake_Roof(North,East,South,West,fWidth)
	union
	{
		box {<-fWidth/2,+Height+0.00,-fWidth/2>, <+fWidth/2,+Height+0.01,+fWidth/2>}
		#if (North = 1)
			box {<-fWidth/2,+Height+0,-Width/2>, <+fWidth/2,+Height+0.1,+fWidth/2>}
		#end
		#if (East = 1)
			box {<-Width/2,+Height+0,-fWidth/2>, <+fWidth/2,+Height+0.1,+fWidth/2>}
		#end
		#if (South = 1)
			box {<-fWidth/2,+Height+0,-fWidth/2>, <+fWidth/2,+Height+0.1,+Width/2>}
		#end
		#if (West = 1)
			box {<-fWidth/2,+Height+0,-fWidth/2>, <+Width/2,+Height+0.1,+fWidth/2>}
		#end
	}
#end
