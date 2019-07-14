#include "GearHead.inc"
#version 3

#include "colors.inc"
#include "textures.inc"

#declare GreenTexture = CTX;
#declare GrayTexture = Plain_DarkGray;
#declare LGrayTexture = Plain_Gray;
#declare RedTexture = MTX;
#declare YellowTexture = HTX;

#declare TurretBotDef = union {
   prism {
      linear_spline
      linear_sweep
      0, 2,
      8,
      <0.5, 0.6>, <0.75, 0.375>, <0.75, -0.375>, <0.5, -0.6>, <-0.5, -0.9>, <-1, 0>, <-0.5, 0.9>, <0.5, 0.6>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         RedTexture
      }
   }
   
   prism {
      linear_spline
      linear_sweep
      -0.25, 0,
      8,
      <0.5, 0.6>, <0.75, 0.375>, <0.75, -0.375>, <0.5, -0.6>, <-0.5, -0.9>, <-1, 0>, <-0.5, 0.9>, <0.5, 0.6>
      scale <1.1, 1, 1.1>
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         YellowTexture
      }
   }
   
   cylinder {
      <0.5, 1.25, 0>, <1, 1.25, 0>, 0.1
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         GrayTexture
      }
   }
   
   box {
      <0.76, 1.5, -0.1>, <0.5, 1.9, 0.1>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         GreenTexture
      }
   }
   
   cylinder {
      <0.5, 2.35, 0>, <1, 2.5, 0>, 0.1
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         GrayTexture
      }
   }
   
   cylinder {
      <0, 2, 0>, <0, 2.5, 0>, 0.6
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         RedTexture
      }
   }
   
   cylinder {
      <0, 2, 0>, <0, 2.2, 0>, 0.65
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         YellowTexture
      }
   }
   
   cylinder {
      <0.75, -0.2, 0.2>, <0.75, -0.2, -0.2>, 0.3
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         GrayTexture
      }
   }
   
   sphere {
      <0, 0, 0>, 0.6
      scale <1, 0.5, 1>
      rotate <0, 0, 0>
      translate y*2.5
      
      texture {
         RedTexture
      }
   }
   
   union {
      sphere {
         <0.75, 1, 0.25>, 0.1
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      sphere {
         <0.75, 1, -0.25>, 0.1
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      sphere {
         <0.75, 1.5, 0.25>, 0.1
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      sphere {
         <0.75, 1.5, -0.25>, 0.1
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      sphere {
         <0.75, 0.5, 0.25>, 0.1
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      sphere {
         <0.75, 0.5, -0.25>, 0.1
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      texture {
         YellowTexture
      }
   }
   
   union {
      sphere {
         <-0.45, -0.25, 0.4>, 0.25
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      box {
         <-0.5, -0.25, -0.3>, <0.825, 0.25, 0.3>
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
         
         texture {
            YellowTexture
         }
      }
      
      sphere {
         <-0.45, -0.25, -0.4>, 0.25
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      sphere {
         <0.25, -0.25, 0>, 0.25
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      texture {
         GrayTexture
      }
   }
}

//*****************************************************************

object
{
	TurretBotDef
	rotate y * 225
	rotate y * clock * 360
	scale 16
}
