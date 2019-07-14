
// ----------------- Pieces -----------------------

#declare head=union {  // *****HEAD*****
    #if (HeadModel=0)
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
    merge {
        box {<-.5,1,0>,<.5,.5,1.5>}
        cylinder {<0,.5,0>,<0,1,0>,.5}
        pigment {color rgbf <0,.80,.10,.80>}
    }
    union {
        sphere {<0,.875,2>,.45 scale <.75,1,1> translate x*-1}
        sphere {<0,.875,2>,.45 scale <.75,1,1> translate x*1}
        box {<-1,.875,1.9>,<-1.20,2.5,2.1>}
        box {<1,.875,1.9>,<1.20,2.5,2.1>}
        texture {Barrel_Texture2}
        }
    cylinder {<0,-1.5,1.75>,<0,0,1.75>,.65 texture {Barrel_Texture2}}
    #else
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
            cylinder {<.6,.875,2>,<.6,.875,-.5>,.4}
            triangle {<-.75,1,0>,<-.75,0,0>,<-1,1.25,2>} //  This is not a very good solution but it works
            triangle {<-1,.25,2>,<-.75,0,0>,<-1,1.25,2>} //  Ignore the warning
            #debug "\n Ignore the warning \n"
            cylinder {<.5,.2,0>,<.5,.2,-.65>,.2}
            cylinder {<-.5,.2,0>,<-.5,.2,-.65>,.2}
            cylinder {<-.5,.65,0>,<-.5,.65,-.65>,.2}
            cylinder {<-.5,1.1,0>,<-.5,1.1,-.65>,.2}
        }
        cylinder {<.65,.875,-.6>,<.65,.875,-.77>,.35 texture {Barrel_Texture2}}
    }
    union {
        sphere {<0,.875,2>,.45 scale <.75,1,1> translate x*-1}
        sphere {<0,.875,2>,.45 scale <.75,1,1> translate x*1}
        box {<-1,.875,1.9>,<-1.20,2.5,2.1>}
        box {<1,.875,1.9>,<1.20,2.5,2.1>}
        texture {Barrel_Texture2}
    }
    difference {
         union {
            cylinder {<.5,.2,-.6>,<.5,.2,-.77>,.15}
            cylinder {<-.5,.2,-.6>,<-.5,.2,-.77>,.15}
            cylinder {<-.5,.65,-.6>,<-.5,.65,-.77>,.15}
            cylinder {<-.5,1.1,-.6>,<-.5,1.1,-.77>,.15}
            texture {Barrel_Texture}
        }
         union{
            cylinder {<.5,.2,-.651>,<.5,.2,-.78>,.1}
            cylinder {<-.5,.2,-.651>,<-.5,.2,-.78>,.1}
            cylinder {<-.5,.65,-.651>,<-.5,.65,-.78>,.1}
            cylinder {<-.5,1.1,-.651>,<-.5,1.1,-.78>,.1}
            texture {Barrel_Texture2}
        }
    }
    difference {
        cylinder {<.65,.875,-.5>,<.65,.875,-.75>,.38}
        cylinder {<.65,.875,-.6>,<.65,.875,-.77>,.35}
        texture {Barrel_Texture2}
    }
    cylinder {<.65,.875,-.65>,<.65,.875,-.73>,.35
        pigment {color rgbf <0,1,0,.75>}}
    box {<.67,1.225,-.731>,<.63,.525,-.65> pigment {Black}}
    box {<.3,.855,-.731>,<.95,.895,-.65> pigment {Black}}
    cylinder {<0,-1.5,1.75>,<0,0,1.75>,.65 texture {Barrel_Texture2}}
    #end
    translate <0,1,-1.75>
    scale .85
}



#declare Fire = object {
sphere { 0, 1
  hollow
  texture {
    pigment { colour Clear }
    /*halo {
    cubic
      max_value 3
      spherical_mapping
      glowing
      colour_map {
        [0 color rgbt <1, 0, 0, 1> ]
        [1 color rgbt <1, 1, 0, 0> ]
      }
      turbulence 1.5
      samples 30
    }
    halo {
    cubic
      max_value 3
      spherical_mapping
      glowing
      colour_map {
        [0 color rgbt <1, 0, 0, 1> ]
        [1 color rgbt <1, 1, 0, 0> ]
      }
      turbulence 1.05
      samples 30
      scale .5
      rotate  y*45
      translate y*1
    }    */
  }
}
}

