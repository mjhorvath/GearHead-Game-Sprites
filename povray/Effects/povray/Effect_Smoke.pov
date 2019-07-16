#include "GearHead.inc"

// Rune's Particle System
// Sample animation scene file
// 
// Suggested command line settings (for 25 frames per second):
// +kff500 +ki-0.5 +kf1.5 -kc

   #declare ShowCloud  = no;
   #declare ShowSmoke  = yes;
   #declare ShowDust   = no;
   #declare ShowDebris = no;
   
   #declare exp_test = no; // show solid spheres instead of ones with fire and smoke textures
   
   #declare FocusSpline =
   spline {
      natural_spline
      -0.50,<0,0,5>,
      +0.10,<0,0,8>,
      +0.50,<0,0,1>,
      +0.80,<0,0,1>,
      +1.30,<0,0,0>,
   }
   
   #declare FlashSpline =
   spline {
      linear_spline
      0.00,0.00,
      0.03,1.00,
      0.10,0.30,
   }
   light_source {
      <0,1.5,-0.2>,
      gamma_color_adjust(<1.0,0.4,0.1>*25*FlashSpline(clock))
      fade_power 2 fade_distance 1
      shadowless
   }
   
   global_settings {max_trace_level 50}
   
   #declare BuildingAndGround = plane {y,0 pigment {color rgb 1}}

   #declare camera_location = Camera_Location;
   
//   object {BuildingAndGround}
   
// Include particle system include file
// ************************************
   
   #include "particle.inc"	// Rune's Particle System copyright (c) 2002 Rune S. Johansen
   
// ...and particle element include file.
   #include "expl.inc"
   
   
union
{   
// FIRST PARTICLE SYSTEM - EXPLOSION A
// ***********************************
   
// Clock options
// *************
   
   #declare particle_start  = 0;
   #declare particle_end    = 1.0;
   #declare particle_cyclic = on;
   #declare particle_steps  = 50;
   
// General particle options
// ************************
   
   #declare particle_frequency = 150;
   #declare particle_life      = 0.5;
   #declare particle_lifeturb  = 0.5;
   #declare particle_seed      = 234;
   //#declare particle_maxnumber = 100;
   
// Environment options
// *******************
   
   #declare particle_drag      = 0.3;
   #declare particle_transfer  = 0.0;
   
   #macro particle_gravity  (Clock,Point) 100*y #end	//200*y
   #macro particle_wind     (Clock,Point) 0*x #end	//5*x
   
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
   
   #declare exp_size       = 4.0;
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
   

   #declare exp_size       = 2.5;	//2.5	The size of the fire/smoke elements                                           
   #declare exp_opacity    = 1.0;	//1.0	How solid the fire/smoke element is                                           
   #declare exp_emission   = 0;		//2.5	How much the fire element glows                                               
   #declare exp_smokeshade = 0.1;	//0.4	The shade of the smoke - 0.0 is black, 1.0 is more like white                 
   #declare exp_smokeglow  = 0;		//1.5	How much the smoke is glowing due to the illumination from the fire           
   #declare exp_smokestart = -1;		//0.14	At which point in the particle's life there will appear smoke                 
   #declare exp_fireend    = -1;		//0.23	At which point in the particle's life the fire will disappear (must be >= exp_smokestart)
   #declare exp_ambient    = 0;		//0.1	The ambient lighting of the smoke                                             
   #declare exp_test       = 0;         //0	Set it to true to have the fire and smoke replaced by spheres with grid lines.
   
   #macro particle_element() exp_element() #end
   
// Call particle system
// ********************
   
   #if (ShowSmoke)
      union {particle_system ("explosion_b") scale 3/4}
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

   scale 10
}
