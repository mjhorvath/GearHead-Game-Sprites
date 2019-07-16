// Desc: GearHead water tile generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#declare MaxSteps = 3;
#declare Height = 32;
#declare Width = 64;

// Basic scene setup
#include "GearHead.inc"                 // Source of the camera and lighting code

// Hill textures
#include "Water_Textures.inc"                 // Source of the textures


// pedestal
#declare box_a = union
{
	#local Wid = Width/2;
	#local Hgh = Height;
	polygon {4, <+Wid,000,-Wid,>, <-Wid,000,-Wid,>, <-Wid,-Hgh,-Wid,>, <+Wid,-Hgh,-Wid,>}
	polygon {4, <-Wid,000,-Wid,>, <-Wid,000,+Wid,>, <-Wid,-Hgh,+Wid,>, <-Wid,-Hgh,-Wid,>}
}


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
			polygon {4, SE1, NE2, SW2, SW1}
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


union
{
	#local Step  = 2;			// the current elevation level. (from 1 to MaxSteps)
	#local North = 1;			// is the hill connected on this side? (0 or 1)
	#local East  = 1;			// ...
	#local South = 1;			// ...
	#local West  = 1;			// ...
//	object
//	{
//		Prism_Prototype(North,West,South,East)
//		translate y * -32 * (Step - 1)
//	}
	#if (Step > 1)
		object
		{
			box_a
			scale y * (Step - 1)
		}
	#end
	texture
	{
		Water_Step3
		finish
		{
			diffuse 1
			ambient 0
		}
	}
//	no_shadow
}
