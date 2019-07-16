//==================================================
//POV-Ray Materials list
//==================================================
//This file has been created by PoseRay v3.11.0.436
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//Robo_Torso_POV_main.ini (initialization file - open this to render)
//Robo_Torso_POV_scene.pov (scene setup of cameras, lights and geometry)
//Robo_Torso_POV_geom.inc (geometry mesh)
//Robo_Torso_POV_mat.inc (materials)
// 
 
#include "stdinc.inc"
 
//==================================================
//Map definitions
 
//==================================================
//Material definitions
#declare Black_= 
material{
texture{ pigment {color rgb <0,0,0> transmit  0} 
        finish{specular 0 roughness 0.00286312 ambient rgb <0,0,0> diffuse 0.6  reflection{0 metallic} conserve_energy}}
}
#declare Black_= WMT;
//==================================================
#declare Green_= 
material{
texture{ pigment {color rgb <0.0941176470588235,0.549019607843137,0> transmit  0} 
        finish{specular 0.5435294 roughness 0.00286312 ambient rgb <0.192156862745098,0.823529411764706,0> diffuse 0.6  reflection{0 metallic} conserve_energy}}
}
#declare Green_= CMT;
//==================================================
#declare Red_= 
material{
texture{ pigment {color rgb <0.701960784313725,0.0666666666666667,0.0666666666666667> transmit  0} 
        finish{specular 0.2188235 roughness 0.00286312 ambient rgb <0.494117647058824,0,0> diffuse 0.6  reflection{0 metallic} conserve_energy}}
}
#declare Red_= MMT;
//==================================================
#declare Yellow_= 
material{
texture{ pigment {color rgb <0.803921568627451,0.674509803921569,0.0666666666666667> transmit  0} 
        finish{specular 0.8690588 roughness 0.00286312 ambient rgb <0.984313725490196,0.96078431372549,0.0627450980392157> diffuse 0.6  reflection{0 metallic} conserve_energy}}
}
#declare Yellow_= HMT;
//==================================================
