// Note: this demo is an edited version of the one included with Chris Colefax's City Generator Include File.
// Colors are messed up in POV-Ray 3.7.

#declare Width = 64;			// the width of the scene.
#declare Height = 64;			// the height of the scene. (doesn't actually do anything.)
#declare Show_GridMarker = 1;
#declare Building_Width = 64;		// the width of a building.
#declare Storey_Height = 128/8;		// the height of each storey. (note: the ratio should always equal roughly 128/8.)
//#declare Max_Storeys = 4;		// roughly, the maximum height of a building, in storeys (actual values are random, and are slightly greater or less than this). (note: a size-1 hill is 32 units tall.)

#declare Max_Storeys = 2 + floor(clock * 4);
#if (Max_Storeys = 0)
	#declare Max_Storeys = 1/2;
#end

#declare Block_Size = 1;		// the number of buildings per block.
#declare Blocks_Number = 1;		// the number of blocks to render.
#declare Scale_Factor = 2;		// the scene is scaled down by this factor.
#declare Random_Height = false;		// if enabled, building heights are randomized.
#declare Add_Roads = false;		// if enabled, roads are added between each block.
#declare Fit_To_Tile = true;		// if enabled, the scene is scaled so that it fits within the target 64-pixel wide sprite (this overrides Scale_Factor).
#declare Rotate_Y = clock * 1440;	// rotate the object around the Y-axis by this amount.
#declare City_Seed = 011099 * frame_number;		// seed for random city generator.

#include "GearHead.inc"

/*
// enable for Lights_Mode 1
background {rgb <.4, .6, .8>}
default {finish {ambient Ambient_Factor diffuse 1}}
fog {fog_type 2 color rgb <.7, .8, .9> distance 300 fog_alt 50}
*/


// -------------------------------------------------------------


// CITY GENERATOR: CITY SCAPE USING FILECITY.MCR
// This scene shows how you can use the FileCity.mcr file to speed
// up multiple renderings of a city.
//
// This scene should be rendered as a four-frame, non-cyclic animation.
// The MyCity.inc file can be deleted when the rendering is finished.

/*
// ENVIRONMENT
   light_source {<-300, 1000, -700> rgb 1}
   light_source {<200, 4000, 100> rgb .5 shadowless}
//   default {finish {ambient .3 diffuse .5}}

   background {rgb <.4, .6, .8>}
//   fog {fog_type 2 color rgb <.7, .8, .9> distance 300 fog_alt 50}

// SEPARATE CAMERAS FOR EACH FRAME
   #switch (int(clock*3))
   #case (0) camera {location <40, 350, -200> look_at <0, 0, 0>} #break
   #case (1) camera {fisheye location <-2, 1, -2> look_at <5, 20, 7> angle 140} #break
   #case (2) camera {location <-200, 40, -150> look_at <-50, 0, 0>} #break
   #case (3) camera {location <-185, 3, 5> look_at <0, 2, 0>} #end
*/

// CREATE CITY AND SAVE TO FILE
   #declare street_width = 10;
   #declare traffic_spacing = 8;
   #declare traffic_lanes = 2;
   #declare pavement_width = 4;
   #declare buildings_per_block = Block_Size;
   #declare building_gap = 4;
   #declare building_width = Building_Width;
   #declare max_building_height = Storey_Height * Max_Storeys * Building_Width / Width;
   #declare min_building_height = 0;
   #if (Random_Height = true)
   	#declare building_height_turb = 1/2;
   #else
   	#declare building_height_turb = 0;
   #end
   #declare building_height_falloff = 0;
   #declare debug_progress = false;
   #declare city_tileable = true;
   #declare city_block_count = Blocks_Number;
   #declare city_seed = Rotate_Y * Max_Storeys * City_Seed;
   #declare city_macro_file = "FILECITY.MCR"
   #declare city_output_file = "MYCITY.INC"


   #if (Block_Size > 1)
   	#declare Is_Block_Gap = 1;
   #else
   	#declare Is_Block_Gap = 0;
   #end
   #if (city_tileable = true)
   	#declare Extra_Road = 0;
   #else
   	#declare Extra_Road = 1;
   #end
   #if (Add_Roads = 1)
	   #declare traffic_width = 8;
	   #declare Road_Width = traffic_width * (traffic_lanes * 2 + 1);
   #else
	   #declare traffic_width = 0;
	   #declare Road_Width = 0;
   #end
   #declare Roads_Number = Blocks_Number + Extra_Road;
   #declare Gaps_Number = (Block_Size - 1) * Blocks_Number;
   #declare Buildings_Width_Sum = (building_width * Block_Size * Blocks_Number);
   
   #if (Fit_To_Tile = true)
   	#declare Scale_Factor = Width / (Buildings_Width_Sum + (pavement_width * 2 * Blocks_Number) + (building_gap * Gaps_Number) + (Road_Width * Roads_Number));
   #else
   	#declare Scale_Factor = 1/Scale_Factor;
   #end


   #declare city_transform = transform
   {
   	rotate y * 180
   	scale Scale_Factor
   	scale y * Width / Building_Width
   	rotate y * Rotate_Y
   }
   

// -------------------------------------------------------------
// the final object: select from one of the floor types by uncommenting the corresponding line
object
{
	#include "CITY.INC"
}
