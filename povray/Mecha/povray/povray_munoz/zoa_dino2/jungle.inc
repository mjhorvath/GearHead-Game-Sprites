// Persistence of Vision Ray Tracer Scene Description File
// File: jungle.inc
// Vers: 3
// Desc: Basic Scene Example
// Date: 26/8/97
// Auth: Francisco Muñoz
// jungle.inc version: Alpha 0.3
// Copyright: This is my work if u plagiate it, my curse will fall upon u
// (c) 26/8/1997- 15/11/1997
//

#version 3

 #declare R1 = seed(0)   // Staight from the example
 #declare R2 = seed(12345)
 #declare R3 = seed(4352)
 #declare R4 = seed(2356)

// ----------------------------------------
#declare NormalLeaf = normal {
        gradient x
        slope_map{
            [0.0 <0,1>]
            [0.3 <1,0>]
            [0.3 <1,-1>]
            [0.49 <0,.5>]
            [0.5 <1,-.5>]
            [0.51 <0,1>]
            [0.7 <1,0>]
            [0.7 <1,-1>]
            [1.0 <0,0>]
            }
         scale <2,1,1>
         translate x*-1
         }


#declare PalmLeaf1 =
    union {
        smooth_triangle {<0,0,0>,<0,-1,0>,
            <1,2.5,-3.5>,<1,0,.25>,
            <0,2,-3>,<0,-.5,-1.5>}
        smooth_triangle {<0,0,0>,<0,-1,0>,
            <0,2,-3>,<0,-.5,-1.5>
            <-1,2.5,-3.5>,<-1,0,.25>}
        smooth_triangle {<0,2,-3>,<0,-.5,-1.5>,
            <-1,2.5,-3.5>,<-1,0,.25>,
            <0,1,-6>,<0,-1,-1>}
        smooth_triangle {<0,2,-3>,<0,-.5,-1.5>,
            <1,2.5,-3.5>,<1,0,.25>,
            <0,1,-6>,<0,-1,-1>}
}


#declare PalmLeaf2 = union {
    difference {
        torus {2,.05 rotate x*90}
        plane {y,0}
        plane {y,0 rotate z*-45}
    }
    cylinder {<2,0,0>,<2,-.5,0>,.05}
    #declare Count=1
    #while (Count < 21)
        union {
            smooth_triangle {
                <2,0,0>,<-.2,0,1>,
                <2.2,.1,-1>,<0,1,0>,
                <2.2,-.1,-1>,<0,-1,0>}
            smooth_triangle {
                <2.2,.1,-1>,<0,1,0>,
                <2.2,-.1,-1>,<0,-1,0>,
                <1.9,0,-2>,<-.5,0,-1>}
            smooth_triangle {
                <2,0,0>,<-.2,0,-1>,
                <2.2,.1,1>,<0,1,0>,
                <2.2,-.1,1>,<0,-1,0>}
            smooth_triangle {
                <2.2,.1,1>,<0,1,0>,
                <2.2,-.1,1>,<0,-1,0>,
                <1.9,0,2>,<-.5,0,1>}
            #if (Count<11)
                scale <1,Count*.05+.5,Count*.07+.3>
            #else
                scale <1,1-(Count-10)*.05,1-(Count-10)*.09>
            #end
            rotate z*6.8*Count
        }
    #declare Count=Count+1
    #end
    union{
            smooth_triangle {
                <2,0,0>,<-.2,0,1>,
                <2.2,.1,-1>,<0,1,0>,
                <2.2,-.1,-1>,<0,-1,0>}
            smooth_triangle {
                <2.2,.1,-1>,<0,1,0>,
                <2.2,-.1,-1>,<0,-1,0>,
                <1.9,0,-2>,<-.5,0,-1>}
    scale <1,.5,.2>
    translate x*-2      // Misterious movements of leaves ;-)
    rotate x*90
    translate x*2
    rotate z*135}

translate <-2.05,.5,0>
}


#declare PalmBase1 = union {
  union {
    triangle {
    <0,-.2,.0>,
    <.2,2,-.35>,
    <-.2,2,-.35>
    }
    triangle {
    <0,1.35,-.75>,
    <.2,2,-.35>,
    <-.2,2,-.35>
    }
    translate <0,0,-.25>
  }
  union {
    triangle {
    <0,-.2,-.0>,
    <.15,1.75,-.30>,
    <-.15,1.75,-.30>
    }
    triangle {
    <0,1.25,-.6>,
    <.15,1.75,-.30>,
    <-.15,1.75,-.30>
    }
    rotate <0,20,5>
    translate <0,0,-.25>
  }
  union {
    triangle {
    <0,-.2,-.0>,
    <.15,1.75,-.30>,
    <-.15,1.75,-.30>
    }
    triangle {
    <0,1.5,-.6>,
    <.15,1.75,-.30>,
    <-.15,1.75,-.30>
    }
    rotate <0,-20,-5>
    translate <0,0,-.25>
  }
}





