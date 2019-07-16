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
//gh_skull_POV_main.ini (initialization file - open this to render)
//gh_skull_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh_skull_POV_geom.inc (geometry mesh)
//gh_skull_POV_mat.inc (materials)
//placeholder.png
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 628
//Number of vertices............. 316
//Number of normals.............. 316
//Number of UV coordinates....... 442
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.07132163,0.08865829)
//                        to u,v=(0.9773293,0.7420305)
//Bounding Box....... from x,y,z=(-0.3270563,0,-0.20711)
//                      to x,y,z=(0.3270563,0.339288,0.20711)
//                 size dx,dy,dz=(0.6541127,0.339288,0.41422)
//                  center x,y,z=(0,0.169644,0)
//                       diagonal 0.8453153
//Surface area................... 0.5476251
//             Smallest face area 1.615911E-5
//              Largest face area 0.007253507
//Memory allocated for geometry.. 61 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
//#declare Camera_Mode = 3;
//#declare Show_GridMarker = 0;
//#declare Show_BasicFloor = 0;
//#declare Show_AxisMarker = 1;
//#declare Show_HeightScale = 1;

#include "GearHead.inc"
#include "hov_skull_geom.inc" //Geometry

//Assembled object that is contained in gh_skull_POV_geom.inc
object{
      gh_skull_
	scale 3
	scale 7 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