#declare Gatling = union {  //  ***** Weapon *****
    #declare Count = 0
    #while (Count <11)
    difference {
        cylinder {<-1,.9,0>,<-15,.9,0>,.20 rotate Count*x*36 texture {Barrel_Texture} }
        cylinder {<-2,.9,0>,<-16,.9,0>,.19 rotate Count*x*36 texture {Barrel_Texture2} }
    }
    #declare Count = Count +1
    #end
        cone {<-1.25,0,0>,1.5,<-.75,0,0>,1 }
        cylinder {<-3,0,0>,<-1.25,0,0>,1.5 }
        cylinder {<-4.5,0,0>,<-4.75,0,0>,1.75 texture {Barrel_Texture2} }
        cylinder {<-3,0,0>,<-5,0,0>,1.5 texture {Barrel_Texture2} }
        cylinder {<-8.875,0,0>,<-9.125,0,0>,1.5 texture {Barrel_Texture2} }
        cylinder {<-13,0,0>,<-13.25,0,0>,1.5 texture {Barrel_Texture2} }
    cylinder {<-1,0,0>,<-13.26,0,0>,.20 texture {Barrel_Texture}} //Barrels' Axis
    sphere {<-13.26,0,0>,.20 texture {Barrel_Texture2}}
    sphere {0,1 texture {Barrel_Texture2}}
    scale .5
    rotate z*-90
}
#declare BigGun= union {   //  ***** Weapon *****
    sphere {0,.5 texture {Barrel_Texture2}}
    cylinder {<0,0,0>,<0,-1.5,0>,.4 texture {Barrel_Texture2}}
    box {<-.45,-1,.65>,<.45,-5,-1.05>}
    cylinder {<0,-1,-1.05>,<0,-5,-1.05>,.45}
    cylinder {<0,-1,0>,<0,-5,0>,.45 scale <1,1,.35> translate <0,0,.65>}
    cone {<0,-.625,0>,.65,<0,-.45,0>,.5 }
    cylinder {<0,-2.25,0>,<0,-.625,0>,.65 }
    sphere {<0,-2.25,0>,.65}
    box {<-.05,-5.4,.53><.05,-4.5,.60> texture {Barrel_Texture}}
    box {<-.05,-5.5,.53><.05,-5.35,.65> texture {Barrel_Texture}}
    difference {
        cylinder {<0,-5.5,.25>,<0,-4.499,.25>,.3 texture {Barrel_Texture}}
        cylinder {<0,-5.6,.25>,<0,-4.499,.25>,.2 texture {Barrel_Texture2}}
    }
    difference {
        cylinder {<0,-5.5,-.45>,<0,-4.499,-.45>,.2 texture {Barrel_Texture}}
        cylinder {<0,-5.6,-.45>,<0,-4.499,-.45>,.13 texture {Barrel_Texture2}}
    }
    rotate z*180
}

#declare forearmL =
    #if (LeftHandWeapon=0)
    object {Gatling}
    #else
    object {BigGun}
    #end
#declare forearmR =
    #if (RightHandWeapon=0)
        object {Gatling}
    #else
        object {BigGun}
    #end

#declare handL= difference { // there is no need for hands now
    sphere {0,.5}
    sphere {0,1}
}
#declare handR= difference {  // there is no need for hands now
    sphere {0,.5}
    sphere {0,1}
}

