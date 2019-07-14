#include "GearHead.inc"
#version 3

#include "colors.inc"
#include "textures.inc"

#declare GreenTexture = CTX;
#declare GrayTexture = Plain_DarkGray;
#declare LGrayTexture = Plain_Gray;
#declare RedTexture = MTX;
#declare YellowTexture = HTX;

#declare CogDef = difference {
   cylinder {
      <0, 0, 0.1>, <0, 0, 0>, 0.15
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
   }
   
   cylinder {
      <0, 0, 0.1>, <0, 0, 0>, 0.1
      scale 1
      rotate <0, 0, 0>
      translate z*0.01
   }
   
   texture {
      YellowTexture
   }
}

#declare TrackDef = prism {
   quadratic_spline
   linear_sweep
   0, 0.3,
   10,
   <-0.151907, 0.17183>, <0.344536, 0.354167>, <0.622729, 0.280327>, <0.534675, -0.244698>, <0.396581, -0.496095>, <-0.122611, -0.515948>, <-0.58072, -0.51282>, <-0.778102, -0.332906>, <-0.678588, -0.0987737>, <0.344536, 0.354167>
   
   texture {
      GrayTexture
   }
   scale 1
   rotate x*(-90)
   translate <0, 0, 0>
}

//*****************************************************************
#declare CraftBotDef = union {
   box {
      <-0.6, -0.25, -0.6>, <0.6, 1.25, 0.6>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         RedTexture
      }
      matrix < 1, 0.25, 0,
               0, 1, 0,
               0, 0, 1,
               0, 0, 0 >
   }
   
   sphere {
      //*PMName Shoulder
      <0, 1.1, 0>, 0.5
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         RedTexture
      }
   }
   
   box {
      <0, 0.05, -0.4>, <0.62, 0.25, 0.4>
      scale 1
      rotate <0, 0, 0>
      translate y*0.5
      
      texture {
         GreenTexture
      }
   }
   
   box {
      <0, -0.05, -0.5>, <0.61, 0.35, 0.5>
      scale 1
      rotate <0, 0, 0>
      translate y*0.5
      
      texture {
         YellowTexture
      }
   }
   
   union {
      box {
         <-0.1, 0, -0.1>, <0.1, 0.75, 0.1>
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
         
         texture {
            RedTexture
         }
      }
      
      sphere {
         <0, 0.75, 0>, 0.15
         scale 1
         rotate <0, 0, 0>
         translate <0, 0, 0>
         
         texture {
            YellowTexture
         }
      }
      
      union {
         sphere {
            <0, 0.75, 0>, 0.15
            scale 1
            rotate <0, 0, 0>
            translate <0, 0, 0>
            
            texture {
               YellowTexture
            }
         }
         
         box {
            <-0.1, 0, -0.1>, <0.1, 0.75, 0.1>
            scale 1
            rotate <0, 0, 0>
            translate <0, 0, 0>
            
            texture {
               RedTexture
            }
         }
         
         cone {
            <0, 0.3, 0>, 0.1,
            <0, 0.1, 0>, 0.2
            scale 1
            rotate <0, 0, 0>
            translate y*0.75
            
            texture {
               YellowTexture
            }
         }
         rotate z*(-30)
         translate y*0.75
      }
      rotate z*(-30)
      translate y*1.4
   }
   
   box {
      <-0.4, 0.35, -0.9>, <0.5, 0.4, 0.9>
      rotate z*20
      scale 1
      translate <0, 0, 0>
      
      texture {
         YellowTexture
      }
   }
   
   box {
      <-0.61, -0.3, 0.45>, <0.61, 0.5, 0.5>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         YellowTexture
      }
      matrix < 1, 0.25, 0,
               0, 1, 0,
               0, 0, 1,
               0, 0, 0 >
   }
   
   box {
      <-0.61, -0.3, -0.45>, <0.61, 0.5, -0.5>
      scale 1
      rotate <0, 0, 0>
      translate <0, 0, 0>
      
      texture {
         YellowTexture
      }
      matrix < 1, 0.25, 0,
               0, 1, 0,
               0, 0, 1,
               0, 0, 0 >
   }
   
   object {
      //*PMName Track R
      TrackDef
      scale 1
      rotate <0, 0, 0>
      translate z*0.9
   }
   
   object {
      //*PMName Track L
      TrackDef
      scale 1
      rotate <0, 0, 0>
      translate z*(-0.6)
   }
   
   union {
      object {
         CogDef
         scale 1
         rotate <0, 0, 0>
         translate <0.4272, 0.15262, 0>
      }
      
      object {
         CogDef
         scale 1
         rotate <0, 0, 0>
         translate <-0.53946, -0.28, 0>
      }
      
      object {
         CogDef
         scale 1
         rotate <0, 0, 0>
         translate <0.24723, -0.28, 0>
      }
      translate z*0.9
   }
   
   union {
      object {
         CogDef
         scale 1
         rotate <0, 0, 0>
         translate <0.4272, 0.15262, 0>
      }
      
      object {
         CogDef
         scale 1
         rotate <0, 0, 0>
         translate <-0.53946, -0.28, 0>
      }
      
      object {
         CogDef
         scale 1
         rotate <0, 0, 0>
         translate <0.24723, -0.28, 0>
      }
      translate z*0.9
      scale <1, 1, -1>
   }   
   translate y*.5
}

//*****************************************************************

object
{
	CraftBotDef
	rotate y * 225
	rotate y * clock * 360
	scale 16
}
