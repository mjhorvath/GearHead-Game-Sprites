//==================================================
//POV-Ray Materials list
//==================================================
//This file has been created by PoseRay v3.10.3.412
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//F601_B_POV_main.ini (initialization file - open this to render)
//F601_B_POV_scene.pov (scene setup of cameras, lights and geometry)
//F601_B_POV_geom.inc (geometry mesh)
//F601_B_POV_mat.inc (materials)
//METAL7.JPG
// 
 
#include "stdinc.inc"
 
//==================================================
//Map definitions
#declare p_map1=pigment {color rgb 1/2}
#declare p_map2=pigment {color rgb 1/2}
 
//==================================================
//Material definitions
#declare Metal_Brushed__opaque=
texture{pigment {color rgb <0.192156862745098,0,0.227450980392157> transmit  0} 
        finish{ambient 0}}
texture{pigment{p_map1} 
        finish{ phong 0.8980392 phong_size 22.23869 diffuse 0.6*1 ambient rgb <0,0,0> reflection{0 metallic}}}
#declare Metal_Brushed_= 
material{
texture{MTX}
}
//==================================================
#declare Material__37_= 
material{
texture{CTX}
}
//==================================================
#declare _08___Default_= 
material{
texture{HTX}
}
//==================================================
#declare _04___Default_= 
material{
texture{MTX}
}
//==================================================
#declare Material__63_= 
material{
texture{MTX}
}
//==================================================
#declare _03___Default_= 
material{
texture{MTX}
}
//==================================================
#declare _02___Default_= 
material{
texture{MTX}
}
//==================================================
#declare _01___Default_= 
material{
texture{MTX}
}
//==================================================
#declare _13___Default_= 
material{
texture{HTX}
}
//==================================================
#declare _17___Default_= 
material{
texture{HTX}
}
//==================================================
#declare _03___Default1_= 
material{
texture{HTX}
}
//==================================================
#declare _08___Default1_= 
material{
texture{MTX}
}
//==================================================
#declare _07___Default_= 
material{
texture{HTX}
}
//==================================================
#declare hfgh_= 
material{
texture{HTX}
}
//==================================================
#declare _14___Default_= 
material{
texture{HTX}
}
//==================================================