#declare torso= union {     // ****** CHEST ******
    cylinder {<0,-1.5,0>,<0,2.5,0>,1.25 scale <1,1,.8> texture{Barrel_Texture2}}
    superellipsoid {<.5,.5> scale <3.75,1.5,1.35> translate <0,3.75,0>}
    #declare Count = 0
    #while (Count <18)
    cylinder {<0,-1.5+Count*.25,0>,<0,-1.35+Count*.25,0>,1.3 scale <1,1,.8> texture{Barrel_Texture}}
    #declare Count = Count +1
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
    union {
        difference {
            union {
                cylinder {<-2.9,5.5,-1.5>,<-2.9,5.5,1.5>,.5}
                cylinder {<-1.5,5.5,-1.5>,<-1.5,5.5,1.5>,.5}
                box {<-3,6,-1.50>,<-1.5,5,1.5>}
                sphere {<-2.9,5.5,1.5>,.5 }
                sphere {<-1.5,5.5,1.5>,.5 }
                cylinder {<-2.9,5.5,1.5>,<-1.5,5.5,1.5>,.5}
                cylinder {<-2.8,5.5,-1.6>,<-2.8,5.5,0>,.45 texture {Barrel_Texture2}}
                cylinder {<-1.6,5.5,-1.6>,<-1.6,5.5,0>,.42 texture {Barrel_Texture2}}
            }
            #if (Shoulders=0)
            sphere {<-2.8,5.5,-1.6>,.43
                             texture {pigment {White} finish {reflection .8}}
            }
            sphere {<-1.6,5.5,-1.6>,.40
                             texture {pigment {White} finish {reflection .8}}
            }
            #else
            cylinder {<-2.8,5.5,-2.6>,<-2.8,5.5,1>,.40 texture {Barrel_Texture2}}
            cylinder {<-1.6,5.5,-2.6>,<-1.6,5.5,1>,.37 texture {Barrel_Texture2}}
            #end
        }
        #if (Shoulders=0)
        sphere {<0,0,0>,.43
            texture {Focus_Glass}
            scale <1,1,.25>
            translate <-2.8,5.5,-1.6>
            }
        sphere {<0,0,0>,.40
            texture {pigment {rgbf <1,0,0,1>}}
            texture {
                Focus_Glass
                }
            scale <1,1,.25>
            translate <-1.6,5.5,-1.6>
            }
        #else
                sphere {<0,0,0>,.40
            texture {pigment {White}}
            scale <1,1,3>
            translate <-2.8,5.5,-.75>
        }
        sphere {<0,0,0>,.37
            texture {pigment {White}}
            scale <1,1,3>
            translate <-1.6,5.5,-.75>
        }
        #end
    }
    union {
        difference {
            union {
                cylinder {<2.9,5.5,-1.5>,<2.9,5.5,1.5>,.5}
                cylinder {<1.5,5.5,-1.5>,<1.5,5.5,1.5>,.5}
                box {<3,6,-1.50>,<1.5,5,1.5>}
                sphere {<2.9,5.5,1.5>,.5 }
                sphere {<1.5,5.5,1.5>,.5 }
                cylinder {<2.9,5.5,1.5>,<1.5,5.5,1.5>,.5}
                cylinder {<2.8,5.5,-1.6>,<2.8,5.5,0>,.45 texture {Barrel_Texture2}}
                cylinder {<1.6,5.5,-1.6>,<1.6,5.5,0>,.42 texture {Barrel_Texture2}}
            }
            #if (Shoulders=0)
            sphere {<2.8,5.5,-1.6>,.43
                             texture {pigment {White} finish {reflection .8}}
            }
            sphere {<1.6,5.5,-1.6>,.40
                             texture {pigment {White} finish {reflection .8}}
            }
            #else
            cylinder {<2.8,5.5,-2.6>,<2.8,5.5,1>,.40 texture {Barrel_Texture2}}
            cylinder {<1.6,5.5,-2.6>,<1.6,5.5,1>,.37 texture {Barrel_Texture2}}
            #end
        }
        #if (Shoulders=0)
        sphere {<0,0,0>,.43
            texture {Focus_Glass}
            scale <1,1,.25>
            translate <2.8,5.5,-1.6>
        }
        sphere {<0,0,0>,.40
            texture {pigment {rgbf <0,0,1,1>}}
            texture {
                Focus_Glass
                }
            scale <1,1,.25>
            translate <1.6,5.5,-1.6>
        }
        #else
        sphere {<0,0,0>,.40
            texture {pigment {White}}
            scale <1,1,3>
            translate <2.8,5.5,-.75>
        }
        sphere {<0,0,0>,.37
            texture {pigment {White}}
            scale <1,1,3>
            translate <1.6,5.5,-.75>
        }
        #end
    }
    box {<-1,2.45,1.65>,<1,6.05,2.25> texture {Barrel_Texture2}}
    superellipsoid {<.5,.5> scale <.85,1.75,.6> translate <0,4.25,2.25>}

    #if (Wings=1)
    object {                             // left Wing
    difference {
        box {<-11,-3.5,-.15>,<0,5.75,.15>}
        plane {<6.25,-11,0>,0 inverse translate y*3.5}
                        // hard work remembering Calculus classes ;-)
        plane {<7,-11,0>,0  translate y*6.25}
    }
    rotate y*45
    translate <-1,0,1.95>
    }
    object {                             // Right Wing
    difference {
        box {<-11,-3.5,-.15>,<0,5.75,.15>}
        plane {<6.25,-11,0>,0 inverse translate y*3.5}
                        // hard work renembering Calculus classes ;-)
        plane {<7,-11,0>,0  translate y*6.25}
    }
    rotate y*135
    translate <1,0,1.95>
    }
    #end
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
            sphere {<-1,0,0>, .45 texture {Barrel_Texture2} }
        }
        cylinder {<0,-1.1,-2>,<0,-1,2>,.75 }
    }
    texture{MainTexture}
    scale 1.5
    rotate x*180
}

#declare shoulderpadL= object {shoulderpadR rotate y*180}


#declare upperarmL = union {
    sphere {0,.5 scale <1,2.25,.8> translate <0,-1.1,-.35>}
    sphere {0,.5 scale <1,2.25,.8> translate <0,-1.1,.35>}
    sphere {<0,-2.25,0>,.5 texture{MainTexture}}
    scale 1.5
    rotate x*180
    texture{SecundaryTexture}
}

#declare upperarmR = object {upperarmL rotate y*180}

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

