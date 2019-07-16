//==================================================
//POV-Ray Materials list
//==================================================
//This file has been created by PoseRay v3.12.2.456
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//gh_f_shopkeeper_POV_main.ini (initialization file - open this to render)
//gh_f_shopkeeper_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh_f_shopkeeper_POV_geom.inc (geometry mesh)
//gh_f_shopkeeper_POV_mat.inc (materials)
//gh-f-shopkeeper-texture.png
// 
 
#include "colors.inc"
 
//==================================================
//Map definitions
#declare p_map1=pigment {image_map{jpeg "cha_f_shopkeeper_texture.jpg" interpolate 2 transmit all 0 filter all 0} }
 
//==================================================
//Material definitions
#declare gh_f_shopkeeper_auv_= 
material{
texture{ pigment{uv_mapping p_map1} 
        finish{Default_Finish}}
}
//==================================================
