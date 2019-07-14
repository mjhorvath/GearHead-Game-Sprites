// -------------------------------------------------------------
// hills

// pedestal
#declare box_a = box
{
	<+32, +0,+32,>,
	<-32,+32,-32,>
}

/*
// Heightfield method
#declare Hills_Heightfield_Prototype = union
{
	#local Step  = 3;			// the current elevation level. (from 1 to MaxSteps)
	#local North = 1;			// is the hill connected on this side? (0 or 1)
	#local East  = 0;			// ...
	#local South = 1;			// ...
	#local West  = 0;			// ...
	#local Bin = North*1 + East*2 + South*4 + West*8;
	#local File = concat("hll_sml_",str(Bin,0,0));
	height_field
	{

		png
		File
		smooth
		scale <64,32,64>
		scale y * 255/174	// 255/189		// max possible heightfield value / max actual heightfield value (e.g. whatever the brightest value in the heightfield happens to be)
		scale y * 1
		translate <-32,0,-32,>
		translate y * 32 * (Step - 1)
		rotate y * 180
	}
	#if (Step > 1)
		object
		{
			box_a
			scale y * (Step - 1)
			translate y * 32 * 0	// normally 32, 16 or 24 for the smaller ones
		}
	#end
}
*/

// New Methods
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
	#local X = (rand(S1)*1/3+2/3)*(V+Alt);
	#declare Peak = <0,X,0,> + Pos;
	union
	{
		#local Y = X*(MaxSteps-Step)/MaxSteps;
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
		#local Y = X*(MaxSteps-Step)/MaxSteps;
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
		#local Y = X*(MaxSteps-Step)/MaxSteps;
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
		#local Y = X*(MaxSteps-Step)/MaxSteps;
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

// Old Methods
// like hill_sml_a, but with a lower height
#declare hill_sml_d = bicubic_patch
{
	type 0 flatness 0
	u_steps 4 v_steps 4
	<32/1,0,-32/1>, <32/1,0,-32/3>, <32/1,0,32/3>, <32/1,0,32/1>
	<32/3,0,-32/1>, <32/3,48/1,-32/3>, <32/3,48/1,32/3>, <32/3,0,32/1>
	<-32/3,0,-32/1>, <-32/3,48/1,-32/3>, <-32/3,48/3,32/3>, <-32/3,0,32/1>
	<-32/1,0,-32/1>, <-32/1,0,-32/3>, <-32/1,0,32/3>, <-32/1,0,32/1>
}


// this one is my favorite, but it's skewed and the height is off
#declare hill_sml_b = bicubic_patch
{
	type 0 flatness 0
	u_steps 4 v_steps 4
	<32/1,0,-32/1>, <32/1,0,-32/3>, <32/1,0,32/3>, <32/1,0,32/1>
	<32/3,0,-32/1>, <32/3,64/1,-32/3>, <32/3,64/1,32/3>, <32/3,0,32/1>
	<-32/3,0,-32/1>, <-32/3,64/1,-32/3>, <-32/3,64/3,32/3>, <-32/3,0,32/1>
	<-32/1,0,-32/1>, <-32/1,0,-32/3>, <-32/1,0,32/3>, <-32/1,0,32/1>
}


// this one is the most 'correct' patch shape so far
#declare hill_sml_a = bicubic_patch
{
	type 0 flatness 0
	u_steps 4 v_steps 4
	<32/1,0,-32/1>, <32/1,0,-32/3>, <32/1,0,32/3>, <32/1,0,32/1>
	<32/3,0,-32/1>, <32/3,64/1,-32/3>, <32/3,64/1,32/3>, <32/3,0,32/1>
	<-32/3,0,-32/1>, <-32/3,64/1,-32/3>, <-32/3,64/1,32/3>, <-32/3,0,32/1>
	<-32/1,0,-32/1>, <-32/1,0,-32/3>, <-32/1,0,32/3>, <-32/1,0,32/1>
}

// Square method
// try this along with hill_sml_c
#declare box_b = union
{
	#local Wid = Width/2;
	#local Hgh = Height;
	smooth_triangle
	{
		<+Wid,000,+Wid,>,
		<+Wid,000,+Wid,>,
		<+Wid,Hgh,+Wid,>,
		<+Wid,Hgh,+Wid,>,
		<+Wid,000,-Wid,>,
		<+Wid,000,-Wid,>
	}
	smooth_triangle
	{
		<+Wid,Hgh,+Wid,>,
		<+Wid,Hgh,+Wid,>,
		<+Wid,Hgh,-Wid,>,
		<+Wid,Hgh,-Wid,>,
		<+Wid,000,-Wid,>,
		<+Wid,000,-Wid,>
	}

	smooth_triangle
	{
		<+Wid,000,+Wid,>,
		<+Wid,000,+Wid,>,
		<+Wid,Hgh,+Wid,>,
		<+Wid,Hgh,+Wid,>,
		<-Wid,000,+Wid,>,
		<-Wid,000,+Wid,>
	}
	smooth_triangle
	{
		<+Wid,Hgh,+Wid,>,
		<+Wid,Hgh,+Wid,>,
		<-Wid,Hgh,+Wid,>,
		<-Wid,Hgh,+Wid,>,
		<-Wid,000,+Wid,>,
		<-Wid,000,+Wid,>
	}

}


// this one has the same shape as the original hills
#macro Prism_Prototype(North, West, South, East)
	union
	{
		#local Wid = Width/2;
		#local Hlf = Width/4;
		#local Hgh = Height;
		#local NW1 = <+Wid,000,-Wid,>;
		#local NE1 = <-Wid,000,-Wid,>;
		#local SW1 = <+Wid,000,+Wid,>;
		#local SE1 = <-Wid,000,+Wid,>;
		#local NW2 = <+Hlf,Hgh,-Hlf,>;
		#local NE2 = <-Hlf,Hgh,-Hlf,>;
		#local SW2 = <+Hlf,Hgh,+Hlf,>;
		#local SE2 = <-Hlf,Hgh,+Hlf,>;
		#local NNW = <+Hlf,Hgh,-Wid,>;
		#local NNE = <-Hlf,Hgh,-Wid,>;
		#local NEE = <-Wid,Hgh,-Hlf,>;
		#local SEE = <-Wid,Hgh,+Hlf,>;
		#local SSE = <-Hlf,Hgh,+Wid,>;
		#local SSW = <+Hlf,Hgh,+Wid,>;
		#local SWW = <+Wid,Hgh,+Hlf,>;
		#local NWW = <+Wid,Hgh,-Hlf,>;

		// North		
		#if (North = 1)
			polygon {4, NW1, NNW, NNE, NE1}
			polygon {4, NW2, NNW, NNE, NE2}
			triangle {NW1,NNW,NW2}
			triangle {NE2,NNE,NE1}
		#else
			polygon {4, NW1, NW2, NE2, NE1}
		#end

		// West
		#if (West = 1)
			polygon {4, SW1, SWW, NWW, NW1}
			polygon {4, SW2, SWW, NWW, NW2}
			triangle {NWW,NW1,NW2}
			triangle {SWW,SW1,SW2}
		#else
			polygon {4, SW1, SW2, NW2, NW1}
		#end

		// South
		#if (South = 1)
			polygon {4, SE1, SSE, SSW, SW1}
			polygon {4, SE2, SSE, SSW, SW2}
			triangle {SW1,SSW,SW2}
			triangle {SE2,SSE,SE1}
		#else
			polygon {4, SE1, SE2, SW2, SW1}
		#end

		// East
		#if (East = 1)
			polygon {4, NE1, NEE, SEE, SE1}
			polygon {4, NE2, NEE, SEE, SE2}
			triangle {NE1,NEE,NE2}
			triangle {SE2,SEE,SE1}
		#else
			polygon {4, NE1, NE2, SE2, SE1}
		#end

		// Top middle
		polygon {4, NW2, NE2, SE2, SW2}
		// Bottom middle
		polygon {4, NW1, NE1, SE1, SW1}
	}
#end


// this one has the same shape as the original hills, but is smoothed
#macro Prism_Prototype2(North, West, South, East)
	union
	{
		#local Wid = Width/2;
		#local Hlf = Width/4;
		#local Hgh = Height;
		#local NW1 = <+Wid,000,-Wid,>;
		#local NE1 = <-Wid,000,-Wid,>;
		#local SW1 = <+Wid,000,+Wid,>;
		#local SE1 = <-Wid,000,+Wid,>;
		#local NW2 = <+Hlf,Hgh,-Hlf,>;
		#local NE2 = <-Hlf,Hgh,-Hlf,>;
		#local SW2 = <+Hlf,Hgh,+Hlf,>;
		#local SE2 = <-Hlf,Hgh,+Hlf,>;
		#local NNW = <+Hlf,Hgh,-Wid,>;
		#local NNE = <-Hlf,Hgh,-Wid,>;
		#local NEE = <-Wid,Hgh,-Hlf,>;
		#local SEE = <-Wid,Hgh,+Hlf,>;
		#local SSE = <-Hlf,Hgh,+Wid,>;
		#local SSW = <+Hlf,Hgh,+Wid,>;
		#local SWW = <+Wid,Hgh,+Hlf,>;
		#local NWW = <+Wid,Hgh,-Hlf,>;

		// North		
		#if (North = 1)
			smooth_triangle {NW1,NW1,NNW,NNW,NE1,NE1}
			smooth_triangle {NNW,NNW,NNE,NNE,NE1,NE1}
			smooth_triangle {NW1,NW1,NNW,NNW,NW2,NW2}
			smooth_triangle {NE2,NE2,NNE,NNE,NE1,NE1}
			smooth_triangle {NW2,NW2,NNW,NNW,NE2,NE2}
			smooth_triangle {NNW,NNW,NNE,NNE,NE2,NE2}
		#else
			smooth_triangle {NW1,NW1,NW2,NW2,NE1,NE1}
			smooth_triangle {NW2,NW2,NE2,NE2,NE1,NE1}
		#end

		// West
		#if (West = 1)
			smooth_triangle {SW1,SW1,SWW,SWW,NW1,NW1}
			smooth_triangle {NWW,NWW,SWW,SWW,NW1,NW1}
			smooth_triangle {NWW,NWW,NW1,NW1,NW2,NW2}
			smooth_triangle {SWW,SWW,SW1,SW1,SW2,SW2}
			smooth_triangle {NWW,NWW,SWW,SWW,NW2,NW2}
			smooth_triangle {SWW,SWW,NW2,NW2,SW2,SW2}
		#else
			smooth_triangle {SW1,SW1,SW2,SW2,NW1,NW1}
			smooth_triangle {NW2,NW2,SW2,SW2,NW1,NW1}
		#end

		// South
		#if (South = 1)
			smooth_triangle {SW1,SW1,SSW,SSW,SE1,SE1}
			smooth_triangle {SSW,SSW,SSE,SSE,SE1,SE1}
			smooth_triangle {SW1,SW1,SSW,SSW,SW2,SW2}
			smooth_triangle {SE2,SE2,SSE,SSE,SE1,SE1}
			smooth_triangle {SW2,SW2,SSW,SSW,SE2,SE2}
			smooth_triangle {SSW,SSW,SSE,SSE,SE2,SE2}
		#else
			smooth_triangle {SW1,SW1,SW2,SW2,SE1,SE1}
			smooth_triangle {SW2,SW2,SE2,SE2,SE1,SE1}
		#end

		// East
		#if (East = 1)
			smooth_triangle {NE1,NE1,NEE,NEE,SE1,SE1}
			smooth_triangle {NEE,NEE,SEE,SEE,SE1,SE1}
			smooth_triangle {NE1,NE1,NEE,NEE,NE2,NE2}
			smooth_triangle {SE2,SE2,SEE,SEE,SE1,SE1}
			smooth_triangle {NE2,NE2,NEE,NEE,SE2,SE2}
			smooth_triangle {NEE,NEE,SEE,SEE,SE2,SE2}
		#else
			smooth_triangle {NE1,NE1,NE2,NE2,SE1,SE1}
			smooth_triangle {NE2,NE2,SE2,SE2,SE1,SE1}
		#end

		// Top middle
		smooth_triangle {NW2,NW2,NE2,NE2,SE2,SE2}
		smooth_triangle {NW2,NW2,SE2,SE2,SW2,SW2}

	}
#end

// -------------------------------------------------------------
// road

#macro Road_Intersect(North,East,South,West)
	#local Wid1 = Width/2;
	#local Wid2 = Road_Width/2;
	#local Hgh = Height;
	#local N1 = <0,0,-Wid1,>;
	#local E1 = <-Wid1,0,0,>;
	#local S1 = <0,0,+Wid1,>;
	#local W1 = <+Wid1,0,0,>;
	#local N2 = <0,0,-Wid2,>;
	#local E2 = <-Wid2,0,0,>;
	#local S2 = <0,0,+Wid2,>;
	#local W2 = <+Wid2,0,0,>;
	#local Up = <0,+Hgh,0,>;
	#local NW1 = N1 + W1;
	#local NE1 = N1 + E1;
	#local SE1 = S1 + E1;
	#local SW1 = S1 + W1;
	#local NW2 = N2 + W2;
	#local NE2 = N2 + E2;
	#local SE2 = S2 + E2;
	#local SW2 = S2 + W2;
	#local NNW = N1 + W2;
	#local NNE = N1 + E2;
	#local NEE = N2 + E1;
	#local SEE = S2 + E1;
	#local SSE = S1 + E2;
	#local SSW = S1 + W2;
	#local SWW = S2 + W1;
	#local NWW = N2 + W1;
	#local Pattern_1 = texture
	{
		#local Len = Stripe_Length + Stripe_Gap;
		gradient z
		texture_map
		{
			[0 Divider_Texture]
			[Stripe_Length/Len Divider_Texture]
			[Stripe_Length/Len Road_Texture]
			[1 Road_Texture]
		}
		scale z * Len
	}
	
	#local Pattern_2 = texture
	{
		#local Wid = Road_Width;
		gradient x
		texture_map
		{
			[0 Curb_Texture]
			[Curb_Width/Wid Curb_Texture]
			[Curb_Width/Wid Stripe_Texture]
			[(Curb_Width+Stripe_Width)/Wid Stripe_Texture]
			[(Curb_Width+Stripe_Width)/Wid Road_Texture]
			[(1-Stripe_Width/Wid)/2 Road_Texture]
			[(1-Stripe_Width/Wid)/2 Pattern_1]
			[(1+Stripe_Width/Wid)/2 Pattern_1]
			[(1+Stripe_Width/Wid)/2 Road_Texture]
			[1-(Curb_Width+Stripe_Width)/Wid Road_Texture]
			[1-(Curb_Width+Stripe_Width)/Wid Stripe_Texture]
			[1-Curb_Width/Wid Stripe_Texture]
			[1-Curb_Width/Wid Curb_Texture]
			[1 Curb_Texture]
		}
		translate x * -1/2
		scale x * Wid
	}
	
	#local Pattern_3 = texture {Pattern_2 rotate y * 90}
	
	#local Pattern_4 = texture
	{
		radial
		texture_map
		{
			[0/8 Pattern_3]
			[1/8 Pattern_3]
			[1/8 Pattern_2]
			[3/8 Pattern_2]
			[3/8 Pattern_3]
			[5/8 Pattern_3]
			[5/8 Pattern_2]
			[7/8 Pattern_2]
			[7/8 Pattern_3]
			[8/8 Pattern_3]
		}
	}
	union
	{
		#if (North = 1)
			#if (Road_Width != Width)
				polygon {4, NW2, NNW, NNE, NE2 texture {Pattern_2}}
			#end
			polygon {3, NW2, NE2, 0 texture {Pattern_2}}
		#else
			#if ((Road_Width != Width) & (Fill_Corners = 1))
				polygon {4, NW2, NNW, NNE, NE2 texture {Side_Texture}}
			#end
			polygon {3, NW2, NE2, 0 texture {Pattern_3}}
		#end
		#if (East = 1)
			#if (Road_Width != Width)
				polygon {4, NE2, NEE, SEE, SE2 texture {Pattern_3}}
			#end
			polygon {3, NE2, SE2, 0 texture {Pattern_3}}
		#else
			#if ((Road_Width != Width) & (Fill_Corners = 1))
				polygon {4, NE2, NEE, SEE, SE2 texture {Side_Texture}}
			#end
			polygon {3, NE2, SE2, 0 texture {Pattern_2}}
		#end
		#if (South = 1)
			#if (Road_Width != Width)
				polygon {4, SE2, SSE, SSW, SW2 texture {Pattern_2}}
			#end
			polygon {3, SE2, SW2, 0 texture {Pattern_2}}
		#else
			#if ((Road_Width != Width) & (Fill_Corners = 1))
				polygon {4, SE2, SSE, SSW, SW2 texture {Side_Texture}}
			#end
			polygon {3, SE2, SW2, 0 texture {Pattern_3}}
		#end
		#if (West = 1)
			#if (Road_Width != Width)
				polygon {4, SW2, SWW, NWW, NW2 texture {Pattern_3}}
			#end
			polygon {3, SW2, NW2, 0 texture {Pattern_3}}
		#else
			#if ((Road_Width != Width) & (Fill_Corners = 1))
				polygon {4, SW2, SWW, NWW, NW2 texture {Side_Texture}}
			#end
			polygon {3, SW2, NW2, 0 texture {Pattern_2}}
		#end
		#if ((Road_Width != Width) & (Fill_Corners = 1))
			polygon {4, NWW, NW1, NNW, NW2 texture {Side_Texture}}
			polygon {4, NNE, NE1, NEE, NE2 texture {Side_Texture}}
			polygon {4, SEE, SE1, SSE, SE2 texture {Side_Texture}}
			polygon {4, SSW, SW1, SWW, SW2 texture {Side_Texture}}
		#end
	}
#end

// -------------------------------------------------------------
// water

#macro Water_Surface_A()
	parametric
	{
		#local sin_frq = 4;
		#local sin_hgt = 2;
		function {u * Width - Width/2}
		function {sin_hgt/2 * (sin(u*2*pi*sin_frq) + sin(v*2*pi*sin_frq))}
		function {v * Width - Width/2}
		<0,0>, <1,1>
		accuracy 0.01
		precompute 10 x,y,z
		contained_by
		{
			box { -Width/2, Width/2 }
		}
		texture {Water_Texture_a}
		clipped_by
		{
			plane {x,0 rotate y * (-45 + Flip * 180)}
		}
	}
#end

#macro Water_Surface_B()
	isosurface
	{
		function { y - f_noise3d(x/8 + frame_number * Width, 0, z/8) * 4 }
	 	contained_by
		{
			box { -Width/2, Width/2 }
		}
		open
		texture {Water_Texture_a}
		clipped_by
		{
			plane {x,0 rotate y * (-45 + Flip * 180)}
		}
	}
#end

#macro Water_Surface_C()
	object
	{
		#local sin_frq = 4;
		#local sin_hgt = 2;
		#include "param.inc"
		Parametric
		(
			function (u,v) {u * Width - Width/2},
			function (u,v) {sin_hgt/2 * (sin(u*2*pi*sin_frq) + sin(v*2*pi*sin_frq))},
			function (u,v) {v * Width - Width/2}
			<0,0>, <1,1>, 20, 10, ""
		)
		texture {Water_Texture_a}
		clipped_by
		{
			plane {x,0 rotate y * (-45 + Flip * 180)}
		}
	}
#end

#macro Water_Surface_D()
	polygon
	{
		4, <Width/2,0,-Width/2,>, <-Width/2,0,-Width/2,>, <-Width/2,0,Width/2,>, <Width/2,0,Width/2,>
		texture {Water_Texture_b}
		clipped_by
		{
			plane {x,0 rotate y * (-45 + Flip * 180)}
		}
	}
#end

#declare Water_Lvl1 = box
{
	-Width/2, <Width,0,Width,>
	pigment { gamma_color_adjust(<0/4,1/4,2/4> * 4/4) }
}

#declare Water_Lvl2 = box
{
	-Width/2, <Width,0,Width,>
	pigment { gamma_color_adjust(<0/4,1/4,2/4> * 2/4) }
}

#declare Water_Lvl3 = box
{
	-Width/2, <Width,0,Width,>
	pigment { gamma_color_adjust(<0/4,1/4,2/4> * 1/4) }
}

#declare Water_Rear_Lvl1 = polygon
{
	3, <Width/2,0,-Width/2,>, <-Width/2,0,-Width/2,>, <-Width/2,0,Width/2,>
	pigment { gamma_color_adjust(<0,0.25,0.5> * 3/3) }
}

#declare Water_Rear_Lvl2 = polygon
{
	3, <Width/2,0,-Width/2,>, <-Width/2,0,-Width/2,>, <-Width/2,0,Width/2,>
	pigment { gamma_color_adjust(<0,0.25,0.5> * 2/3) }
}

#declare Water_Rear_Lvl3 = polygon
{
	3, <Width/2,0,-Width/2,>, <-Width/2,0,-Width/2,>, <-Width/2,0,Width/2,>
	pigment { gamma_color_adjust(<0,0.25,0.5> * 1/3) }
}

#declare Water_Front = polygon
{
	3, <Width/2,0,-Width/2,>, <-Width/2,0,-Width/2,>, <-Width/2,0,Width/2,>
	rotate y * 180
	pigment { gamma_color_adjust(<0,0,0>) }
}
