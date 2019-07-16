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
//gh2_gorilla_POV_main.ini (initialization file - open this to render)
//gh2_gorilla_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh2_gorilla_POV_geom.inc (geometry mesh)
//gh2_gorilla_POV_mat.inc (materials)
// 
 
#include "colors.inc"
 
//==================================================
//Map definitions
 
//==================================================
//Material definitions
#declare darkerred_= 
material{
texture{ pigment {color rgb <1.00,0.00,0.00> transmit  0} 
        finish{specular 1 roughness 0.09632328 ambient rgb <1.00,0.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare darkerred_= MMT;
//==================================================
#declare Red_= 
material{
texture{ pigment {color rgb <1.00,0.00,0.00> transmit  0} 
        finish{specular 1 roughness 0.09632328 ambient rgb <1.00,0.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Red_= MMT;
//==================================================
#declare Black_= 
material{
texture{ pigment {color rgb <0.00,0.00,0.00> transmit  0} 
        finish{specular 1 roughness 0.09632328 ambient rgb <0.00,0.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Black_= WMT;
//==================================================
#declare Dark_Yellow_= 
material{
texture{ pigment {color rgb <1.00,1.00,0.00> transmit  0} 
        finish{specular 1 roughness 0.09632328 ambient rgb <1.00,1.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Dark_Yellow_= HMT;
//==================================================
#declare dark_grey_= 
material{
texture{ pigment {color rgb <0.80,0.80,0.80> transmit  0} 
        finish{specular 1 roughness 0.09632328 ambient rgb <0.80,0.80,0.80> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare dark_grey_= GMT;
//==================================================
#declare Yellow_= 
material{
texture{ pigment {color rgb <1.00,1.00,0.00> transmit  0} 
        finish{specular 1 roughness 0.09632328 ambient rgb <1.00,1.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Yellow_= HMT;
//==================================================
#declare Dark_Green_= 
material{
texture{ pigment {color rgb <0.00,1.00,0.00> transmit  0} 
        finish{specular 1 roughness 0.09632328 ambient rgb <0.00,1.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare Dark_Green_= CMT;
//==================================================
#declare darkred_= 
material{
texture{ pigment {color rgb <1.00,0.00,0.00> transmit  0} 
        finish{specular 1 roughness 0.09632328 ambient rgb <1.00,0.00,0.00> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare darkred_= MMT;
//==================================================
#declare grey_= 
material{
texture{ pigment {color rgb <0.80,0.80,0.80> transmit  0} 
        finish{specular 1 roughness 0.09632328 ambient rgb <0.80,0.80,0.80> diffuse 0.6   reflection{0 } conserve_energy}}
}
#declare grey_= GMT;
//==================================================
