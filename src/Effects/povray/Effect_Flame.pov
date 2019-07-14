#declare Scale_All = 2;
#declare Tiles = 1/8 * Scale_All;
#include "GearHead.inc"

global_settings {max_trace_level 50}

#declare Flame_Obj = sphere
{
	0, 2.0 scale <1,0.1,1> translate 0.5*y scale Scale_All
	pigment {gamma_color_adjust(<0.85,0.45,0.15>)}
}

// Rune's Particle System
// Sample animation scene file
// 
// Suggested command line settings (for 25 frames per second):
// +kff50 +kf2 +kc
   
   
// Include particle system include file
// ************************************
   
   #include "particle.inc"	// Rune's Particle System copyright (c) 2002 Rune S. Johansen
   
// Clock settings
// **************
   
   #declare particle_start  = 0.0;
   #declare particle_end    = 2.0;
   #declare particle_cyclic = on;
   #declare particle_steps  = 100;
   
// General particle settings
// *************************
   
   #declare particle_frequency = 40;
   #declare particle_life      = 0.7;
   #declare particle_lifeturb  = 0.3;
   #declare particle_seed      = 123;
   //#declare particle_maxnumber = 100;
   
// Environment settings
// ********************
   
   #declare particle_drag      = 0.0;
   #declare particle_transfer  = 0.0;
   
   #macro particle_gravity  (Clock,Point) 40*y #end
   #macro particle_wind     (Clock,Point) <0,0,0> #end
   
// Emitter settings
// ****************
   
   #macro particle_emitter  (Clock) <0,0,0> #end
   #macro particle_emitting (Clock) on      #end
   #macro particle_emitvect (Clock) <0,0,0> #end
   #macro particle_emitturb (Clock) 1.5     #end
   #macro particle_emitobj  (Clock) Flame_Obj #end
   #macro particle_emitobjn (Clock) 0.0     #end
   
// Collision settings
// ******************
   
// (Collision settings not used)
   
// Call particle system
// ********************
   
   particle_system ("fire_temp")
   
// Load system
// ***********
   
   #include "fire.inc"
   
   #declare fire_method     = 1;
   #declare fire_color      = gamma_color_vector(<0.85,0.45,0.15>);
   #declare fire_intensity  = 2.0;
   #declare fire_highlight  = 0;
   #declare fire_samples    = 5;
   #declare fire_turbulence = 1.0;
   #declare fire_size       = 1.2 * Scale_All;
   #declare fire_stretch    = 0.1;
   
union
{
   fire_create("fire_temp")
	scale 2/3
}
   
// Scene setup
// ***********
  

   light_source {
      fire_center, gamma_color_adjust(0.25*fire_light*<1.0,0.7,0.4>)
      fade_power 2 fade_distance 10
      area_light 5*x, 5*z, 5, 5 jitter adaptive 0 circular orient
   }
   