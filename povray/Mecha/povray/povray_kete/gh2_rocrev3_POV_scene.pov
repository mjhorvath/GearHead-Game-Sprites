//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.12.2.456
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//gh2_rocrev3_POV_main.ini (initialization file - open this to render)
//gh2_rocrev3_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh2_rocrev3_POV_geom.inc (geometry mesh)
//gh2_rocrev3_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 38282
//Number of vertices............. 19587
//Number of normals.............. 21368
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 7
//Number of groups/meshes........ 13
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-2.596236,-4.375617,-1.099771)
//                      to x,y,z=(2.596236,1.070229,2.147738)
//                 size dx,dy,dz=(5.192472,5.445846,3.247509)
//                  center x,y,z=(-2.384186E-7,-1.652694,0.5239836)
//                       diagonal 8.195445
//Surface area................... 112.676
//             Smallest face area 9.924816E-7
//              Largest face area 1.271196
//Memory allocated for geometry.. 3 MBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

//#include "GearHead_nice_render.inc"
#include "GearHead.inc"
#include "All_Textures.inc"
#include "gh2_rocrev3_POV_geom.inc" //Geometry

//Assembled object that is contained in gh2_rocrev3_POV_geom.inc
object
{
	gh2_rocrev3_
	translate y * 4.375617
	scale 8
	rotate y * clock * 360
}
//==================================================
