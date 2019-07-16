// Desc: GearHead hills generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#declare MaxSteps = 4;
#declare Height = 32;
#declare Width = 64;
#declare MaxHeight = 640;
#declare Seed = seed(9823);
#declare Show_BasicFloor = 0;
#declare Step = 1;

// Basic scene setup
#include "GearHead.inc"                 // Source of the camera and lighting code

// Hill textures
#include "Hills_Textures.inc"                 // Source of the textures

#include "Scenery_Dome.inc"


// -------------------------------------------------------------
// Prototypes

#declare box_a = box
{
	<Height,0,Height,>,
	<-Height,Height,-Height,>
}

#macro Patch_Prototype(North,West,South,East)
	#local Sum = North + West + South + East;
	#local Bin = 16 - 1*North - 2*East - 4*South - 8*West;
	#local R1 = 1234 * rand(Seed)*Step*Bin;
	#local R2 = 4321 * rand(Seed)*Step;
	#local R3 = 2143 * rand(Seed)*Step;
	#local S1 = seed(R1);
	#local Hgh = Height/8;
	#local Wid = Width/2;
	#local Off = Width/16 * Sum;
	#local Alt = 16 + Hgh * Sum;
	#local Pos = <rand(S1)*RandSign(S1)*Off,0,rand(S1)*RandSign(S1)*Off,>;
	#local V = (Step/MaxSteps)*(MaxHeight-Height);
	#local W = Height;				//(V+Height/Step)/2 or Height*(Step+12)/16
	#local X = (rand(S1)*1/3+2/3)*(V+Alt) * 3/4;
	#local Top = X;	//X;
	#declare Peak = <0,X,0,> + Pos;
	union
	{
		#local Y = X*(MaxSteps-Step)/MaxSteps*0;
		#local Z = (rand(S1)*MaxHeight)*(Step/MaxSteps);
		#local A = 0;#local B = 0;#local C = 0;#local D = 0;
		#local E = 0;#local F = Z;#local G = Y;#local H = Y;
		#local I = 0;#local J = Y;#local K = X;#local L = X;
		#local M = 0;#local N = Y;#local O = X;#local P = X;
		#if (North = 1)
			#local S2 = seed(R2);
			#local U = (rand(S2)*3/4+1/4)*W;
			#local C = U;#local D = U;
			#local G = U;#local H = U;
//			#local B = U;			// rand(S1)*U
		#end
		#if (West = 1)
			#local S3 = seed(R3);
			#local U = (rand(S3)*3/4+1/4)*W;
			#local I = U;#local J = U;
			#local M = U;#local N = U;
//			#local E = U;			// rand(S1)*U
		#end
		bicubic_patch
		{
			type 0 flatness 0
			u_steps 4 v_steps 4
			<0+Wid*3/3,A,0-Wid*3/3,>+000, <0+Wid*2/3,B,0-Wid*3/3,>+000, <0+Wid*1/3,C,0-Wid*3/3,>+000, <0+Wid*0/3,D,0-Wid*3/3,>+000
			<0+Wid*3/3,E,0-Wid*2/3,>+000, <0+Wid*2/3,F,0-Wid*2/3,>+Pos, <0+Wid*1/3,G,0-Wid*2/3,>+Pos, <0+Wid*0/3,H,0-Wid*2/3,>+Pos
			<0+Wid*3/3,I,0-Wid*1/3,>+000, <0+Wid*2/3,J,0-Wid*1/3,>+Pos, <0+Wid*1/3,K,0-Wid*1/3,>+Pos, <0+Wid*0/3,L,0-Wid*1/3,>+Pos
			<0+Wid*3/3,M,0-Wid*0/3,>+000, <0+Wid*2/3,N,0-Wid*0/3,>+Pos, <0+Wid*1/3,O,0-Wid*0/3,>+Pos, <0+Wid*0/3,P,0-Wid*0/3,>+Pos
		}
		#local Y = X*(MaxSteps-Step)/MaxSteps*0;
		#local Z = (rand(S1)*MaxHeight)*(Step/MaxSteps);
		#local A = 0;#local B = 0;#local C = 0;#local D = 0;
		#local E = 0;#local F = Z;#local G = Y;#local H = Y;
		#local I = 0;#local J = Y;#local K = X;#local L = X;
		#local M = 0;#local N = Y;#local O = X;#local P = X;
		#if (North = 1)
			#local S2 = seed(R2);
			#local U = (rand(S2)*3/4+1/4)*W;
			#local C = U;#local D = U;
			#local G = U;#local H = U;
//			#local B = U;			// rand(S1)*U
		#end
		#if (East = 1)
			#local S3 = seed(R3);
			#local U = (rand(S3)*3/4+1/4)*W;
			#local I = U;#local J = U;
			#local M = U;#local N = U;
//			#local E = U;			// rand(S1)*U
		#end
		bicubic_patch
		{
			type 0 flatness 0
			u_steps 4 v_steps 4
			<0-Wid*0/3,D,0-Wid*3/3,>+000, <0-Wid*1/3,C,0-Wid*3/3,>+000, <0-Wid*2/3,B,0-Wid*3/3,>+000, <0-Wid*3/3,A,0-Wid*3/3,>+000
			<0-Wid*0/3,H,0-Wid*2/3,>+Pos, <0-Wid*1/3,G,0-Wid*2/3,>+Pos, <0-Wid*2/3,F,0-Wid*2/3,>+Pos, <0-Wid*3/3,E,0-Wid*2/3,>+000
			<0-Wid*0/3,L,0-Wid*1/3,>+Pos, <0-Wid*1/3,K,0-Wid*1/3,>+Pos, <0-Wid*2/3,J,0-Wid*1/3,>+Pos, <0-Wid*3/3,I,0-Wid*1/3,>+000
			<0+Wid*0/3,P,0-Wid*0/3,>+Pos, <0-Wid*1/3,O,0-Wid*0/3,>+Pos, <0-Wid*2/3,N,0-Wid*0/3,>+Pos, <0-Wid*3/3,M,0-Wid*0/3,>+000
		}
		#local Y = X*(MaxSteps-Step)/MaxSteps*0;
		#local Z = (rand(S1)*MaxHeight)*(Step/MaxSteps);
		#local A = 0;#local B = 0;#local C = 0;#local D = 0;
		#local E = 0;#local F = Z;#local G = Y;#local H = Y;
		#local I = 0;#local J = Y;#local K = X;#local L = X;
		#local M = 0;#local N = Y;#local O = X;#local P = X;
		#if (South = 1)
			#local S2 = seed(R2);
			#local U = (rand(S2)*3/4+1/4)*W;
			#local C = U;#local D = U;
			#local G = U;#local H = U;
//			#local B = U;			// rand(S1)*U
		#end
		#if (West = 1)
			#local S3 = seed(R3);
			#local U = (rand(S3)*3/4+1/4)*W;
			#local I = U;#local J = U;
			#local M = U;#local N = U;
//			#local E = U;			// rand(S1)*U
		#end
		bicubic_patch
		{
			type 0 flatness 0
			u_steps 4 v_steps 4
			<0+Wid*3/3,M,0+Wid*0/3,>+000, <0+Wid*2/3,N,0+Wid*0/3,>+Pos, <0+Wid*1/3,O,0+Wid*0/3,>+Pos, <0+Wid*0/3,P,0-Wid*0/3,>+Pos
			<0+Wid*3/3,I,0+Wid*1/3,>+000, <0+Wid*2/3,J,0+Wid*1/3,>+Pos, <0+Wid*1/3,K,0+Wid*1/3,>+Pos, <0+Wid*0/3,L,0+Wid*1/3,>+Pos
			<0+Wid*3/3,E,0+Wid*2/3,>+000, <0+Wid*2/3,F,0+Wid*2/3,>+Pos, <0+Wid*1/3,G,0+Wid*2/3,>+Pos, <0+Wid*0/3,H,0+Wid*2/3,>+Pos
			<0+Wid*3/3,A,0+Wid*3/3,>+000, <0+Wid*2/3,B,0+Wid*3/3,>+000, <0+Wid*1/3,C,0+Wid*3/3,>+000, <0+Wid*0/3,D,0+Wid*3/3,>+000
		}
		#local Y = X*(MaxSteps-Step)/MaxSteps*0;
		#local Z = (rand(S1)*MaxHeight)*(Step/MaxSteps);
		#local A = 0;#local B = 0;#local C = 0;#local D = 0;
		#local E = 0;#local F = Z;#local G = Y;#local H = Y;
		#local I = 0;#local J = Y;#local K = X;#local L = X;
		#local M = 0;#local N = Y;#local O = X;#local P = X;
		#if (South = 1)
			#local S2 = seed(R2);
			#local U = (rand(S2)*3/4+1/4)*W;
			#local C = U;#local D = U;
			#local G = U;#local H = U;
//			#local B = U;			// rand(S1)*U
		#end
		#if (East = 1)
			#local S3 = seed(R3);
			#local U = (rand(S3)*3/4+1/4)*W;
			#local I = U;#local J = U;
			#local M = U;#local N = U;
//			#local E = U;			// rand(S1)*U
		#end
		bicubic_patch
		{
			type 0 flatness 0
			u_steps 4 v_steps 4
			<0+Wid*0/3,P,0-Wid*0/3,>+Pos, <0-Wid*1/3,O,0+Wid*0/3,>+Pos, <0-Wid*2/3,N,0+Wid*0/3,>+Pos, <0-Wid*3/3,M,0+Wid*0/3,>+000
			<0-Wid*0/3,L,0+Wid*1/3,>+Pos, <0-Wid*1/3,K,0+Wid*1/3,>+Pos, <0-Wid*2/3,J,0+Wid*1/3,>+Pos, <0-Wid*3/3,I,0+Wid*1/3,>+000
			<0-Wid*0/3,H,0+Wid*2/3,>+Pos, <0-Wid*1/3,G,0+Wid*2/3,>+Pos, <0-Wid*2/3,F,0+Wid*2/3,>+Pos, <0-Wid*3/3,E,0+Wid*2/3,>+000
			<0-Wid*0/3,D,0+Wid*3/3,>+000, <0-Wid*1/3,C,0+Wid*3/3,>+000, <0-Wid*2/3,B,0+Wid*3/3,>+000, <0-Wid*3/3,A,0+Wid*3/3,>+000
		}
	}
