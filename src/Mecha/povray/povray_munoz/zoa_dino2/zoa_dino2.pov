#include "colors.inc"
//#include "GearHead.inc"
#include "GearHead_nice_render.inc"


// Persistence of Vision Ray Tracer Scene Description File
// File: Dino.pov
// Vers: 3
// Desc: A wood T-Rex to use with homid.inc
// Date: 26/8/97
// Auth: Francisco Muñoz
// Dino.pov version: Alpha 0.7
// Copyright: This is my work if u plagiate it, my curse will fall upon u
// (c) 26/8/1997

#version 3

#debug "This file needs homid.inc, jungle.inc and mano.inc \n"

#declare Turbo = 0
    // Turbo =0 No turbo, Turbo = 1 Flat Colors, Turbo =2 Dinos only, Turbo =3 Background
#switch (Turbo)
    #case (Turbo=0) #debug "/n Final Render!! -> Time to go for pizza./n" #break
    #case (Turbo=1) #debug "/n No textures -> Cartoon colors /n" #break
    #case (Turbo=2) #debug "/n Mamma Dino & babies /n" #break
    #case (Turbo=3) #debug "/n The Jungle in the PoV-Raisic Park /n" #break
//    #else #error "\n If you RayTrace, don't drink \n"
#end

#include "colors.inc"
//#include "textures.inc"

// And somewhere below homid.inc & mano.inc"


#declare MainTexture = MTX
#declare TexWood=MTX
#declare TexJoint=HTX
#declare Texture1=texture {TexJoint}
#declare Texture2=texture {TexWood}
#declare Texture3=texture {TexJoint}

#declare altura = 10;



// ----------------------------------------


     #declare girXjaw=-25
     #declare girYtail=5
     #declare girYhead=0
     #declare girXtail=5
     #declare girXhead=95
     #declare girXtorso=-85
     #declare girXmusloI=60
     #declare girXmusloD=60
     #declare girXpantorrI=-120
     #declare girXpantorrD=-120
     #declare girXantebrazoD=125
     #declare girXantebrazoI=125
     #declare girZantebrazoD=210
     #declare girZantebrazoI=-210
     #declare girXbrazoD=-65
     #declare girXbrazoI=-60

// ----------------------------------------


#declare altorso=2
#declare anchtorso=.5
#declare altvientre=1
#declare anchvientre=2.5 //false but needed to locate the legs
#declare longmusloI=1.5
#declare anchmusloI=1
#declare longmusloD=1.5
#declare anchmusloD=1
#declare longpantorrD=2
#declare longpantorrI=2
#declare altfootL=1
#declare altfootR=1
#declare anchfootL=1
#declare anchfootR=1
#declare longbrazos=1.5
#declare flatfootR=yes
#declare flatfootL=yes


#declare incmano=yes
#declare longhand=.75
#declare girTh=20
#declare girFA=40
#declare girFB=35
#declare girFC=45
#declare Numberf=3
#declare nailclass=3


// ----------------------------------------
#ifndef (postailsection) #declare postailsection=<0,0,0> #end

#declare tailsection =object{ sphere {<0,0,0>,.25
           texture{TexJoint}}}

#declare vientre = union {
#declare Count=0
  #while (Count < 6)
    #object {tailsection
           translate postailsection
            texture{TexJoint}
           }
    #declare Count=Count+1
    #declare postailsection = postailsection +vrotate (y*.5,<girXtail*Count+90,girYtail*Count,0>)
  #end
#declare Count=0
  #while (Count < 6)
    #object {tailsection
           translate postailsection
            texture{TexJoint}
           }
    #declare Count=Count+1
    #declare postailsection =
       postailsection +vrotate (y*.5,<girXtail*6-girXtail*Count+90,girYtail*(6+Count),0>)
  #end
cone {<0,0,0>,1,<0,-1.5,0>,.5 texture{TexWood}}

}

#declare jaw=intersection {
           sphere {<0,0,0>,.5 scale <1,1,2> }
           box {<1,-.2,1>,<-1,-4,-1>}
           texture{TexWood}
}
#declare head=union{
 sphere {<0,0,0>,.25 texture{TexJoint}}
 sphere {<0,.5,0>,.25 texture{TexJoint}}
 cylinder {<0,0,0>,<0,1.25,0>,.1}
 sphere {<0,1.25,0>,.5 scale <1,1,1> texture{TexWood}}
 torus {.1,.05 rotate x*90 translate <.25,1.75,-1.2> texture{TexWood}}
 torus {.1,.05 rotate x*90 translate <-.25,1.75,-1.2> texture{TexWood}}
 sphere {<.35,1.8,-.5>,.15 texture{TexJoint}}
 sphere {<-.35,1.8,-.5>,.15 texture{TexJoint}}
 difference {
           sphere {<0,1.5,0>,.5 scale <1,1,2> translate <0,0,-.5>}
           box {<-.8,1.15,2>,<2,0,-2>}
           texture{TexWood}}
 object {jaw translate <0,0,-.5>
        rotate <girXjaw,0,0>
        translate <0,1.5,0>
        }
}

#declare torso=union {
sphere {<0,0,0>,.25 }
sphere {<0,.5,0>,.25}
sphere {<0,1,0>,.25}
sphere {<0,1.5,0>,.25}
sphere {<0,2,0>,.25}
cylinder {<0,0,0>,<0,2,0>,.1}
cylinder {<0,.25,-.5>,<0,1.5,-.25>,.25 texture{TexWood}}
texture{TexJoint}
}

#declare musloD=union {
sphere {<0,0,0>,.5 texture{TexJoint}}
cone { <0,-.25,0>,.4,<0,-1.5,0>,.2 texture{TexWood}}
}
#declare musloI=object {musloD scale <-1,1,1>}

#declare pantorrD=union {
sphere {<0,0,0>,.22 texture{TexJoint}}
cone { <0,-.20,0>,.2,<0,-2,0>,.15 texture{TexWood}}
}
#declare pantorrI=object {pantorrD scale <-1,1,1>}

#declare footR=union {
sphere {<0,0,0>,.16 texture{TexJoint}}
cone { <0,-.2,0>,.2,<0,-.75,-.75>,.15 texture{TexWood}}
sphere {<0,-.75,-.67>,.14 texture{TexJoint}}
cylinder { <0,-.75,-.75>,<0,-1,-.75>,.3 texture{TexWood}}
    difference {
        union{
            cone {<0,0,-.1>,.15,<0,0,-.6>,0 texture{TexJoint} scale <1,1.75,1> translate <0,-1,-.75>}
            cone {<0,0,-.1>,.15,<0,0,-.6>,0 texture{TexJoint} scale <1,1.5,1> rotate y*35 translate <0,-1,-.75>}
            cone {<0,0,-.1>,.15,<0,0,-.6>,0 texture{TexJoint} scale <1,1.5,1> rotate y*-35 translate <0,-1,-.75>}
            }
        plane {y,-1 texture{TexJoint} }
    }
}

#declare footL=object {footR scale <-1,1,1>}


// ----------------------------------------
//      The POV-Dino!!!

#include "homid.inc"

object
{
	homid
	translate <vdot (z,-postobilloI),min (vdot (y,-postobilloD)+1,vdot (y,-postobilloI)+1),vdot (z,-postobilloI)>
	scale 10
	scale Scale_LDraw
	rotate y * 135
	rotate y * clock * 360
}


// ----------------------------------------


