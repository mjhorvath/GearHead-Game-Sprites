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
//btr_joust_mod_POV_main.ini (initialization file - open this to render)
//btr_joust_mod_POV_scene.pov (scene setup of cameras, lights and geometry)
//btr_joust_mod_POV_geom.inc (geometry mesh)
//btr_joust_mod_POV_mat.inc (materials)
// 
 
#include "colors.inc"
 
//==================================================
//Map definitions
 
//==================================================
//Material definitions
#declare Joust_blinn2SG_= 
material{
texture{ pigment {color rgb <1.00,1.00,0.00> transmit  0} 
        finish{specular 0 roughness 0.09632328 ambient rgb <0.00,0.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Joust_blinn2SG_= HMT;
//==================================================
#declare Joust_blinn1SG_= 
material{
texture{ pigment {color rgb <1.00,0.00,0.00> transmit  0} 
        finish{specular 0 roughness 0.09632328 ambient rgb <0.00,0.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Joust_blinn1SG_= MMT;
//==================================================
#declare Joust_phongE1SG_= 
material{
texture{ pigment {color rgb <0.00,1.00,0.00> transmit  0} 
        finish{specular 0 roughness 0.09632328 ambient rgb <0.00,0.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Joust_phongE1SG_= CMT;
//==================================================
#declare Joust_blinn3SG_= 
material{
texture{ pigment {color rgb <0.50,0.50,0.50> transmit  0} 
        finish{specular 0 roughness 0.09632328 ambient rgb <0.00,0.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Joust_blinn3SG_= GMT;
//==================================================
#declare Joust_blinn4SG_= 
material{
texture{ pigment {color rgb <1.00,0.00,0.00> transmit  0} 
        finish{specular 0 roughness 0.09632328 ambient rgb <0.00,0.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Joust_blinn4SG_= MMT;
//==================================================
