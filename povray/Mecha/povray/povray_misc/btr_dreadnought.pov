// by muffins at turbosquid.com

//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.8.18.390
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//Dreadnought_POV_main.ini (initialization file - open this to render)
//Dreadnought_POV_scene.pov (scene setup of cameras, lights and geometry)
//Dreadnought_POV_geom.inc (geometry mesh)
//Dreadnought_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 12506
//Number of vertices............. 7227
//Number of normals.............. 15045
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 16
//Number of groups/meshes........ 24
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-1.372681,-4.189911,-1.827698)
//                      to x,y,z=(3.475708,1.323425,1.938385)
//                 size dx,dy,dz=(4.848389,5.513336,3.766083)
//                  center x,y,z=(1.051514,-1.433243,0.05534363)
//                       diagonal 8.251492
//Surface area................... 231.4407
//             Smallest face area 3.248835E-6
//              Largest face area 1.22982
//Memory allocated for geometry.. 1 MByte
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W579 +H477 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#include "gearhead.inc"
#include "btr_dreadnought_geom.inc" //Geometry
 
/*
//CAMERA PoseRayCAMERA
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <3.28125E-7,-2.021484E-7,16.50299>
        look_at <3.28125E-7,-2.021484E-7,15.50299>
        angle 30.10781 // horizontal FOV angle
        rotate <0,0,1.313645> //roll
        rotate <-14.77479,0,0> //pitch
        rotate <0,-142.355,0> //yaw
        translate <1.051514,-1.433243,0.05534363>
        }
*/
//Assembled object that is contained in Dreadnought_POV_geom.inc

object
{
	Dreadnought_
	translate <1.051514,-1.433243,0.05534363>*-1
	translate y*5.513336/2
	translate z * -0.6
	scale Scale_LDraw
	scale 8
	rotate y * 135
	rotate y * clock * 360
}
//==================================================
