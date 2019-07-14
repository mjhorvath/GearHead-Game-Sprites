
// ----------------- Pieces -----------------------

#declare head=union {  // *****HEAD*****
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
        sphere {<0,.875,2>,.65 scale <1,1,1> translate x*-1}
        sphere {<0,.875,2>,.65 scale <1,1,1> translate x*1}
        box {<-1,.875,1.75>,<-2,6,2.25>}
        box {<1,.875,1.75>,<2,6,2.25>}
        texture {SecundaryTexture}
        }

    cylinder {<0,-1.5,1.75>,<0,0,1.75>,.65 texture {SecundaryTexture}}
   texture {MainTexture}
    translate <0,1,-1.75>
    scale .8 //Small head
    scale .85
}

#declare forearmL= union {
    sphere {0,.5 texture {Barrel_Texture2}}
    cylinder {<0,0,0>,<0,-1.5,0>,.4 texture {Barrel_Texture2}}
    superellipsoid {<.5,.5> scale <.75,1.9,.75> translate <0,-2.45,0> texture{MainTexture}}
    superellipsoid {<.5,.5> scale .5 translate <0,-5.1,0>  texture{SecundaryTexture}}
    cylinder {<0,-4,0>,<0,-5,0>,.35  texture{SecundaryTexture}}
    rotate z*180
}

#declare forearmR =object{forearmL scale <-1,1,1>}

#declare handL= difference { // there is no need for hands now
    sphere {0,1.5}
    sphere {0,2}
}
#declare handR= difference {  // there is no need for hands now
    sphere {0,1.5}
    sphere {0,2}
}

#declare torso= union {     // ****** CHEST ******
    cylinder {<0,-1.5,0>,<0,2.5,0>,1.25 scale <1,1,.8> texture{Barrel_Texture2}}
    superellipsoid {<.5,.5> scale <3.75,1.5,1.35> translate <0,3.75,0>}
    #declare Count = 0;
    #while (Count <18)
    cylinder {<0,-1.5+Count*.25,0>,<0,-1.35+Count*.25,0>,1.3 scale <1,1,.8> texture{Barrel_Texture}}
    #declare Count = Count +1 ;
    #end
    difference {
        union {
            cone {<0,1.25,0>,1.7 <0,4.75,0>,2.75 scale <1,1,.8>}
            cone {<0,4.75,0>,2.75 <0,5,0>,2 scale <1,1,.8>}
        }
        plane {z,-1.8}
        plane {z,-1.75 rotate y*180}
        sphere {0,1.9 scale <1,1,1> translate <0,.8,-1.1>}
    }
    box {<-1,2.45,1.65>,<1,6.05,2.25> texture {Barrel_Texture2}}
    superellipsoid {<.5,.5> scale <.85,1.75,.6> translate <0,4.25,2.25>}
//Autoguns mounted on torso
    cylinder {<1.5,4,-1.75>,<1.4,4,0>,.4 texture{HightlightTexture}}
    cylinder {<-1.5,4,-1.75>,<-1.4,4,0>,.4 texture{HightlightTexture}}

    cylinder {<1.5,4,-3>,<1.4,4,0>,.25 texture{Barrel_Texture2}}
    cylinder {<-1.5,4,-3>,<-1.4,4,0>,.25 texture{Barrel_Texture2}}
    cylinder {<1.5,4,-3>,<1.5,4,-2.5>,.275 texture{Barrel_Texture2}}
    cylinder {<-1.5,4,-3>,<-1.5,4,-2.5>,.275 texture{Barrel_Texture2}}
texture{MainTexture}
}

#declare belly= union {  // *********** BELLY *****
    difference {
        cylinder {<0,.5,0>,<0,-3/2,0>,2 scale <1,1,.75>}
        sphere {0,1.9 scale <1,1,1> translate <0,.8,-1.1>}
    }
    sphere {<0,0,0>,2 scale <1,.75,.75> translate <0,-1.5,0>}
    sphere {<0,0,0>,2 scale <1,.75,.75> translate <0,-1.5,0>}
    intersection {
        cylinder {<0,.5,0>,<0,-3/2,0>,1.8 scale <1,1,.75>}
        cylinder {<0,-.5,-2>,<0,-.5,2>, 1 scale <1.6,1,1>}
    }
    cone {<-2.2,-1.25,0>,.75,<-1.9,-1.25,0>,1}
    cone {<2.2,-1.25,0>,.75,<1.9,-1.25,0>,1}
}


