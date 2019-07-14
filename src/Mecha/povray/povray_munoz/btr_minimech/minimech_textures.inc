#declare Mech_Texture1 =   // Semi-arid theatre
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color DarkGreen]
                [0.55 color DarkGreen]
                [0.57 color rgb <0.45,0.25,0.20>]
                [1.00 color rgb <0.45,0.25,0.20>]
            }
        }
        scale 1.5
    }
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color Clear]
                [0.70 color Clear]
                [0.71 color rgb <0.7,0.5,0.2>]
                [1.00 color rgb <0.7,0.5,0.2>]
            }
        }
        scale 1.5
        rotate 45
    }
#declare Mech_Texture2 =   // European/Woods theatre
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color DarkGreen]
                [0.55 color DarkGreen]
                [0.57 color rgb <0.45,0.25,0.20>]
                [1.00 color rgb <0.45,0.25,0.20>]
            }
        }
        scale 1.5
    }
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color Clear]
                [0.70 color Clear]
                [0.71 color rgb <0.2,0.2,0.2>]
                [1.00 color rgb <0.19,0.18,0.18>]
            }
        }
        scale 1.5
        rotate 45
    }

#declare Mech_Texture3 =   // Desert theatre
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color rgb <0.7,0.5,0.2>]
                [0.65 color rgb <0.7,0.5,0.2>]
                [0.67 color DarkGreen]
                [1.00 color DarkGreen]
            }
        }
        scale 1.5
    }
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color Clear]
                [0.75 color Clear]
                [0.76 color rgb <0.45,0.25,0.20>]
                [1.00 color rgb <0.45,0.25,0.20>]
            }
        }
        scale 1.5
        rotate 45
    }
#declare Mech_Texture4 =   // Snow theatre
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color rgb <1,1,1>]
                [0.75 color rgb <1,1,1>]
                [0.76 color rgb <0.39,0.50,0.39>]
                [1.00 color rgb <0.39,0.50,0.39>]
            }
        }
        scale 1.5
    }
    texture {
        pigment {
            bozo
            turbulence .025
            color_map {
                [0.00 color Clear]
                [0.80 color Clear]
                [0.81 color rgb <0.55,0.45,0.40>]
                [1.00 color rgb <0.55,0.45,0.40>]
            }
        }
        scale 1.5
        rotate 45
    }
#declare Mech_Texture5 = texture {  // Fancy quasiorganic Red/White texture
        pigment{
            bozo
            pigment_map {
                [.0 color White]
                [.1 color rgb <1,.5,.5>]
                [.18 color Red]
                [.45 color Red]
                [.65 color rgb <.5,0,0>]
                [.85 color rgb <.3,0,0>]
                [.9 color Black]
            }
            triangle_wave
            scale .5
        }
        normal { bumps 1 scale .2 }
    }


#ifndef (Barrel_Texture)
    #declare Barrel_Texture = texture {
    pigment{ color rgb <0.60,0.61,0.68>}
    finish{
        metallic
        ambient 0.2
        diffuse 0.7
        brilliance 6
        reflection 0.25
        phong 0.75
        phong_size 80
    }
}
#end

#ifndef (Barrel_Texture2)
    #declare Barrel_Texture2 = texture {
    pigment{ color rgb <0.15,0.155,0.17>}
    finish{
        metallic
        ambient 0.2
        diffuse 0.7
        brilliance 6
        reflection 0.1
        phong 0.65
        phong_size 65
    }
}
#end

#ifndef (Focus_Glass)
    #declare Focus_Glass =
    texture {
    pigment {
        gradient x
        color_map{
            [0.000 rgbf <0.0, 0.0, 0.0, 0.0>]
            [0.020 rgbf <0.2, 0.2, 0.2, 0.0>]
            [0.050 rgbf <0.98, 0.98, 0.98, 0.9>]
            [0.950 rgbf <0.98, 0.98, 0.98, 0.9>]
            [0.970 rgbf <0.2, 0.2, 0.2, 0.0>]
            [1.000 rgbf <0.0, 0.0, 0.0, 0.0>]
             }
    scale .1
    }
    finish  {
        ambient 0.1
        diffuse 0.1
        reflection 0.1
        refraction 0.9
        ior 1.45
        specular 0.8
        roughness 0.0003
        phong 1
        phong_size 400
     }
}
#end