// ----------------------------------------


#declare Jungle= union{


 #declare Count=0
 #while (Count < 50)

union {                          // Palm tree
 cylinder {<0,0,0>,<0,15,0>,.25
    texture {
        pigment {
            #if (Turbo!=1)
            gradient y
            pigment_map {
                [0.0 color rgb <.2,.2,.0>]
                [0.05 color rgb <.75,.75,.5>]
                [0.1 color rgb <.5,.5,.3>]
                [0.3 color rgb <.75,.75,.5>]
                [0.6 color rgb <.75,.75,.5>]
                [0.9 color rgb <.5,.5,.3>]
                [0.9 color rgb <.75,.75,.5>]
                [1 color rgb <.2,.2,.0>]
            }
            turbulence .2
            #else
            color rgb <.75,.75,.5>
            #end
        }
    }
 }
 #declare ColorLeaf = pigment {rgb <rand(R1)*.5,rand(R2)*.5+.5,rand(R3)*.75>}
 #declare PalmLeaf =
    #if (rand(R4)<.8) object {PalmLeaf1}
    #else object {PalmLeaf2}
    #end
 #declare Count2=0
 #while (Count2 < 8)
 object {
     object {
        PalmLeaf
        texture {
            pigment { ColorLeaf }
            normal { NormalLeaf }
        }
    }
 scale .9+(rand(R1))*.2 rotate <(rand(R1)*10)-5,45*Count2,(rand(R2)*10)-5> translate y*14.5
 }
 #declare Count2=Count2+1
 #end
 scale .75+(rand(R1))*.5
 translate <-40+(rand(R1)*80),0,5+(rand(R2)*80)>
}                                // End of Palm tree
 #declare Count=Count+1
 #end

 #declare Count=0
 #while (Count < 30)
union{                          // a kind of  .. ¿bush?
 #declare ColorLeaf = pigment {rgb <rand(R1)*.5,rand(R2)*.5+.5,rand(R3)*.75>} #declare Count2=0
 #declare PalmLeaf =
    #if (rand(R4)<.8) object {PalmLeaf1}
    #else object {PalmLeaf2}
    #end
 #while (Count2 < 4)
 object {
     object {
        PalmLeaf
        texture {
            pigment { ColorLeaf }
            normal { NormalLeaf }
        }
    }
 scale .9+(rand(R1))*.2 rotate <(rand(R1)*10)-5,90*Count2,(rand(R2)*10)-5> translate 0
 }
 #declare Count2=Count2+1
 #end
 #declare Count2=0
 #while (Count2 < 4)
 object {
     object {
        PalmLeaf
        texture {
            pigment { ColorLeaf }
            normal { NormalLeaf }
        }
    }
scale .9+(rand(R1))*.2 scale <1,2,.75> rotate <(rand(R1)*10)-5,45+(90*Count2),(rand(R2)*10)-5> translate 0
 }
 #declare Count2=Count2+1
 #end
 scale .75+(rand(R1))*.5
 translate <-40+(rand(R1)*80),0,5+(rand(R2)*80)>
}                                           // End of ... bush?

 #declare Count=Count+1
 #end

}

#declare HLeaf = union {
    object {PalmLeaf2}
    cylinder {<0,0,0>,<0,-1,0>,.05}
    cone {<0,-.99,0>,.05,<-.75,-1,0>,0}
    translate <-.05,1,0>
    pigment {rgb <.35,.25,.35>}
}

#declare Helecho = union {
    object {HLeaf rotate <0,0,0> }
    object {HLeaf rotate <0,72,0> }
    object {HLeaf rotate <0,144,0> }
    object {HLeaf rotate <0,-72,0>}
    object {HLeaf rotate <0,-144,0> }
    cone {<0,-.1,0>,.07,<-.2,.75,0>,.0
        pigment {rgb <.35,.25,.35>}}
    }

#object {Helecho rotate y*20 translate <-8,0,6>}
#object {Helecho translate <3.5,0,10>}


