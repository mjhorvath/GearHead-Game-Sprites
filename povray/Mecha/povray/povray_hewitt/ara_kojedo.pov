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
//ara_kojedo_POV_main.ini (initialization file - open this to render)
//ara_kojedo_POV_scene.pov (scene setup of cameras, lights and geometry)
//ara_kojedo_POV_geom.inc (geometry mesh)
//ara_kojedo_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 13708
//Number of vertices............. 7311
//Number of normals.............. 11652
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 25
//Number of groups/meshes........ 119
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-217.5648,-1.523462,-729.0341)
//                      to x,y,z=(254.4117,486.2127,0.853576)
//                 size dx,dy,dz=(471.9765,487.7362,729.8876)
//                  center x,y,z=(18.42348,242.3446,-364.0902)
//                       diagonal 996.6867
//Surface area................... 983873.9
//             Smallest face area 1.538367E-5
//              Largest face area 2673.926
//Memory allocated for geometry.. 1 MByte
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W579 +H496 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#declare Show_AxisMarker = 0;
#include "GearHead.inc"
//#include "GearHead_nice_render.inc"
 
#include "colors.inc"
#include "skies.inc"
#include "stars.inc"
#include "textures.inc"
#include "ara_kojedo_POV_geom.inc" //Geometry

 
//Assembled object that is contained in ara_kojedo_POV_geom.inc
object
{
	ara_kojedo_
	translate <18.42348,1.523462,-364.0902> * -1
	scale 1/10	// was 1/12
	scale Scale_LDraw
//	rotate y * -45
	rotate y * clock * 360
}
//==================================================
