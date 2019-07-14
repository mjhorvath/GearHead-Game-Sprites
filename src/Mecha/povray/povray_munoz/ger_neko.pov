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
//gh_neko_POV_main.ini (initialization file - open this to render)
//gh_neko_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh_neko_POV_geom.inc (geometry mesh)
//gh_neko_POV_mat.inc (materials)
//placeholder.png
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 764
//Number of vertices............. 384
//Number of normals.............. 384
//Number of UV coordinates....... 652
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.01055435,0.02233395)
//                        to u,v=(0.9901373,0.938662)
//Bounding Box....... from x,y,z=(-0.340169,0,-0.3187918)
//                      to x,y,z=(0.340169,0.475614,0.2952937)
//                 size dx,dy,dz=(0.680338,0.475614,0.6140856)
//                  center x,y,z=(0,0.237807,-0.01174906)
//                       diagonal 1.032555
//Surface area................... 0.7741793
//             Smallest face area 1.129802E-5
//              Largest face area 0.007782925
//Memory allocated for geometry.. 77 KBytes
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
#include "ger_neko_geom.inc" //Geometry

//Assembled object that is contained in gh_neko_POV_geom.inc
object{
      gh_neko_
	scale 2.2
	scale 10 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
