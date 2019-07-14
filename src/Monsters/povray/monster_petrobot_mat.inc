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
//petrobot_POV_main.ini (initialization file - open this to render)
//petrobot_POV_scene.pov (scene setup of cameras, lights and geometry)
//petrobot_POV_geom.inc (geometry mesh)
//petrobot_POV_mat.inc (materials)
//placeholder.png
// 
 
#include "colors.inc"
 
//==================================================
//Map definitions
#declare p_map1=pigment {image_map{png "gh_petrobot_placeholder.png" interpolate 2 transmit all 0 filter all 0} }
 
//==================================================
//Material definitions
#declare petrobot_auv_= 
material{
texture{ pigment{uv_mapping p_map1} 
//        finish{specular 1 roughness 0.00286312 ambient rgb <1.00,1.00,1.00> diffuse 0.6   reflection{0 } conserve_energy}}
        finish{Default_Finish}}
}
//==================================================
