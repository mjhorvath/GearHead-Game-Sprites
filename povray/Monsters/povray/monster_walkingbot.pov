#include "GearHead.inc"
#version 3

#include "colors.inc"
#include "textures.inc"

#declare GreenTexture = CTX;
#declare GrayTexture = Plain_DarkGray;
#declare LGrayTexture = Plain_Gray;
#declare RedTexture = MTX;
#declare YellowTexture = HTX;

#declare LegDef = union {
   cylinder {
      <0, 0.25, 0.71>, <0, 0.25, 0.5>, 0.25
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         YellowTexture
      }
   }
   
   box {
      <-0.1, -0.25, 0.5>, <0.1, 0.25, 0.7>
      scale 1
      rotate z*20.8
      translate <0.0583333, 0.0333333, 0>
      
      texture {
         YellowTexture
      }
   }
   
   box {
      <-0.1, -0.25, 0.5>, <0.1, 0.25, 0.7>
      
      texture {
         YellowTexture
      }
      scale 1
      rotate z*(-20)
      translate <0.0541667, -0.225, 0>
   }
   
   cylinder {
      <0, 0.25, 0.71>, <0, 0.25, 0.5>, 0.15
      scale 1
      rotate <0, 0, 0>
      translate <0.125, -0.354167, 0>
      
      texture {
         YellowTexture
      }
   }
   
   box {
      <-0.15, -0.5, 0.45>, <0.35, -0.35, 0.75>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         RedTexture
      }
   }
}

//*****************************************************************
#declare WalkingBotDef = union {
   union {
      //*PMName Eye
      
      cylinder {
         <-0.5, 0, 0>, <0, 0, 0>, 0.15
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
         
         texture {
            GrayTexture
         }
      }
      
      sphere {
         //*PMName Eye
         <0, 0, 0>, 0.1
         scale <0.5, 1, 1>
         rotate <0, 0, 0>
         translate <0, 0, 0>
         
         texture {
            GreenTexture
         }
      }
      translate <0.5, 1.3, 0.25>
   }
   
   union {
      //*PMName Eye
      
      cylinder {
         <-0.5, 0, 0>, <0, 0, 0>, 0.1
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
         
         texture {
            GrayTexture
         }
      }
      
      sphere {
         //*PMName Eye
         <0, 0, 0>, 0.07
         scale <0.5, 1, 1>
         rotate <0, 0, 0>
         translate <0, 0, 0>
         
         texture {
            GreenTexture
         }
      }
      translate <0.4, 1.5, 0>
   }
   
   object {
      //*PMName Leg
      LegDef
      scale 1
      rotate <0, 0, 0>
      translate z*(-1.2)
   }
   
   object {
      //*PMName Leg
      LegDef
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   cylinder {
      //*PMName Axis
      <0, 0.25, -0.75>, <0, 0.25, 0.75>, 0.1
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         GrayTexture
      }
   }
   
   sphere {
      //*PMName Head
      <0,1.1, 0>, 0.5
      texture {
         RedTexture
      }
   }
   
   cylinder {
      //*PMName Body
      <0, 1, 0>, <0, 0, 0>, 0.5
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         RedTexture
      }
   }
   
   box {
      //*PMName BodyStuff
      <0, 0.1, 0.35>, <-0.55, .8, -0.35>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
    
      texture {
         LGrayTexture
      }
   }
      
   torus {
      //*PMName NeckRing
      0.5, 0.1
      scale 1
      rotate <0, 0, 0>
      translate y*1
      
      texture {
         YellowTexture
      }
   }
}


//*****************************************************************

object
{
	WalkingBotDef
	rotate y * 225
	rotate y * clock * 360
	scale 16
}
