// ----------------------------------------

sky_sphere
{
  pigment
  {
    gradient y
    color_map { [0.0 color blue 0.6] [1.0 color rgb 1] }
  }
}
#declare Dune = quadric {  //Mmmmm next time i'll use scaled spheres ¿?
   <1,  0,  1>,
   <0,  0,  0>,
   <0, -1,  0>, 0
   scale <40.0, 10.0, 77.0>
   rotate <0.0, 0.0, 180.0>
}

union {
    plane { y, 0
    } //Floor
    object {Dune translate <-50,20,200>}
    object {Dune translate <70,25,350>}
    object {Dune translate <-350,20,700>}
    texture {
      pigment {color rgb <0.7,0.5,0.3>}
    #if (Turbo!=1)
    #if (Turbo!=2)
      normal {
         bumps 0.5
         scale 2.0
      }
      finish {
         ambient 0.1
         diffuse 0.7
      }
    #end
    #end
    }
}

#if (Turbo!=1)
#if (Turbo!=2)
    plane {y,500            //Clouds
        pigment {
            bozo
            turbulence .1
            color_map {
                [0.00 color Clear]
                [0.70 color Clear]
                [0.75 color rgbf <.7,.7,.7,.5>]
                [1.00 color White]
            }
        scale 150
        }
        finish {ambient .9}
     inverse
     no_shadow
    }
#end
#end


#if (Turbo=0)
fog {
    distance 2000
    colour rgbt <0.7, 0.7, 0.7, 0.5>
    turbulence 0.2
  }
#end
// ----------------------------------------

