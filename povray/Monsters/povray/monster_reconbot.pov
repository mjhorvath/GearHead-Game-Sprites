#include "GearHead.inc"
#version 3

#include "colors.inc"
#include "textures.inc"

#declare GreenTexture = CTX;
#declare GrayTexture = Plain_DarkGray;
#declare LGrayTexture = Plain_Gray;
#declare RedTexture = MTX;
#declare YellowTexture = HTX;

//*****************************************************************
#declare ReconBotDef = union {
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
      translate <0.65, 1.3, -0.2>
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
      translate <0.65, 1.3, 0.2>
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
      translate <0.65, 1.1, 0>
   }
   
   torus {
      //*PMName Ring
      0.5, 0.1
      scale 1
      rotate x*90
      translate <0, 1, -0.25>
      
      texture {
         YellowTexture
      }
   }
   
   union {
      //*PMName WingFrame
      
      box {
         //*PMName wings
         <-0.5, -0.05, -1>, <0.3, 0.05, 1>
         scale 1
      }
      
      cylinder {
         <-0.5, 0.05, 0.6>, <-0.5, -0.05, 0.6>, 0.4
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      cylinder {
         <-0.5, 0.05, -0.6>, <-0.5, -0.05, -0.6>, 0.4
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      translate <-0.5, 1, 0>
      rotate z*(-30)
      
      texture {
         RedTexture
      }
   }
   
   superellipsoid {
      //*PMName Body
      <0.75, 0.75>
      scale 0.5
      rotate <0, 0, 0>
      translate <0.1, 1, 0>
      
      texture {
         RedTexture
      }
   }
   
   union {
      //*PMName WingDetail
      
      box {
         //*PMName wings
         <-0.4, -0.051, -0.9>, <0.2, 0.051, 0.9>
         scale 1
      }
      
      cylinder {
         <-0.5, 0.051, 0.6>, <-0.5, -0.051, 0.6>, 0.3
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      
      cylinder {
         <-0.5, 0.051, -0.6>, <-0.5, -0.051, -0.6>, 0.3
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
      }
      translate <-0.5, 1, 0>
      rotate z*(-30)
      
      texture {
         YellowTexture
      }
   }
   
   sphere {
      //*PMName Jet
      <0, 0, 0.6>, 0.2
      scale <1, 0.5, 1>
      rotate z*(-30)
      translate <-0.35, 1.35, 0>
      
      texture {
         GrayTexture
      }
   }
   
   cylinder {
      //*PMName TailFrame
      <-0.5, 1.4, 0.05>, <-0.5, 1.4, -0.05>, 0.5
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         RedTexture
      }
   }
   
   cylinder {
      //*PMName TailDetail
      <-0.5, 1.4, 0.051>, <-0.5, 1.4, -0.051>, 0.45
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         YellowTexture
      }
   }
   
   sphere {
      //*PMName Jet
      <0, 0, -0.6>, 0.2
      scale <1, 0.5, 1>
      rotate z*(-30)
      translate <-0.35, 1.35, 0>
      
      texture {
         GrayTexture
      }
   }
}

//*****************************************************************

object
{
	ReconBotDef
	rotate y * 225
	rotate y * clock * 360
	scale 16
}
