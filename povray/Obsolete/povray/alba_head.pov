
#include "colors.inc"
#include "textures.inc"
//#include "mechtextures.inc"  // Selecting colors


global_settings
{
  assumed_gamma 1.0
}

union {
    difference {
        union{
            sphere {0,.75}
            sphere {<0,1,0>,.75}
            cone {<0,0,0>,.75,<0,1,0>,.75}
            sphere {<0,.25,2>,1}
            sphere {<0,1.25,2>,1}
            cone {<0,.25,2>,1,<0,1.25,2>,1}
            cone {<0,0,0>,.75,<0,.25,2>,1}
            cone {<0,1,0>,.75,<0,1.25,2>,1}
        }
    box {<1,1,-5>,<-1,.5,1.5>}
    }
    //Cockpit
    merge {
        box {<-.6,1,0>,<.6,.5,1.5>}
        cylinder {<0,.5,0>,<0,1,0>,.6}
        pigment {color rgbf <0,1,0,0>}
    }
    //Sensors
    union {
        sphere {<0,.875,2>,.5 scale <.75,1,1> translate x*-1}
        sphere {<0,.875,2>,.5 scale <.75,1,1> translate x*1}
        box {<-1,.875,1.9>,<-1.3,3.5,2.1>}
        box {<1,.875,1.9>,<1.3,3.5,2.1>}
        texture {pigment {colour <1,1,0>}}
        }
    cylinder {<0,-1.5,1.75>,<0,0,1.75>,.65 texture {pigment {colour <1,1,0>}}}
texture {pigment {colour <1,0,0>}}
}
// perspective (default) camera
camera {
  location  <0.0, 5.0, -10.0>
  look_at   <0.0, 0.0,  0.0>
  right     x*image_width/image_height
}

// general light definition
light_source {
  <10, 10, 10>      // position of the light source
  color rgb 1.0     // color of the light
}


// general light definition
light_source {
  <-20, 20, 20>      // position of the light source
  color rgb .5     // color of the light
}
