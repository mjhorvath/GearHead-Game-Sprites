

#version 3.7;
global_settings { assumed_gamma 1.0 }

//------------------------------------------
// SDL for generating Isometric View Game Tiles
// Bill Walker - 2016
//------------------------------------------

#include "colors.inc"
#include "debug.inc"
 Set_Debug (true)
#include "math.inc"
#include "rand.inc"
#include "shapes.inc"
#include "metals.inc"
#include "transforms.inc"

//###############################################
#declare XImageSize = 1024;
#declare YImageSize = 768;
//###############################################

light_source { <0, 50, 0>  color rgb <1, 1, 1>}

#declare Camera_Iso = camera {
                            location  <0, 0, -12>
                            //right    x*image_width/image_height
                            look_at   <0, 0, 0>
                            rotate x*30 rotate y*45 }


camera {Camera_Iso}

sky_sphere { pigment {Blue} }

//=======================================================================================================================

#declare TileTexture =
pigment {cylindrical frequency 1 turbulence 0
         color_map {[0.0 color Green * 0.5]
            [0.3 color Green * 0.5]
            [0.8 color Yellow * 0.1]
                    [1.0 color Yellow * 0.1]
  }//end of color_map
} // end of pigment

#declare Scale = 3;

#declare TileBox = box { 0, 1 translate <-0.5, -0.5, -0.5> pigment {TileTexture}
scale <Scale, 0.01, Scale>}

#declare PlainBox = box { 0, 1 translate <-0.5, -0.5, -0.5>}

#declare Box1 = intersection {object {PlainBox translate <-1, 0,  1>} object
{TileBox}}
#declare Box2 = intersection {object {PlainBox translate < 0, 0,  1>} object
{TileBox}}
#declare Box3 = intersection {object {PlainBox translate < 1, 0,  1>} object
{TileBox}}
#declare Box4 = intersection {object {PlainBox translate <-1, 0,  0>} object
{TileBox}}
#declare Box5 = intersection {object {PlainBox translate < 0, 0,  0>} object
{TileBox}}
#declare Box6 = intersection {object {PlainBox translate < 1, 0,  0>} object
{TileBox}}
#declare Box7 = intersection {object {PlainBox translate <-1, 0, -1>} object
{TileBox}}
#declare Box8 = intersection {object {PlainBox translate < 0, 0, -1>} object
{TileBox}}
#declare Box9 = intersection {object {PlainBox translate < 1, 0, -1>} object
{TileBox}}


//=============================


#declare Spacing = 0.1;


#local NrX = -1;     // start x
#local EndNrX = 2; // end   x
#while (NrX < EndNrX)

 #local NrZ = -1;     // start z
 #local EndNrZ = 1; // end   z
 #while (NrZ < EndNrZ)

  object{Box1 translate <Scale * NrX, 0, Scale * NrZ>}
  object{Box2 translate <Scale * NrX, 0, Scale * NrZ>}
  object{Box3 translate <Scale * NrX, 0, Scale * NrZ>}
  object{Box4 translate <Scale * NrX, 0, Scale * NrZ>}
  object{Box5 translate <Scale * NrX, 0, Scale * NrZ>}
  object{Box6 translate <Scale * NrX, 0, Scale * NrZ>}
  object{Box7 translate <Scale * NrX, 0, Scale * NrZ>}
  object{Box8 translate <Scale * NrX, 0, Scale * NrZ>}
  object{Box9 translate <Scale * NrX, 0, Scale * NrZ>}

  #local NrZ = NrZ + 1+Spacing;  // next Nr z
 #end // --------------- end of loop z

#declare NrX = NrX + 1+Spacing;  // next Nr x
#end // --------------- end of loop x


// 1,3,7,9
  object{Box1 translate <Scale * NrX, 0, Scale * NrZ>}
  object{Box3 translate <Scale * NrX-1, 0, Scale * NrZ>}
  object{Box7 translate <Scale * NrX, 0, Scale * NrZ+1>}
  object{Box9 translate <Scale * NrX-1, 0, Scale * NrZ+1>}

// 1,2,3,7,8,9
  object{Box1 translate <Scale * (NrX-2), 0, Scale * NrZ>}
  object{Box2 translate <Scale * (NrX-2), 0, Scale * NrZ>}
  object{Box3 translate <Scale * (NrX-2), 0, Scale * NrZ>}

  object{Box7 translate <Scale * (NrX-2), 0, Scale * NrZ+1>}
  object{Box8 translate <Scale * (NrX-2), 0, Scale * NrZ+1>}
  object{Box9 translate <Scale * (NrX-2), 0, Scale * NrZ+1>}


// 9, 7, 3, 1
  object{Box9 translate <Scale * (NrX-4), 0, Scale * NrZ+1>}
  object{Box7 translate <Scale * (NrX-3), 0, Scale * NrZ+1>}
  object{Box3 translate <Scale * (NrX-4), 0, Scale * NrZ>}
  object{Box1 translate <Scale * (NrX-3), 0, Scale * NrZ>}







