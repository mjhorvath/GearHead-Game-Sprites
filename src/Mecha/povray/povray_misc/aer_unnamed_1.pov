//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.10.3.412
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//mynewship_POV_main.ini (initialization file - open this to render)
//mynewship_POV_scene.pov (scene setup of cameras, lights and geometry)
//mynewship_POV_geom.inc (geometry mesh)
//mynewship_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 7668
//Number of vertices............. 3836
//Number of normals.............. 4244
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-470.0813,-89.07607,-401.6797)
//                      to x,y,z=(470.0646,207.3535,603.928)
//                 size dx,dy,dz=(940.1458,296.4295,1005.608)
//                  center x,y,z=(-0.008346558,59.13869,101.1241)
//                       diagonal 1408.187
//Surface area................... 1559185
//             Smallest face area 3.770431
//              Largest face area 1500.685
//Memory allocated for geometry.. 618 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W640 +H480 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#declare Show_AxisMarker = 0;
//#include "GearHead_nice_render.inc"
#include "GearHead.inc"

#include "stdinc.inc"
#include "skies.inc"
#include "stars.inc"
#include "textures.inc"
#include "aer_unnamed_1_geom.inc" //Geometry

//Assembled object that is contained in mynewship_POV_geom.inc
object
{
	mynewship_
	translate y * 296.4295/2
	scale Scale_LDraw
	scale 1/16
	translate z * -10
	rotate y * 135
	rotate y * clock * 360
}
//==================================================