#end


// -------------------------------------------------------------
// Definitions for the various object types

#declare Mountain_Object = union
{
	difference
	{
		Patch_Prototype(North,West,South,East)
		cylinder
		{
			3*Peak/4,
//			0,
			Peak,
			Width/8
		}
		cylinder
		{
			<0,0,-Width/2>,
			<0,0,Width/2>,
			Width/8
		}
		scale y * 1
		translate y * Height * (Step-1)
	}

	#if (Step > 1)
		object
		{
			box_a
			scale y * (Step-1)
			translate y * Height * 0
		}
	#end
//	texture {Hills_Texture_h}
	texture {Hills_Texture_j}
}

#declare Smoke_Texture = texture
{
	pigment
	{
		bozo
		color_map
		{
			[0 color rgbt <1,1,1,0,>]
			[1 color rgbt <1,1,1,1,>]
		}
	}
	finish {Default_Finish}
}

#declare Smoke_Ring_Object = torus
{
	Width/3,
	Width/9
	translate y * Height * (Step-1)
	translate y * 3*Peak/4
	texture {Smoke_Texture}
}

#declare Station_Object = object
{
	Dome_Object
	scale 1/4	// 1/5
	translate y * Height * (Step-1)
	translate y * 3*Peak/4	// y * 4*Peak/5
}


// -------------------------------------------------------------
// the final object: select from one of the floor types by uncommenting the corresponding line

union
{
	#local Step  = 1;			// the current elevation level. (from 1 to MaxSteps)
	#local North = 0;			// is the hill connected on this side? (0 or 1)
	#local East  = 0;			// ...
	#local South = 0;			// ...
	#local West  = 0;			// ...
	object
	{
		Mountain_Object
	}
	object
	{
		Smoke_Ring_Object
	}
	object
	{
		Station_Object
	}
}