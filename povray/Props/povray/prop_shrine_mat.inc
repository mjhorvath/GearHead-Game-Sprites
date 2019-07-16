//==================================================
//POV-Ray Materials list
//==================================================
//This file has been created by PoseRay v3.8.18.390
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//shg00_POV_main.ini (initialization file - open this to render)
//shg00_POV_scene.pov (scene setup of cameras, lights and geometry)
//shg00_POV_geom.inc (geometry mesh)
//shg00_POV_mat.inc (materials)
// 
 
 
//==================================================
//Map definitions
 
//==================================================
//Material definitions
#declare Default_= 
texture{pigment {gamma_color_adjust(<1,1,1>) transmit  0} 
//        finish{phong 0.2980392 phong_size 36.25229 diffuse 0.6*1 ambient rgb <0,0,0> reflection{0 }}
        finish{Default_Finish}
}

//==================================================