#declare pantorrD= union {
        sphere {<0,0,0>,.5 texture {Barrel_Texture2}}
        cylinder {<0,0,0>,<0,-1,0>,.4 texture {Barrel_Texture2}}
        difference{
            cone {<0,.3,0>,.8,<0,-4.75,0>,1.25}
            sphere {<0,0,.2>,.8 scale <2,1,1>}
        }
        difference{
            sphere {<0,-4.75,0>,1.25}
            cylinder {<0,-4.75,1.5>,<0,-4.75,-1.5>,1}
            plane {z,-.25}
            plane {z,.25 inverse}
        }
    cylinder {<-.25,-4.70,0>,<-.25,-5.75,0>,.1 texture {Barrel_Texture2}}
    cylinder {<.2,-4.70,0>,<.2,-5.75,0>,.075 texture {Barrel_Texture2}}
}
#declare pantorrI= object {pantorrD}

#declare shoulderpadR = object{difference {
        union {
            superellipsoid {<1,.35> scale .9 rotate y*90 }
            sphere {<-1,0,0>, .45 texture{HightlightTexture} }
        }
        cylinder {<0,-1.1,-2>,<0,-1,2>,.75 }
    }
    texture{MainTexture}
    scale 1.5
    rotate x*180
}

#declare shoulderpadL= object {shoulderpadR rotate y*180}


#declare upperarmL = union {
    union {
    sphere {0,.5 scale <1,2.25,.8> translate <0,-1.1,-.35>}
    sphere {0,.5 scale <1,2.25,.8> translate <0,-1.1,.35>}
    sphere {<0,-2.25,0>,.5 texture{MainTexture}}
    scale 1.5}
    //RockeLauncher
    union {
    box{<.8,-.5,.5>,<1.8,-2.5,-.5> texture {MainTexture}}
    box{<.5,-.75,.25>,<1.5,-2.25,-.25> texture {MainTexture}}
    sphere {<1.3,-.75,-.5>,.2 texture{SecundaryTexture}}
    sphere {<1.3,-1.25,-.5>,.2 texture{SecundaryTexture}}
    sphere {<1.3,-1.75,-.5>,.2 texture{SecundaryTexture}}
    sphere {<1.3,-2.25,-.5>,.2 texture{SecundaryTexture}}
    translate <0,-1,0>
    }
    rotate x*180
    texture{SecundaryTexture}
}

#declare upperarmR = object {upperarmL scale <-1,1,1>}

#declare footL =  union {
    difference {
      union {
      difference {
        sphere {0,1 scale <1,2.75,1> rotate x*40 translate <0,-1.5,-1.5>}
        plane {y,-1.5}
      }
      difference {
        sphere {0,1.1 scale <1,2.75,1> rotate x*40 translate <0,-1.5,-1.5>}
        plane {y,-1.75}
        plane {y,-1.5 inverse}
        #declare Count = 0
        #while (Count <15)
        box {<-1.5,.1,.1>,<1.5,-.1,-.1> rotate x*45 translate <0,-1.75,.5-Count*.25>}
        #declare Count = Count +1
        #end
     } }
        sphere {<0,-1.75,-1.75>,.5 texture{Barrel_Texture2}}
        texture{Barrel_Texture2}
    }

    difference {
       union  {
       difference {
        sphere {0,1 scale <.75,2,.65> rotate x*-25 translate <0,-1.25,.85>}
        plane {y,-1.5}
      }
      difference {
        sphere {0,1.1 scale <.75,2,.65> rotate x*-25 translate <0,-1.25,.85>}
        plane {y,-1.75}
        plane {y,-1.5 inverse}
        #declare Count = 0
        #while (Count <10)
        box {<-2.5,.1,.1>,<2.5,-.1,-.1> rotate x*45 translate <0,-1.75,-.5+Count*.25>}
        #declare Count = Count +1
        #end
      }}
      sphere {<0,-1.75,1>,.35 texture{Barrel_Texture2}}
    texture{Barrel_Texture2}
    }
    #if (Rockets=1)
    object {Fire scale <.6,.8,.6> translate <0,-2.6,1>}
    object {Fire scale <.75,1,.75> translate <0,-2.7,-1.75>}
    #end
}

#declare footR= object {footL}

#declare musloI= union {
    sphere {<0,0,0>,.85 scale <1,1.25,1> }
    sphere {<0,0,0>,1.1 scale <.5,1.85,.5> translate <-.35,-1.85,-.3>}
    sphere {<0,0,0>,1.1 scale <.5,1.75,.5> translate <.35,-1.85,-.3>}
    sphere {<0,0,0>,1.1 scale <.75,1.75,.55> translate <0,-1.75,.25>}
    sphere {<0,0,0>,1 scale <.3,1,.35> translate <0,-3.75,-.25> texture {Barrel_Texture2}}
    cylinder {<0,0,0>,<0,-4.65,0>,.4 texture {Barrel_Texture2}}
    cylinder {<-.28,-3,.28>,<-.21,-4.65,.21>,.15}
    cylinder {<.28,-3,.28>,<.21,-4.65,.21>,.15}
    texture{SecundaryTexture}
}
#declare musloD= object {musloI}

