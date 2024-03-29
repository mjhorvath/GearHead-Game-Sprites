//#declare Tiles = 1/2;
#declare Show_BasicFloor = 1;
#include "GearHead.inc"

// Rune's Particle System
// Sample animation scene file
// 
// Suggested command line settings (for 25 frames per second):
// +kff500 +ki-0.5 +kf1.5 -kc
   
   #declare ShowCloud  = yes;
   #declare ShowSmoke  = yes;
   #declare ShowDust   = yes;
   #declare ShowDebris = yes;
   
   #declare exp_test = no; // show solid spheres instead of ones with fire and smoke textures
   
   #declare camera_location = Camera_Location;
   #declare light_source_location = <-3,3,1>*1000;
   
   #declare FlashSpline =
   spline
   {
      linear_spline
      0.00,0.00,
      0.03,1.00,
      0.10,0.30,
   }

   light_source
   {
      <0,1.5,-0.2>,
      color <1.0,0.4,0.1>*25*FlashSpline(clock)
      fade_power 2 fade_distance 1
      shadowless
   }
   
   global_settings {max_trace_level 100}
   
   #declare BuildingAndGround = box
   {
   	-Width/2,Width/2
   	no_image
   	no_shadow
   	no_reflection
   }
   
   object {BuildingAndGround}
   
// Include particle system include file
// ************************************
   
   #include "particle.inc"	// Rune's Particle System copyright (c) 2002 Rune S. Johansen
   
// ...and particle element include file.
   #include "expl.inc"
   
   
// FIRST PARTICLE SYSTEM - EXPLOSION A
// ***********************************
   
// Clock options
// *************
   
   #declare particle_start  = 0.0;
   #declare particle_end    = 2.0;
   #declare particle_cyclic = off;
   #declare particle_steps  = 50;
   
// General particle options
// ************************
   
   #declare particle_frequency = 150;
   #declare particle_life      = 1.0;
   #declare particle_lifeturb  = 0.5;
   #declare particle_seed      = 234;
   //#declare particle_maxnumber = 100;
   
// Environment options
// *******************
   
   #declare particle_drag      = 0.3;
   #declare particle_transfer  = 0.0;
   
   #macro particle_gravity  (Clock,Point) 200*y #end
   #macro particle_wind     (Clock,Point) 5*x #end
   
// Emitter options
// ***************
   
   #macro particle_emitter  (Clock) <0,1.3,0> #end
   #macro particle_emitting (Clock) (Clock<0.05) #end
   #macro particle_emitvect (Clock) <0,0,0> #end
   #macro particle_emitturb (Clock) 30.0     #end
   //#macro particle_emitobj  (Clock) object {} #end
   
// Collision options
// *****************
   
   #declare particle_blockobj     = BuildingAndGround
   #declare particle_bounce       = 1.0;
   #declare particle_bounceturb   = 0.0;
   #declare particle_friction     = 0.0;
   #declare particle_bounceoffset = 0.01;
   //#macro particle_killobj    (Clock) object {}    #end
   
// Particle element macro (optional)
// *********************************
   
   #declare exp_size       = 32.0;
   #declare exp_opacity    = 1.0;
   #declare exp_emission   = 2.5;
   #declare exp_smokeshade = 0.4;
   #declare exp_smokeglow  = 1.5;
   #declare exp_smokestart = 0.14;
   #declare exp_fireend    = 0.23;
   #declare exp_ambient    = 0.5;
   
   #macro particle_element() exp_element() #end
   
// Call particle system
// ********************
   
   #if (ShowCloud)
      particle_system ("explosion_a")
   #end
   
   
// SECOND PARTICLE SYSTEM - EXPLOSION B
// ************************************
   
   #declare particle_frequency = 60;
   #macro particle_emitting (Clock) on #end
   //#macro particle_emitvect (Clock) <0,0,0> #end
   #macro particle_emitturb (Clock) max(7+5,20-20*Clock) #end
   
   #declare exp_size       = 2.5;
   #declare exp_opacity    = 1.0;
   #declare exp_emission   = 2.5;
   #declare exp_smokeshade = 0.4;
   #declare exp_smokeglow  = 1.5;
   #declare exp_smokestart = 0.14;
   #declare exp_fireend    = 0.23;
   
   #macro particle_element() exp_element() #end
   
// Call particle system
// ********************
   
   #if (ShowSmoke)
      particle_system ("explosion_b")
   #end
   
   
// THIRD PARTICLE SYSTEM - DUST
// ****************************
   
   #declare particle_frequency = 150;
   #declare particle_life      = 2.5*1.5;
   
   #macro particle_emitter  (Clock) <0,0.7,0> #end
   #macro particle_emitting (Clock) (Clock<0.05) #end
   //#macro particle_emitvect (Clock) <0,0,0> #end
   #macro particle_emitturb (Clock) 35 #end
   
   #macro particle_gravity  (Clock,Point) -10*y #end
   
   #declare particle_blockobj    = plane{y,0}
   
   #declare exp_size       = 6.0;
   #declare exp_opacity    = 0.3;
   #declare exp_emission   = 0.0;
   #declare exp_smokeshade = 1.0;
   #declare exp_smokeglow  = 0.0;
   #declare exp_smokestart = 0.00;
   #declare exp_fireend    = 0.00;
   
   #macro particle_element() exp_element() #end
   
// Call particle system
// ********************
   
   #if (ShowDust)
      particle_system ("dust")
   #end
   
   
// FOURTH PARTICLE SYSTEM - DEBRIS
// *******************************
   
// Clock options
// *************
   
   #declare particle_start  = 0.0;
   #declare particle_end    = 2.0;
   #declare particle_cyclic = off;
   #declare particle_steps  = 50;
   
// General particle options
// ************************
   
   #declare particle_frequency = 5000;
   #declare particle_life      = 2.0;
   #declare particle_lifeturb  = 0.5;
   #declare particle_seed      = 243;
   #declare particle_maxnumber = 250;
   
// Environment options
// *******************
   
   #declare particle_drag      = 0.0;
   #declare particle_transfer  = 0.0;
   
   #macro particle_gravity  (Clock,Point) -150*y #end
   #macro particle_wind     (Clock,Point) <0,0,0> #end
   
// Emitter options
// ***************
   
   #macro particle_emitter  (Clock) <0,1.3,-0.1> #end
   #macro particle_emitting (Clock) (Clock<0.05) #end
   #macro particle_emitvect (Clock) <0,0,-30>  #end
   #macro particle_emitturb (Clock) 35         #end
   //#macro particle_emitobj  (Clock) object {} #end
   
// Collision options
// *****************
   
   #declare particle_blockobj    = BuildingAndGround
   #declare particle_bounce       = 0.2;
   #declare particle_bounceturb   = 0.0;
   #declare particle_friction     = 1.0;
   #declare particle_bounceoffset = 0.01;
   //#macro particle_killobj    (Clock) object {}    #end
   
// Particle element macro (optional)
// *********************************
   
   #macro particle_element ()
      #local Seed = seed(p_random*1000);
      box {
         -1, 1 scale <0.04,0.04,0.10>*(0.5+1.0*rand(Seed))
         pigment {rgb (<0.70,0.95,1.00>+<0.30,0.05,0.00>*rand(Seed))*(0.2+0.5*rand(Seed))}
         finish {ambient 0.7 diffuse 0.3}
         rotate (p_rotate+p_location.z*(rand(Seed)-0.5))*360*y
         translate p_location
      }
   #end
   
// Call particle system
// ********************
   
   #if (ShowDebris)
      particle_system ("debris")
   #end
   