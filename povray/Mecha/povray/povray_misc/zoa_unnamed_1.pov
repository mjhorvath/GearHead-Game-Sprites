// by fuxer at turbosquid.com

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
//robot_POV_main.ini (initialization file - open this to render)
//robot_POV_scene.pov (scene setup of cameras, lights and geometry)
//robot_POV_geom.inc (geometry mesh)
//robot_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 2006
//Number of vertices............. 1137
//Number of normals.............. 3070
//Number of UV coordinates....... 1137
//Number of lines................ 0
//Number of materials............ 4
//Number of groups/meshes........ 4
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(-3.349938,-3.03)
//                        to u,v=(4.349938,2.03)
//Bounding Box....... from x,y,z=(-1.084714,-3.849938,-2.53)
//                      to x,y,z=(1.084714,3.849938,2.53)
//                 size dx,dy,dz=(2.169428,7.699876,5.06)
//                  center x,y,z=(0,0,0)
//                       diagonal 9.465628
//Surface area................... 45.64304
//             Smallest face area 0.0007024409
//              Largest face area 0.2327387
//Memory allocated for geometry.. 280 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W579 +H477 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#include "GearHead.inc"
//#include "GearHead_nice_render.inc"

#include "colors.inc"
#include "skies.inc"
#include "stars.inc"
#include "textures.inc"
#include "zoa_unnamed_1_geom.inc" //Geometry

//Assembled object that is contained in robot_POV_geom.inc
object
{
	robot_
	rotate z * -90
	rotate x * 90
	translate y * 7.699876/3
	scale Scale_LDraw
	scale 15
	rotate y * -45
	rotate y * clock * 360
}
//==================================================