// ----------------------------------------

#declare mount=height_field
{
  gif
  "image1.gif"
  texture {
  #if (Turbo!=1)
  pigment {
   gradient <0,1,0>
    color_map {
      [0.0  color Green]
      [0.5  color rgb <.65,.65,.20>]
      [0.8  color Gray50]
      [0.98  color White]
    }
  }
  #else pigment {Gray50}
  #end
  }
  scale <100,50,100>
}


#declare  Sign = union {
 union{
    box {<0,0,0>,<4,3,.5>
/*
        pigment {
            #if (Turbo!=1)
            image_map {
                gif "povraysic.gif"
                }
            scale <4,3,1>
            #else
            color Gray50
            #end
        }
        finish {ambient .4}
*/
    }
    sphere {<2,2.75,-.05>,.1 texture {Silver_Texture}}
    sphere {<2,0.25,-.05>,.1 texture {Silver_Texture}}
    scale .9
    translate <-2,7,-.6>
    rotate <0,15,0>
  }
union {                          // Palm tree
 cylinder {<0,0,0>,<0,15,0>,.25
    texture {
        pigment {
            #if (Turbo!=1)
            gradient y
            pigment_map {
                [0.0 color rgb <.2,.2,.0>]
                [0.05 color rgb <.75,.75,.5>]
                [0.1 color rgb <.5,.5,.3>]
                [0.3 color rgb <.75,.75,.5>]
                [0.6 color rgb <.75,.75,.5>]
                [0.9 color rgb <.5,.5,.3>]
                [0.9 color rgb <.75,.75,.5>]
                [1 color rgb <.2,.2,.0>]
            }
            turbulence .2
            #else
            color rgb <.75,.75,.5>
            #end
        }
    }
 }
 #declare ColorLeaf = pigment {rgb <rand(R1)*.5,rand(R2)*.5+.5,rand(R3)*.75>}
 #declare Count2=0
 #while (Count2 < 8)
 object {
     object {
        PalmLeaf1
        texture {
            pigment { ColorLeaf }
            normal { NormalLeaf }
        }
    }
 scale .9+(rand(R1))*.2 rotate <(rand(R1)*10)-5,45*Count2,(rand(R2)*10)-5> translate y*14.5
 }
 #declare Count2=Count2+1
 #end
 object {PalmBase1
    rotate y*45
    pigment {ColorLeaf}}
 scale <1,.8,1>
}                                // End of Palm tree
}


// ----------------------------------------

#if (Turbo!=1)
fog {                       //Fog
    distance 150
    colour rgbf<0.8, 0.8, 0.8, 1.0>
    fog_type 2
    fog_offset 5
    fog_alt 1
  }
fog {
    distance 150
    colour rgbf<0.8, 0.8, 0.9, 1.0>
    fog_type 2
    fog_offset 2
    fog_alt 1
  }
#end

plane {y,0                      // Floor
#if (Turbo!=1)
    texture {
        pigment{ crackle color_map {
            [ 0 rgb <0,0,0>]
            [ .4 rgb <.3,.2,.1>]
            [ 1 rgb <.9,.7,.5>]
            } }
        normal {bumps .5} scale .5
    }
    texture {
        pigment {
            bozo
            pigment_map {
                [0 rgb <.2,1,0>]
                [.75 rgbf <.2,1,0,1>]
                [1 Clear]
            }
        }
    }
#else
    texture {pigment {rgb <.2,1,0>}}
#end
}


sky_sphere {            //Sky
    pigment {
        #if (Turbo!=1)
        gradient y
        color_map {
            [0.0 color rgb <.6,.55,.5>]
            [0.2 color rgb <.4,.42,.62>]
            [1.0 color rgb <.3,.3,.45>]
        }
        #else
        Blue
        #end
    }
}


plane {y,10                             // 1st cloud plane
    inverse
    no_shadow
    texture{T_Cloud3 scale 30
        finish{ambient .8 diffuse .6}}
    scale 50
    rotate x*2
    translate y*500
}

#if (Turbo=!1)
plane {y,0                           // 2nd cloud plane
    inverse
    texture{T_Cloud3 scale 30
        finish{ambient .2 diffuse .6}}
    scale 50
    rotate x*2
    translate x*.2
    translate y*490
    }
#end

object {mount translate <-10,-.1,100>}
object {mount rotate <0,40,0> translate <-150,-.1,100>}
object {Sign translate <6,0,0>}
object {Jungle}
